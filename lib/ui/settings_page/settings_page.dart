import 'package:flutter/material.dart';
import 'package:leet_tutur/widgets/square_button.dart';
import 'package:recase/recase.dart';

import '../../constants/route_constants.dart';
import '../../generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    const iconSize = 45.0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          SquareButton(
            size: MediaQuery.of(context).size.width * 0.4,
            icon: const Icon(
              Icons.account_circle,
              size: iconSize,
            ),
            text: Text(
              S.current.profile.titleCase,
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: _handlePressProfile,
          ),
          SquareButton(
            size: MediaQuery.of(context).size.width * 0.4,
            icon: const Icon(
              Icons.phone_iphone,
              size: iconSize,
            ),
            text: Text(
              S.current.system.titleCase,
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: _handlePressSystemSettings,
          ),
        ],
      ),
    );
  }

  void _handlePressProfile() {
    Navigator.pushNamed(context, RouteConstants.profile);
  }

  void _handlePressSystemSettings() {}
}
