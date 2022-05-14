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

  late final _$chatPartnerAtom =
      Atom(name: '_WsStore.chatPartner', context: context);

  @override
  User? get chatPartner {
    _$chatPartnerAtom.reportRead();
    return super.chatPartner;
  }

  @override
  set chatPartner(User? value) {
    _$chatPartnerAtom.reportWrite(value, super.chatPartner, () {
      super.chatPartner = value;
    });
  }

  late final _$chatMessagesAtom =
      Atom(name: '_WsStore.chatMessages', context: context);

  @override
  ObservableList<ChatMessage> get chatMessages {
    _$chatMessagesAtom.reportRead();
    return super.chatMessages;
  }

  @override
  set chatMessages(ObservableList<ChatMessage> value) {
    _$chatMessagesAtom.reportWrite(value, super.chatMessages, () {
      super.chatMessages = value;
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
  void retrieveChatMessages(User fromUser, User toUser) {
    final _$actionInfo = _$_WsStoreActionController.startAction(
        name: '_WsStore.retrieveChatMessages');
    try {
      return super.retrieveChatMessages(fromUser, toUser);
    } finally {
      _$_WsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatList: ${chatList},
chatPartner: ${chatPartner},
chatMessages: ${chatMessages}
    ''';
  }
}
