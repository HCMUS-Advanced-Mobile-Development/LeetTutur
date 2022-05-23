import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/theme_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/system_store.dart';
import 'package:leet_tutur/constants/i18_constants.dart';
import 'package:recase/recase.dart';

class SystemSettings extends StatefulWidget {
  const SystemSettings({Key? key}) : super(key: key);

  @override
  State<SystemSettings> createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  final _systemStore = GetIt.instance.get<SystemStore>();

  String theme = "Light";

  @override
  void initState() {
    if (_systemStore.systemSettingFuture == null) {
      _systemStore.getSystemSettingAsync();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.system),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.language.titleCase,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 20,
                ),
                Observer(
                  builder: (context) {
                    return DropdownButton(
                      hint: Text(S.current.level),
                      value: _systemStore.systemSettingFuture?.value?.language,
                      items: ["en", "vi"].map((e) {
                        var languages = I18Constants.getDisplayLanguage(e);
                        return DropdownMenuItem(
                          child: Text(languages["nativeName"] ?? ""),
                          value: e,
                        );
                      }).toList(),
                      onChanged: _handleChangeLanguage,
                    );
                  }
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.theme.titleCase,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  value: _systemStore.systemSettingFuture?.value?.theme?.titleCase ?? ThemeConstants.defaultTheme,
                  items: ThemeConstants.themes.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: _handleChangeTheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleChangeLanguage(String? value) {
    _systemStore.setLanguageAsync(value ?? "en");
  }

  void _handleChangeTheme(String? value) {
    _systemStore.setThemeAsync(value ?? ThemeConstants.defaultTheme);
  }
}
