import 'package:flutter/material.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';

class ChatUser extends StatefulWidget {
  final ChatMessage chatMessage;

  const ChatUser({Key? key, required this.chatMessage}) : super(key: key);

  @override
  _ChatUserState createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  @override
  Widget build(BuildContext context) {
    var chatMessage = widget.chatMessage;
    var isOnline = chatMessage.partner?.isOnline ?? false;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.network(chatMessage.partner?.avatar ??
                      "https://picsum.photos/seed/picsum/200")
                  .image,
              child: Stack(children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: isOnline ? Colors.green : Colors.grey,
                    radius: 5,
                  ),
                ),
              ]),
            ),
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
    );
  }
}
