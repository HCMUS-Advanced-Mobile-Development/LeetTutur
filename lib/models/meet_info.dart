import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/user.dart';

part 'meet_info.g.dart';

@JsonSerializable(explicitToJson: true)
class MeetInfo {
  String? room;
  String? roomName;
  User? userCall;
  User? userBeCalled;
  bool? isTutor;
  int? startTime;
  int? endSession;
  int? timeInRoom;
  String? bookingId;
  int? iat;
  int? exp;
  String? aud;
  String? iss;
  String? sub;

  MeetInfo({
    this.room,
    this.roomName,
    this.userCall,
    this.userBeCalled,
    this.isTutor,
    this.startTime,
    this.endSession,
    this.timeInRoom,
    this.bookingId,
    this.iat,
    this.exp,
    this.aud,
    this.iss,
    this.sub});

  factory MeetInfo.fromJson(Map<String, dynamic> json) =>
      _$MeetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MeetInfoToJson(this);
}
