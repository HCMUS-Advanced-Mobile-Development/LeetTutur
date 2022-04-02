// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingListResponse _$BookingListResponseFromJson(Map<String, dynamic> json) =>
    BookingListResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BookingDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingListResponseToJson(
        BookingListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
