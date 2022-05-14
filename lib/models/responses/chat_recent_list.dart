import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/chat_message.dart';

part 'chat_recent_list.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatRecentList {
  List<ChatMessage>? recentList;
  int? unreadCount;

  ChatRecentList({this.recentList, this.unreadCount});

  factory ChatRecentList.fromJson(Map<String, dynamic> json) =>
      _$ChatRecentListFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRecentListToJson(this);
}
