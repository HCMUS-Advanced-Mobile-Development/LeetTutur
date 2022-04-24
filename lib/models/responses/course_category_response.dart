import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/category.dart';

part 'course_category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseCategoryResponse {
  int? count;
  List<Category>? rows;

  CourseCategoryResponse({this.count, this.rows});

  factory CourseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryResponseToJson(this);
}