// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRequest _$BookRequestFromJson(Map<String, dynamic> json) => BookRequest(
      note: json['note'] as String?,
      scheduleDetailIds: (json['scheduleDetailIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookRequestToJson(BookRequest instance) =>
    <String, dynamic>{
      'note': instance.note,
      'scheduleDetailIds': instance.scheduleDetailIds,
    };
