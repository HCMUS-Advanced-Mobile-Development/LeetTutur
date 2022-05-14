import 'package:flutter/material.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:leet_tutur/widgets/avatar_with_status.dart';

class ChatUser extends StatefulWidget {
  final ChatMessage chatMessage;
  final Function()? onTap;

  const ChatUser({Key? key, required this.chatMessage, this.onTap}) : super(key: key);

  @override
  _ChatUserState createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  @override
  Widget build(BuildContext context) {
    var chatMessage = widget.chatMessage;
    var isOnline = chatMessage.partner?.isOnline ?? false;
    return Card(
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AvatarWithStatus(user: chatMessage.partner!),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatMessage.partner?.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            chatMessage.content ?? "",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          DateTimeUtils.humanize(
                              DateTime.parse(chatMessage.createdAt!)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
