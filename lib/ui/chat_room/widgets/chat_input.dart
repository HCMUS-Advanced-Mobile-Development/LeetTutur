import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/stores/auth_store.dart';
import 'package:leet_tutur/stores/ws_store.dart';
import 'package:leet_tutur/widgets/text_input.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _authStore = GetIt.instance.get<AuthStore>();
  final _wsStore = GetIt.instance.get<WsStore>();

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextInput(
            controller: _textEditingController,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          onPressed: _handeSendMessage,
          child: const Icon(Icons.send),
        )
      ],
    );
  }

  void _handeSendMessage() {
    _wsStore.sendChatMessage(
      ChatMessage(
        fromId: _authStore.currentUser?.id,
        toId: _wsStore.chatPartner?.id,
        content: _textEditingController.value.text,
      ),
    );

    _textEditingController.text = "";
  }
}
