import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/schedule_detail.dart';

part 'booking_info.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingInfo {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  bool? isDeleted;
  ScheduleDetail? scheduleDetailInfo;
  bool? showRecordUrl;
  List<dynamic>? studentMaterials;


  BookingInfo(
      {this.createdAtTimeStamp,
      this.updatedAtTimeStamp,
      this.id,
      this.userId,
      this.scheduleDetailId,
      this.tutorMeetingLink,
      this.studentMeetingLink,
      this.studentRequest,
      this.tutorReview,
      this.scoreByTutor,
      this.createdAt,
      this.updatedAt,
      this.recordUrl,
      this.isDeleted,
      this.scheduleDetailInfo,
      this.showRecordUrl,
      this.studentMaterials});

  factory BookingInfo.fromJson(Map<String, dynamic> json) =>
      _$BookingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingInfoToJson(this);
}
