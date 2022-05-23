// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_return_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatReturnMessage _$ChatReturnMessageFromJson(Map<String, dynamic> json) =>
    ChatReturnMessage(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatReturnMessageToJson(ChatReturnMessage instance) =>
    <String, dynamic>{
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };
