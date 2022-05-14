import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/stores/auth_store.dart';
import 'package:leet_tutur/stores/ws_store.dart';
import 'package:mobx/mobx.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _authStore = GetIt.instance.get<AuthStore>();
  final _wsStore = GetIt.instance.get<WsStore>();

  final _items = <ChatMessage>[];
  final _controller = ScrollController();
  final _listKey = GlobalKey<AnimatedListState>();

  final _senderBg = Colors.deepPurpleAccent;
  final _receiverBg = Colors.grey;

  @override
  void initState() {
    _wsStore.retrieveChatMessages(
        _authStore.currentUser!, _wsStore.chatPartner!);

    when(
      (_) => _wsStore.chatMessages.isNotEmpty,
      () => setState(() {
        _items.addAll(_wsStore.chatMessages);
        _items.asMap().forEach((index, value) {
          _listKey.currentState!.insertItem(index);
        });

        // If not delay, it not gonna scroll to bottom
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            _controller.animateTo(
              _controller.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        );
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _wsStore.chatMessages = ObservableList.of([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final me = _authStore.currentUser!;

    return AnimatedList(
      key: _listKey,
      controller: _controller,
      shrinkWrap: true,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        final message = _items[index];
        final isSender = me.id == message.fromInfo?.id;

        return ScaleTransition(
          alignment: isSender ? Alignment.topRight : Alignment.topLeft,
          scale: animation,
          child: ChatBubble(
            margin: const EdgeInsets.only(top: 10),
            backGroundColor: isSender ? _senderBg : _receiverBg,
            alignment: isSender ? Alignment.topRight : Alignment.topLeft,
            clipper: ChatBubbleClipper1(
              type:
                  isSender ? BubbleType.sendBubble : BubbleType.receiverBubble,
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message.content ?? "",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
