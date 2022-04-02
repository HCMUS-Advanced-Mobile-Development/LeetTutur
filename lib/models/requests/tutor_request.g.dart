// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorRequest _$TutorRequestFromJson(Map<String, dynamic> json) => TutorRequest(
      filters: json['filters'] == null
          ? null
          : TutorFilter.fromJson(json['filters'] as Map<String, dynamic>),
    )
      ..page = json['page'] as int?
      ..perPage = json['perPage'] as int?
      ..size = json['size'] as int?;

Map<String, dynamic> _$TutorRequestToJson(TutorRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'size': instance.size,
      'filters': instance.filters?.toJson(),
    };
