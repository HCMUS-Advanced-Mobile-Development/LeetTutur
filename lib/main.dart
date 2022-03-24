import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/di/misc_locator.dart';
import 'package:leet_tutur/di/services_locator.dart';
import 'package:leet_tutur/di/stores_locator.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/ui/auth/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.setUp();
  StoresLocator.setUp();
  MiscLocator.setUp();

  runApp(MaterialApp(
    title: 'Leet Tutur',
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      S.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    theme: ThemeData.light(),
    routes: RouteConstants.routesMap,
    home: const SafeArea(
      child: Login(),
    ),
  ));
}
