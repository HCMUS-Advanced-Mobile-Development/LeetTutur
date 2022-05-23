import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/constants/shared_preferences_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/widgets/square_button.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _googleSignIn = GetIt.instance.get<GoogleSignIn>();
  final _facebookAuth = GetIt.instance.get<FacebookAuth>();

  @override
  Widget build(BuildContext context) {
    const iconSize = 45.0;
    final buttonSize = MediaQuery.of(context).size.width * 0.4;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              SquareButton(
                size: buttonSize,
                icon: const Icon(
                  Icons.account_circle,
                  size: iconSize,
                ),
                text: Text(
                  S.current.profile.titleCase,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: _handlePressProfile,
              ),
              SquareButton(
                size: buttonSize,
                icon: const Icon(
                  Icons.pattern,
                  size: iconSize,
                ),
                text: Text(
                  S.current.changePassword.titleCase,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: _handleChangePassword,
              ),
              SquareButton(
                size: buttonSize,
                icon: const Icon(
                  Icons.app_registration,
                  size: iconSize,
                ),
                text: Text(
                  S.current.becomeTutor.titleCase,
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                ),
                onTap: _handleBecomeTutor,
              ),
              SquareButton(
                size: buttonSize,
                icon: const Icon(
                  Icons.phone_iphone,
                  size: iconSize,
                ),
                text: Text(
                  S.current.system.titleCase,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: _handlePressSystemSettings,
              ),
              SquareButton(
                size: buttonSize,
                icon: const Icon(
                  Icons.logout,
                  size: iconSize,
                ),
                text: Text(
                  S.current.logOut.titleCase,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: _handleLogOut,
              ),
            ],
          ),
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

  void _handleLogOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await Future.wait([
        prefs.remove(SharedPreferencesConstants.authResponse),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
    } finally {
      Navigator.pop(context);
    }
  }

  void _handleBecomeTutor() {
    throw UnimplementedError("We don't do that here!");
  }
}
