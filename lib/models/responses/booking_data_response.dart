import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/booking_info.dart';

part 'booking_data_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingDataResponse {
  int? count;
  List<BookingInfo>? rows;

  BookingDataResponse({this.count, this.rows});

  factory BookingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataResponseToJson(this);
}
