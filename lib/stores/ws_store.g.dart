// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WsStore on _WsStore, Store {
  late final _$chatListAtom = Atom(name: '_WsStore.chatList', context: context);

  @override
  ObservableList<ChatMessage> get chatList {
    _$chatListAtom.reportRead();
    return super.chatList;
  }

  @override
  set chatList(ObservableList<ChatMessage> value) {
    _$chatListAtom.reportWrite(value, super.chatList, () {
      super.chatList = value;
    });
  }

  late final _$_WsStoreActionController =
      ActionController(name: '_WsStore', context: context);

  @override
  void retrieveChatList() {
    final _$actionInfo = _$_WsStoreActionController.startAction(
        name: '_WsStore.retrieveChatList');
    try {
      return super.retrieveChatList();
    } finally {
      _$_WsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatList: ${chatList}
    ''';
  }
}
