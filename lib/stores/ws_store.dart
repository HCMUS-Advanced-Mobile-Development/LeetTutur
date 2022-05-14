import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/chat_message.dart';
import 'package:leet_tutur/models/responses/chat_recent_list.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/services/ws_service.dart';
import 'package:mobx/mobx.dart';

part 'ws_store.g.dart';

class WsStore = _WsStore with _$WsStore;

abstract class _WsStore with Store {
  final _wsService = GetIt.instance.get<WsService>();

  @observable
  ObservableList<ChatMessage> chatList = ObservableList.of([]);
  
  void loginWebSocket(User user) {
    _wsService.loginWebSocket(user);
  }

  @action
  void retrieveChatList() {
    _wsService.retrieveChatList();
    
    _wsService.registerEventListener("chat:returnRecentList", (data) {
      final recentListResponse = ChatRecentList.fromJson(data);
      chatList = ObservableList.of(recentListResponse.recentList ?? []);
    });
  }
}
