// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseCategoryResponse _$CourseCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CourseCategoryResponse(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseCategoryResponseToJson(
        CourseCategoryResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
    };
