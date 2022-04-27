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

  final _$learnTopicsFutureAtom = Atom(name: '_UserStore.learnTopicsFuture');

  @override
  ObservableFuture<List<LearnTopic>>? get learnTopicsFuture {
    _$learnTopicsFutureAtom.reportRead();
    return super.learnTopicsFuture;
  }

  @override
  set learnTopicsFuture(ObservableFuture<List<LearnTopic>>? value) {
    _$learnTopicsFutureAtom.reportWrite(value, super.learnTopicsFuture, () {
      super.learnTopicsFuture = value;
    });
  }

  final _$testPreparationsAtom = Atom(name: '_UserStore.testPreparations');

  @override
  ObservableFuture<List<LearnTopic>>? get testPreparations {
    _$testPreparationsAtom.reportRead();
    return super.testPreparations;
  }

  @override
  set testPreparations(ObservableFuture<List<LearnTopic>>? value) {
    _$testPreparationsAtom.reportWrite(value, super.testPreparations, () {
      super.testPreparations = value;
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
  Future<User> updateUserAsync(User user) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateUserAsync');
    try {
      return super.updateUserAsync(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<User> updateAvatarAsync(String localPath) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateAvatarAsync');
    try {
      return super.updateAvatarAsync(localPath);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<LearnTopic>> getLearnTopicsAsync() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getLearnTopicsAsync');
    try {
      return super.getLearnTopicsAsync();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<LearnTopic>> getTestPreparationsAsync() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getTestPreparationsAsync');
    try {
      return super.getTestPreparationsAsync();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userFuture: ${userFuture},
learnTopicsFuture: ${learnTopicsFuture},
testPreparations: ${testPreparations}
    ''';
  }
}
