import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/course.dart';

part 'course_response_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseResponseData {
  int? count;
  List<Course>? rows;

  CourseResponseData({this.count, this.rows});

  factory CourseResponseData.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseDataToJson(this);
}
