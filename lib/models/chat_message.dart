import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/user.dart';

part 'chat_message.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatMessage {
  String? id;
  String? fromId;
  String? toId;
  String? content;
  bool? isRead;
  String? createdAt;
  User? fromInfo;
  User? toInfo;
  User? partner;

  ChatMessage({this.id,
    this.fromId,
    this.toId,
    this.content,
    this.isRead,
    this.createdAt,
    this.fromInfo,
    this.toInfo,
    this.partner});
  
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}