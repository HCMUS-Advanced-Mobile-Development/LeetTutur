import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/models/responses/login_response.dart';
import 'package:leet_tutur/utils/map_extensions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _logger = GetIt.instance.get<Logger>();

  final jsonResponse = """
  {
          "user": {
        "id": "f569c202-7bbf-4620-af77-ecc1419a6b28",
        "email": "student@lettutor.com",
        "name": "Trần Nam",
        "avatar": "https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1644828460150.jpg",
        "country": "VN",
        "phone": "842499996508",
        "roles": [
        "student",
        "CHANGE_PASSWORD"
        ],
        "language": "Albanian",
        "birthday": "1999-06-01",
        "isActivated": true,
        "walletInfo": {
        "id": "285396c8-2c82-4dbd-abca-af3e8d0b3a03",
        "userId": "f569c202-7bbf-4620-af77-ecc1419a6b28",
        "amount": "86700000",
        "isBlocked": false,
        "createdAt": "2021-10-19T13:08:04.697Z",
        "updatedAt": "2022-03-23T05:12:29.672Z",
        "bonus": 0
        },
        "courses": [],
        "requireNote": null,
        "level": "INTERMEDIATE",
        "learnTopics": [
        {
        "id": 3,
        "key": "english-for-kids",
        "name": "English for Kids"
        }
        ],
        "testPreparations": [],
        "isPhoneActivated": true,
        "timezone": 7
        },
        "tokens": {
        "access": {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE2NDgwNDU2OTIsImV4cCI6MTY0ODEzMjA5MiwidHlwZSI6ImFjY2VzcyJ9.L6ddY_o3K6K5iumEl4CdCxa3fNcCoVPXPJXDZXyro2Q",
        "expires": "2022-03-24T14:28:12.178Z"
        },
        "refresh": {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE2NDgwNDU2OTIsImV4cCI6MTY1MDYzNzY5MiwidHlwZSI6InJlZnJlc2gifQ.aejV4FbUI3ANXp4Yzy1mURKqHXiM6Zd0GXNnuNhs7CM",
        "expires": "2022-04-22T14:28:12.178Z"
        }
        }
    }""";

  Future<LoginResponse> loginAsync(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    var loginResponse = LoginResponse.fromJson(jsonDecode(jsonResponse));

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        SharedPreferencesConstants.loginResponse, jsonEncode(loginResponse));

    _logger.i(
        "Save login response to shared preferences. Key: ${SharedPreferencesConstants.loginResponse}. Value: ${loginResponse.toJson().beautifyJson()}");

    return loginResponse;
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
