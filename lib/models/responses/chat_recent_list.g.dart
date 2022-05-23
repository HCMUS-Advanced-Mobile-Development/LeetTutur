// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_recent_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRecentList _$ChatRecentListFromJson(Map<String, dynamic> json) =>
    ChatRecentList(
      recentList: (json['recentList'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: json['unreadCount'] as int?,
    );

Map<String, dynamic> _$ChatRecentListToJson(ChatRecentList instance) =>
    <String, dynamic>{
      'recentList': instance.recentList?.map((e) => e.toJson()).toList(),
      'unreadCount': instance.unreadCount,
    };
