import 'package:flutter/material.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/widgets/square_button.dart';
import 'package:recase/recase.dart';

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
      child: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Wrap(
          alignment: WrapAlignment.start,
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
              size: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              icon: const Icon(
                Icons.pattern,
                size: iconSize,
              ),
              text: Text(
                S.current.changePassword.titleCase,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
              onTap: _handleChangePassword,
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
      ),
    );
  }

  void _handlePressProfile() {
    Navigator.pushNamed(context, RouteConstants.profile);
  }

  void _handlePressSystemSettings() {
    Navigator.pushNamed(context, RouteConstants.systemSettings);
  }

  void _handleChangePassword() {
    Navigator.pushNamed(context, RouteConstants.changePassword);
  }
}
