// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetInfo _$MeetInfoFromJson(Map<String, dynamic> json) => MeetInfo(
      room: json['room'] as String?,
      roomName: json['roomName'] as String?,
      userCall: json['userCall'] == null
          ? null
          : User.fromJson(json['userCall'] as Map<String, dynamic>),
      userBeCalled: json['userBeCalled'] == null
          ? null
          : User.fromJson(json['userBeCalled'] as Map<String, dynamic>),
      isTutor: json['isTutor'] as bool?,
      startTime: json['startTime'] as int?,
      endSession: json['endSession'] as int?,
      timeInRoom: json['timeInRoom'] as int?,
      bookingId: json['bookingId'] as String?,
      iat: json['iat'] as int?,
      exp: json['exp'] as int?,
      aud: json['aud'] as String?,
      iss: json['iss'] as String?,
      sub: json['sub'] as String?,
    );

Map<String, dynamic> _$MeetInfoToJson(MeetInfo instance) => <String, dynamic>{
      'room': instance.room,
      'roomName': instance.roomName,
      'userCall': instance.userCall?.toJson(),
      'userBeCalled': instance.userBeCalled?.toJson(),
      'isTutor': instance.isTutor,
      'startTime': instance.startTime,
      'endSession': instance.endSession,
      'timeInRoom': instance.timeInRoom,
      'bookingId': instance.bookingId,
      'iat': instance.iat,
      'exp': instance.exp,
      'aud': instance.aud,
      'iss': instance.iss,
      'sub': instance.sub,
    };
