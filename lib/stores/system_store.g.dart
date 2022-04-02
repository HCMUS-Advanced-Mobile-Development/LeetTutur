// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SystemStore on _SystemStore, Store {
  final _$systemSettingFutureAtom =
      Atom(name: '_SystemStore.systemSettingFuture');

  @override
  ObservableFuture<SystemSetting>? get systemSettingFuture {
    _$systemSettingFutureAtom.reportRead();
    return super.systemSettingFuture;
  }

  @override
  set systemSettingFuture(ObservableFuture<SystemSetting>? value) {
    _$systemSettingFutureAtom.reportWrite(value, super.systemSettingFuture, () {
      super.systemSettingFuture = value;
    });
  }

  final _$getSystemSettingAsyncAsyncAction =
      AsyncAction('_SystemStore.getSystemSettingAsync');

  @override
  Future<dynamic> getSystemSettingAsync() {
    return _$getSystemSettingAsyncAsyncAction
        .run(() => super.getSystemSettingAsync());
  }

  final _$setLanguageAsyncAction = AsyncAction('_SystemStore.setLanguage');

  @override
  Future<dynamic> setLanguage(String language) {
    return _$setLanguageAsyncAction.run(() => super.setLanguage(language));
  }

  @override
  String toString() {
    return '''
systemSettingFuture: ${systemSettingFuture}
    ''';
  }
}
