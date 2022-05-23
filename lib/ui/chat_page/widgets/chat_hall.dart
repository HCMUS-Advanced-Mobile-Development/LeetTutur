import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/stores/ws_store.dart';
import 'package:leet_tutur/ui/chat_page/widgets/chat_user.dart';

class ChatHall extends StatefulWidget {
  const ChatHall({Key? key}) : super(key: key);

  @override
  State<ChatHall> createState() => _ChatHallState();
}

class _ChatHallState extends State<ChatHall> {
  final _wsStore = GetIt.instance.get<WsStore>();

  @override
  void initState() {
    _wsStore.retrieveChatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Observer(
        builder: (context) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 2);
            },
            itemBuilder: (context, index) {
              return ChatUser(
                chatMessage: _wsStore.chatList[index],
                onTap: () => _handleGoToChatRoom(_wsStore.chatList[index].partner!),
              );
            },
            itemCount: _wsStore.chatList.length,
          );
        },
      ),
    );
  }

  void _handleGoToChatRoom(User partner) {
    _wsStore.chatPartner = partner;
    Navigator.pushNamed(context, RouteConstants.chatRoom);
  }
}
