import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/responses/booking_data_response.dart';

part 'booking_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingListResponse {
  String? message;
  BookingDataResponse? data;

  BookingListResponse({this.message, this.data});


  factory BookingListResponse.fromJson(Map<String, dynamic> json) => _$BookingListResponseFromJson(json);

    Map<String, dynamic> toJson() => _$BookingListResponseToJson(this);
}