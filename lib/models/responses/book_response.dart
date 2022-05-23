import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/booking_info.dart';

part 'book_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookResponse {
  final String? message;
  final List<BookingInfo>? data;

  BookResponse({this.message, this.data});

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}