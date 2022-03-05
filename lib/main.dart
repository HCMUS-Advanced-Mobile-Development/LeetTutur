import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leet_tutur/di/stores_locator.dart';
import 'package:leet_tutur/ui/home_tabs/home_tabs.dart';

import 'constants/route_constants.dart';
import 'generated/l10n.dart';
import 'ui/auth/login.dart';

void main() {
  StoresLocator.setUp();

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
    theme: ThemeData.dark(),
    routes: RouteConstants.routesMap,
    home: const SafeArea(
      child: HomeTabs(),
    ),
  ));
}
