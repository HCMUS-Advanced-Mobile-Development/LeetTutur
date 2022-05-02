import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/models/meet_info.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:logger/logger.dart';
import 'package:recase/recase.dart';
import 'package:leet_tutur/utils/map_extensions.dart';

class StudyRoom extends StatefulWidget {
  const StudyRoom({Key? key}) : super(key: key);

  @override
  State<StudyRoom> createState() => _StudyRoomState();
}

class _StudyRoomState extends State<StudyRoom> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();
  final _logger = GetIt.instance.get<Logger>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.studyRoom.titleCase),
      ),
      body: Observer(
        builder: (context) {
          if (_scheduleStore.selectedClass != null) {
            _joinMeeting(_scheduleStore.selectedClass!);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  Future _joinMeeting(BookingInfo bookingInfo) async {
    var token = bookingInfo.studentMeetingLink
        ?.substring(bookingInfo.studentMeetingLink!.indexOf("=") + 1);
    var decodedStr = const Utf8Decoder().convert(
      base64Decode(
        base64.normalize(token?.split(".")[1] ?? ""),
      ),
    );

    var meetInfo = MeetInfo.fromJson(jsonDecode(decodedStr));
    _logger.i(meetInfo.toJson().beautifyJson());

    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: meetInfo.room ?? "")
      ..serverURL = "https://meet.lettutor.com"
      ..subject = "${meetInfo.room}"
      ..userDisplayName = "${meetInfo.userCall?.name}"
      ..userEmail = "${meetInfo.userCall?.email}"
      ..token = token
      ..audioOnly = true
      ..audioMuted = true
      ..videoMuted = true
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": "${meetInfo.roomName}",
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": "${meetInfo.userCall?.name}"}
      };

    _logger.i("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            _logger.i("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            _logger.i("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            _logger.i("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  _logger.i("readyToClose callback");
                }),
          ]),
    );

    Navigator.of(context).pop();
  }
}
