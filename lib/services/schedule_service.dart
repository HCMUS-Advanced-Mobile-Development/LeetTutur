import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/requests/booking_list_request.dart';
import 'package:leet_tutur/models/responses/booking_list_response.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:logger/logger.dart';

class ScheduleService {
  final _dio = GetIt.instance.get<Dio>();
  final _logger = GetIt.instance.get<Logger>();

  Future<ScheduleResponse> getScheduleByTutorIdAsync({String id = ""}) async {
    var res = await _dio.post("/schedule", data: {
      "tutorId": id,
    });

    // This operation is very heavy
    var scheduleResponse = await compute((Response dioResponse) {
      var scheduleResponse = ScheduleResponse.fromJson(dioResponse.data);

      var schedules = scheduleResponse.data
          ?.where((element) =>
              element.startTimestamp! >=
              DateTimeUtils.startOfToday().millisecondsSinceEpoch)
          .toList();

      schedules?.sort(
          (a, b) => a.startTimestamp?.compareTo(b.startTimestamp ?? 0) ?? 0);

      scheduleResponse.data = schedules;

      return scheduleResponse;
    }, res);

    _logger.i("Get schedule, found: ${scheduleResponse.data?.length} items");

    return scheduleResponse;
  }

  Future<BookingListResponse> getBookingsListAsync({BookingListRequest? request}) async {
    var dioRes = await _dio.get("/booking/list/student", queryParameters: {
      "page": request?.page ?? 1,
      "perPage": request?.perPage ?? 12,
      "dateTimeGte": request?.dateTimeGte ??
          DateTime.now().millisecondsSinceEpoch,
      "orderBy": request?.orderBy ?? "meeting",
      "sortBy": request?.sortBy ?? "asc",
    });

    var bookingListResponse = BookingListResponse.fromJson(dioRes.data);

    _logger.i(
        "Get booking list. Found: ${bookingListResponse.data?.rows?.length} items");

    return bookingListResponse;
  }

  Future<Duration> getTotalLearnedHoursAsync() async {
    var dioRes = await _dio.get("/call/total");
    var totalMinute = dioRes.data["total"] as int;

    _logger.i("Get total hours: ${totalMinute / 60}");

    return Duration(minutes: totalMinute);
  }

  Future<BookingListResponse> getLearnHistoryAsync(
      {BookingListRequest? bookingListRequest}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var bookingListResponseJson =
        await rootBundle.loadString("assets/data/learn_history.json");
    var bookingListResponse = BookingListResponse.fromJson(
        jsonDecode(bookingListResponseJson.replaceAll("\n", "")));

    _logger.i(
        "Get history list. Found: ${bookingListResponse.data?.rows?.length} items");

    return bookingListResponse;
  }
}
