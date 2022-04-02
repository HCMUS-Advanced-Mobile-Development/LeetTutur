// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SystemStore on _SystemStore, Store {
  Computed<ThemeData>? _$currentThemeComputed;

  @override
  ThemeData get currentTheme =>
      (_$currentThemeComputed ??= Computed<ThemeData>(() => super.currentTheme,
              name: '_SystemStore.currentTheme'))
          .value;

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

  final _$setLanguageAsyncAsyncAction =
      AsyncAction('_SystemStore.setLanguageAsync');

  @override
  Future<dynamic> setLanguageAsync(String language) {
    return _$setLanguageAsyncAsyncAction
        .run(() => super.setLanguageAsync(language));
  }

  final _$setThemeAsyncAsyncAction = AsyncAction('_SystemStore.setThemeAsync');

  @override
  Future<dynamic> setThemeAsync(String theme) {
    return _$setThemeAsyncAsyncAction.run(() => super.setThemeAsync(theme));
  }

  @override
  String toString() {
    return '''
systemSettingFuture: ${systemSettingFuture},
currentTheme: ${currentTheme}
    ''';
  }
}
