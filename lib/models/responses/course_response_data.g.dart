// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponseData _$CourseResponseDataFromJson(Map<String, dynamic> json) =>
    CourseResponseData(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseResponseDataToJson(CourseResponseData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
    };
