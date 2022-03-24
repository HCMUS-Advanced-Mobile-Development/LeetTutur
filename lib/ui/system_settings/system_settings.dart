import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../generated/l10n.dart';

class SystemSettings extends StatefulWidget {
  const SystemSettings({Key? key}) : super(key: key);

  @override
  State<SystemSettings> createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  String theme = "Light";
  String language = "English";

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
                DropdownButton(
                  value: language,
                  items: ["English", "Vietnam"].map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: _handleChangeLanguage,
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
                  value: theme,
                  items: ["Light", "Dark"].map((e) {
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
    setState(() {
      language = value ?? "English";
    });
  }

  void _handleChangeTheme(String? value) {
    setState(() {
      theme = value ?? "Light";
    });
  }
}
