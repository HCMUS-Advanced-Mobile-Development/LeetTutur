import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/schedule.dart';

part 'schedule_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleResponse {
  String? message;
  List<Schedule>? data;

  ScheduleResponse({this.message, this.data});

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}
