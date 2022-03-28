import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:logger/logger.dart';

class ScheduleService {
  final _logger = GetIt.instance.get<Logger>();

  Future<ScheduleResponse> getScheduleByTutorId({String id = ""}) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    var tutorScheduleJson = await rootBundle.loadString("assets/data/schedule.json");

    var scheduleResponse = ScheduleResponse.fromJson(
        jsonDecode(tutorScheduleJson.replaceAll("\n", "")));

    var schedules = scheduleResponse.data;

    schedules = schedules?.where((element) => element.startTimestamp! >= DateTime.now().millisecondsSinceEpoch).toList();
    schedules?.sort((a, b) => a.startTimestamp?.compareTo(b.startTimestamp ?? 0) ?? 0);

    scheduleResponse.data = schedules;

    _logger.i("Get schedule, found: ${scheduleResponse.data?.length} items");

    return scheduleResponse;
  }
}
