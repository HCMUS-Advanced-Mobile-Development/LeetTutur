import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/favorite_tutor.dart';
import 'package:leet_tutur/models/requests/tutor_request.dart';
import 'package:leet_tutur/models/responses/tutor_response.dart';
import 'package:leet_tutur/models/row_of_tutor.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:logger/logger.dart';

class TutorService {
  final _logger = GetIt.instance.get<Logger>();
  final _dio = GetIt.instance.get<Dio>();

  Future<TutorResponse> searchTutorsAsync({TutorRequest? request}) async {
    try {
      var tutorDioRes = await _dio.post(
        "/tutor/search",
        data: request?.toJson(),
      );

      var favoriteTutorDioRes = await _dio.get(
        "/tutor/more",
        queryParameters: {
          "page": request?.page ?? 1,
          "perPage": request?.perPage ?? 9,
        },
      );

      var tutorResponse = TutorResponse(
        tutors: RowOfTutor.fromJson(tutorDioRes.data),
        favoriteTutor: (favoriteTutorDioRes.data?["favoriteTutor"] as List)
            .map((e) => FavoriteTutor.fromJson(e))
            .toList(),
      );

      _logger.i("Total tutors found: ${tutorResponse.tutors?.rows?.length}");

      return tutorResponse;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future addToFavoriteTutorAsync(String? tutorId) async {
    try {
      await _dio.post(
        "/user/manageFavoriteTutor",
        data: {
          "tutorId": tutorId,
        },
      );
    } on DioError catch (e) {
      _logger.e("Can't add tutor to favorite. ${e.message}");
      rethrow;
    }
  }

  Future<Map<String, String>> getTutorSpecialtiesAsync() async {
    var twoDResponse = await Future.wait(
      [
        _dio.get("/learn-topic"),
        _dio.get("/test-preparation"),
      ],
    );
    var map = twoDResponse
        .map(
          (e) => e.data as List,
        )
        .reduce(
          (value, element) => value..addAll(element),
        )
        .fold(
      <String, String>{},
      (Map<String, String> previousValue, element) => previousValue
        ..putIfAbsent(
          element["key"],
          () => element["name"],
        ),
    );

    return map;
  }

  Future<Tutor> getTutorDetail({String id = "0"}) async {
    try {
      var dioRes = await _dio.get("/tutor/$id");
      var tutor = Tutor.fromJson(dioRes.data);

      _logger.i("""
          Get tutor detail. Name: ${tutor.user?.name}. 
          Number of feedback: ${tutor.user?.feedbacks?.length}
          """);

      return tutor;
    } on DioError catch (e) {
      _logger.e("Can't get tutor detail. ${e.message}");
      rethrow;
    }
  }
}
