import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/models/requests/change_password_request.dart';
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

  Future<AuthResponse> refreshTokenAsync() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var jsonString =
          prefs.getString(SharedPreferencesConstants.authResponse) ?? "{}";

      var authRes = AuthResponse.fromJson(jsonDecode(jsonString));
      var refreshToken = authRes.tokens?.refresh?.token ?? "";

      var res = await _dio.post("/auth/refresh-token", data: {
        "refreshToken": refreshToken,
      });

      authRes = AuthResponse.fromJson(res.data);

      await prefs.setString(
          SharedPreferencesConstants.authResponse, jsonEncode(authRes));

      _logger.i("""
          Refresh token successfully.
          ${authRes.tokens?.toJson().beautifyJson()}
          """);

      return authRes;
    } on DioError catch (e) {
      _logger.e("Can't refresh token. ${e.message}");
      rethrow;
    }
  }

  Future changePasswordAsync({ChangePasswordRequest? request}) async {
    var dioRes = await _dio.post(
      "/auth/change-password",
      data: {
        "newPassword": request?.newPassword,
        "password": request?.password,
      },
    );
  }

  Future<AuthResponse> loginWithGoogleAsync(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Delete to avoid Dio Interceptor put this data to request
      // which cause Bad Request err
      await prefs.remove(SharedPreferencesConstants.authResponse);

      var dioRes = await _dio.post(
        "/auth/google",
        data: {
          "access_token": token,
        },
      );

      var loginResponse = AuthResponse.fromJson(dioRes.data);

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
}
