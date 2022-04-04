import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/models/responses/login_response.dart';
import 'package:leet_tutur/utils/map_extensions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _logger = GetIt.instance.get<Logger>();
  final _dio = GetIt.instance.get<Dio>();

  Future<LoginResponse> loginAsync(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      var res = await _dio
          .post("/auth/login", data: {"email": email, "password": password});

      var loginResponse = LoginResponse.fromJson(res.data);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
          SharedPreferencesConstants.loginResponse, jsonEncode(loginResponse));

      _logger.i("""
          Login successfully. Save login response to shared preferences. 
          Key: ${SharedPreferencesConstants.loginResponse}. 
          Value: 
          ${loginResponse.toJson().beautifyJson()}
          """);

      return loginResponse;
    } on DioError catch (e) {
      _logger.e("Login failed. ${e.message}");

      rethrow;
    }
  }

  Future<LoginResponse> retrieveLocalLoginResponseAsync() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString =
        prefs.getString(SharedPreferencesConstants.loginResponse) ?? "{}";

    _logger.i(
        "Read from shared preferences. Key: ${SharedPreferencesConstants.loginResponse}. Value: $jsonString");

    return LoginResponse.fromJson(jsonDecode(jsonString));
  }
}
