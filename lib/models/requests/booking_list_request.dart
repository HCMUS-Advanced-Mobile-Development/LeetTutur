import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/requests/base_request.dart';

part 'booking_list_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingListRequest extends BaseRequest {
  String? orderBy;
  String? sortBy;
  int? dateTimeLte;
  int? dateTimeGte;

  BookingListRequest(
      {this.orderBy, this.sortBy, this.dateTimeLte, this.dateTimeGte});

  factory BookingListRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingListRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BookingListRequestToJson(this);
}
