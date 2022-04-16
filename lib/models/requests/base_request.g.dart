// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRequest _$BaseRequestFromJson(Map<String, dynamic> json) => BaseRequest(
      page: json['page'] as int? ?? 1,
      perPage: json['perPage'] as int? ?? 12,
      size: json['size'] as int? ?? 12,
    );

Map<String, dynamic> _$BaseRequestToJson(BaseRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'size': instance.size,
    };
