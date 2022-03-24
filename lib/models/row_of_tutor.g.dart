// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_of_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowOfTutor _$RowOfTutorFromJson(Map<String, dynamic> json) => RowOfTutor(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Tutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RowOfTutorToJson(RowOfTutor instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
    };
