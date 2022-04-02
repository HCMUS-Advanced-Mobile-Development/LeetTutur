import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/system_setting.dart';
import 'package:leet_tutur/services/system_service.dart';
import 'package:mobx/mobx.dart';

part 'system_store.g.dart';

class SystemStore = _SystemStore with _$SystemStore;

abstract class _SystemStore with Store {
  final _systemService = GetIt.instance.get<SystemService>();

  @observable
  ObservableFuture<SystemSetting>? systemSettingFuture;

  @computed
  ThemeData get currentTheme =>
      systemSettingFuture?.value?.theme?.toLowerCase() == "dark"
          ? ThemeData.dark()
          : ThemeData.light();

  @action
  Future getSystemSettingAsync() async =>
      systemSettingFuture = ObservableFuture(_systemService.getSettingsAsync());

  @action
  Future setLanguageAsync(String language) async {
    systemSettingFuture =
        ObservableFuture(_systemService.setLanguageAsync(language));
  }

  @action
  Future setThemeAsync(String theme) async {
    systemSettingFuture = ObservableFuture(_systemService.setThemeAsync(theme));
  }
}
