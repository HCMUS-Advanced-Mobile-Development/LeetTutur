import 'package:dio/dio.dart';
import 'package:leet_tutur/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiUtils {
  static Dio constructDio() {
    final dio = Dio()
      ..options.baseUrl = ApiConstants.baseURL
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        maxWidth: 90,
      ));

    return dio;
  }
}
