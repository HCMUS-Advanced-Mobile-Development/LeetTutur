// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingListRequest _$BookingListRequestFromJson(Map<String, dynamic> json) =>
    BookingListRequest(
      orderBy: json['orderBy'] as String?,
      sortBy: json['sortBy'] as String?,
      dateTimeLte: json['dateTimeLte'] as int?,
      dateTimeGte: json['dateTimeGte'] as int?,
    )
      ..page = json['page'] as int?
      ..perPage = json['perPage'] as int?
      ..size = json['size'] as int?;

Map<String, dynamic> _$BookingListRequestToJson(BookingListRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'size': instance.size,
      'orderBy': instance.orderBy,
      'sortBy': instance.sortBy,
      'dateTimeLte': instance.dateTimeLte,
      'dateTimeGte': instance.dateTimeGte,
    };
