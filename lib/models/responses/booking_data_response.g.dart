// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDataResponse _$BookingDataResponseFromJson(Map<String, dynamic> json) =>
    BookingDataResponse(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => BookingInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingDataResponseToJson(
        BookingDataResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
    };
