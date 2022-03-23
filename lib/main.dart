import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/di/misc_locator.dart';
import 'package:leet_tutur/di/stores_locator.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/ui/auth/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StoresLocator.setUp();
  MiscLocator.setUp();

  runApp(MaterialApp(
    title: 'Leet Tutur',
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
    routes: RouteConstants.routesMap,
    home: const SafeArea(
      child: Login(),
    ),
  ));
}
