import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/models/system_setting.dart';
import 'package:leet_tutur/utils/map_extensions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemService {
  Future<SystemSetting> getSettingsAsync() async {
    final _logger = GetIt.instance.get<Logger>();
    final prefs = await SharedPreferences.getInstance();

    var settings = prefs.getString(SharedPreferencesConstants.systemSettings);
    var systemSetting = SystemSetting();

    if (settings != null) {
      systemSetting = SystemSetting.fromJson(jsonDecode(settings));
    }

    _logger.i("System settings: ${systemSetting.toJson().beautifyJson()}");

    return systemSetting;
  }

  Future<SystemSetting> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    var settings =
        prefs.getString(SharedPreferencesConstants.systemSettings) ?? "{}";

    var systemSetting = SystemSetting.fromJson(jsonDecode(settings));
    systemSetting.language = language;

    return systemSetting;
  }
}
