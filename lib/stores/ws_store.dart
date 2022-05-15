import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/models/responses/chat_recent_list.dart';
import 'package:leet_tutur/models/responses/chat_return_message.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/services/ws_service.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'ws_store.g.dart';

class WsStore = _WsStore with _$WsStore;

abstract class _WsStore with Store {
  final _wsService = GetIt.instance.get<WsService>();
  final _logger = GetIt.instance.get<Logger>();

  @observable
  ObservableList<ChatMessage> chatList = ObservableList.of([]);

  @observable
  User? chatPartner;

  @observable
  ObservableList<ChatMessage> chatMessages = ObservableList.of([]);

  void loginWebSocket(User user) {
    _wsService.loginWebSocket(user);
  }

  @action
  void retrieveChatList() {
    _wsService.retrieveChatList();

    _wsService.registerEventListener("chat:returnRecentList", (data) {
      final recentListResponse = ChatRecentList.fromJson(data);
      chatList = ObservableList.of(recentListResponse.recentList ?? []);

      _logger.i("chat:returnRecentList ${chatList.length} items");
    });
  }

  @action
  void retrieveChatMessages(User fromUser, User toUser) {
    _wsService.retrieveChatMessages(fromUser, toUser);

    _wsService.registerEventListener("chat:returnMessages", (data) {
      var msg = ChatReturnMessage.fromJson(data);
      chatMessages = ObservableList.of(msg.messages ?? []);

      _logger.i("chat:returnMessages ${chatMessages.length} items");
    });
  }

  void sendChatMessage(ChatMessage message) =>
      _wsService.sendChatMessage(message);
}
