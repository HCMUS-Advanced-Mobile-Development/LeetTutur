import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/requests/base_request.dart';
import 'package:leet_tutur/models/responses/course_category_response.dart';
import 'package:leet_tutur/models/responses/course_response.dart';
import 'package:logger/logger.dart';

class CourseService {
  final _dio = GetIt.instance.get<Dio>();
  final _logger = GetIt.instance.get<Logger>();

  Future<CourseResponse> getCourseAsync({BaseRequest? request}) async {
    var dioRes = await _dio.get("/course", queryParameters: {
      "page": request?.page ?? 1,
      "size": request?.size ?? 100,
    });

    var response = CourseResponse.fromJson(dioRes.data);

    _logger.i("Get course. Found ${response.data?.rows?.length} items");

    return response;
  }

  Future<CourseCategoryResponse> getCourseCategoriesAsync() async {
    var dioRes = await _dio.get("/content-category");

    var response = CourseCategoryResponse.fromJson(dioRes.data);

    _logger.i("Get course category. Found ${response.rows?.length} items");

    return response;
  }
}
