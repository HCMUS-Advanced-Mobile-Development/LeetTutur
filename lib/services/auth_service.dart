import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/models/responses/auth_response.dart';
import 'package:leet_tutur/utils/map_extensions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _logger = GetIt.instance.get<Logger>();
  final _dio = GetIt.instance.get<Dio>();

  Future<AuthResponse> loginAsync(String email, String password) async {
    try {
      var res = await _dio
          .post("/auth/login", data: {"email": email, "password": password});

      var loginResponse = AuthResponse.fromJson(res.data);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
          SharedPreferencesConstants.authResponse, jsonEncode(loginResponse));

      _logger.i("""
          Login successfully. Save login response to shared preferences. 
          Key: ${SharedPreferencesConstants.authResponse}. 
          Value: 
          ${loginResponse.toJson().beautifyJson()}
          """);

      return loginResponse;
    } on DioError catch (e) {
      _logger.e("Login failed. ${e.message}");

      rethrow;
    }
  }

  Future<AuthResponse> retrieveLocalLoginResponseAsync() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString =
        prefs.getString(SharedPreferencesConstants.authResponse) ?? "{}";

    _logger.i(
        "Read from shared preferences. Key: ${SharedPreferencesConstants.authResponse}. Value: $jsonString");

    return AuthResponse.fromJson(jsonDecode(jsonString));
  }

  Future<AuthResponse> registerAsync(String email, String password) async {
    try {
      var res = await _dio.post("/auth/register", data: {
        "email": email,
        "password": password,
      });

      var authRes = AuthResponse.fromJson(res.data);

      _logger.i("""
          Register successfully.
          ${authRes.toJson().beautifyJson()}
          """);

      return authRes;
    } on DioError catch (e) {
      _logger.e("Register failed. ${e.message}");
      rethrow;
    }
  }

  Future forgotPasswordAsync(String email) async {
    try {
      var res = await _dio.post("/user/forgotPassword", data: {
        "email": email,
      });

      _logger.i("""
          Forget successfully.
          ${res.data}
          """);

    } on DioError catch (e) {
      _logger.e("Can't forget password. ${e.message}");
      rethrow;
    }
  }
}
