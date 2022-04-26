// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userFutureAtom = Atom(name: '_UserStore.userFuture');

  @override
  ObservableFuture<User>? get userFuture {
    _$userFutureAtom.reportRead();
    return super.userFuture;
  }

  @override
  set userFuture(ObservableFuture<User>? value) {
    _$userFutureAtom.reportWrite(value, super.userFuture, () {
      super.userFuture = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  Future<User> getUserInfoAsync() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getUserInfoAsync');
    try {
      return super.getUserInfoAsync();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userFuture: ${userFuture}
    ''';
  }
}
