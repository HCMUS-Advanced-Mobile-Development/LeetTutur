import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/requests/base_request.dart';
import 'package:leet_tutur/models/responses/course_response.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart' show rootBundle;

class CourseService {
  final _logger = GetIt.instance.get<Logger>();

  Future<CourseResponse> getCourseAsync({BaseRequest? request}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var responseJson = await rootBundle.loadString("assets/data/course.json");
    var response = CourseResponse.fromJson(jsonDecode(responseJson.replaceAll("\n", "")));

    _logger.i("Get course. Found ${response.data?.rows?.length} items");

    return response;
  }
}
