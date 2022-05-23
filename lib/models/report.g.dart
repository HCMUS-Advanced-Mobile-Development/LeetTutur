// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      tutorId: json['tutorId'] as String?,
      content: json['content'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tutorId': instance.tutorId,
      'content': instance.content,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
