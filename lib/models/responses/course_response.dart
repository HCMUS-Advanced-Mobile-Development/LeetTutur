import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/responses/course_response_data.dart';

part 'course_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseResponse {
  String? message;
  CourseResponseData? data;

  CourseResponse({this.message, this.data});

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
