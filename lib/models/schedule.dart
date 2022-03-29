import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/schedule_detail.dart';
import 'package:leet_tutur/models/tutor.dart';

part 'schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class Schedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  String? date;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  String? updatedAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;
  Tutor? tutorInfo;

  Schedule(
      {this.id,
      this.tutorId,
      this.startTime,
      this.endTime,
      this.date,
      this.startTimestamp,
      this.endTimestamp,
      this.createdAt,
      this.updatedAt,
      this.isBooked,
      this.scheduleDetails,
      this.tutorInfo});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
