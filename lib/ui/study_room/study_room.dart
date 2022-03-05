import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:recase/recase.dart';

import '../../generated/l10n.dart';

class StudyRoom extends StatefulWidget {
  const StudyRoom({Key? key}) : super(key: key);

  @override
  State<StudyRoom> createState() => _StudyRoomState();
}

class _StudyRoomState extends State<StudyRoom> {
  Duration waitTime = Duration.zero;
  late Timer _waitTimer;

  @override
  void initState() {
    _waitTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        waitTime = Duration(seconds: waitTime.inSeconds + 1);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _waitTimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.studyRoom.titleCase),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.current.waitTime,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                DateTimeUtils.casualHourFormatOf(waitTime),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
