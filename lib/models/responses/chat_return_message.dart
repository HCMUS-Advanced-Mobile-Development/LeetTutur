import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/chat_message.dart';

part 'chat_return_message.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatReturnMessage {
  List<ChatMessage>? messages;

  ChatReturnMessage({this.messages});

  factory ChatReturnMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatReturnMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatReturnMessageToJson(this);
}