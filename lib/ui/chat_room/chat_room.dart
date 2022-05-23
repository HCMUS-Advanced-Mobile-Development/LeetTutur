import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/stores/ws_store.dart';
import 'package:leet_tutur/ui/chat_room/widgets/chat_input.dart';
import 'package:leet_tutur/ui/chat_room/widgets/message_list.dart';
import 'package:leet_tutur/widgets/avatar_with_status.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final _wsStore = GetIt.instance.get<WsStore>();

  @override
  Widget build(BuildContext context) {
    final chatPartner = _wsStore.chatPartner!;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AvatarWithStatus(user: chatPartner),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                chatPartner.name ?? "",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Expanded(
            child: MessageList(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ChatInput(),
          ),
        ],
      ),
    );
  }
}
