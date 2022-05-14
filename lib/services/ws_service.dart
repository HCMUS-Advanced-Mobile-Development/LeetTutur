import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/api_constants.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO; // ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart';

class WsService implements Disposable {
  final _logger = GetIt.instance.get<Logger>();
  late final Socket _socket;

  WsService() {
    _socket = IO.io(
      ApiConstants.wsUrl,
      OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.onAny((event, data) => _logger.i("Received event: " + event));
    _socket.onError((data) => _logger.wtf(data));
  }

  void registerEventListener(String event, dynamic Function(dynamic) handler) {
    _socket.on(event, handler);
  }

  void loginWebSocket(User user) {
    _socket.emit("connection:login", {
      "user": user.toJson(),
    });

    // _socket.emit("chat:getRecentList");9
    //
    // _socket.emit("chat:getMessages", {
    //   "fromId": "f569c202-7bbf-4620-af77-ecc1419a6b28",
    //   "toId": "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a",
    // });
  }

  void retrieveChatList() {
    _socket.emit("chat:getRecentList");
  }

  @override
  FutureOr onDispose() async {
    _socket.dispose();
  }
}
