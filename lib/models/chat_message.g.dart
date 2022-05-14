// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as String?,
      fromId: json['fromId'] as String?,
      toId: json['toId'] as String?,
      content: json['content'] as String?,
      isRead: json['isRead'] as bool?,
      createdAt: json['createdAt'] as String?,
      fromInfo: json['fromInfo'] == null
          ? null
          : User.fromJson(json['fromInfo'] as Map<String, dynamic>),
      toInfo: json['toInfo'] == null
          ? null
          : User.fromJson(json['toInfo'] as Map<String, dynamic>),
      partner: json['partner'] == null
          ? null
          : User.fromJson(json['partner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromId': instance.fromId,
      'toId': instance.toId,
      'content': instance.content,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'fromInfo': instance.fromInfo?.toJson(),
      'toInfo': instance.toInfo?.toJson(),
      'partner': instance.partner?.toJson(),
    };
