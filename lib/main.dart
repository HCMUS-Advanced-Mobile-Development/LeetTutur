import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/di/misc_locator.dart';
import 'package:leet_tutur/di/oauth_locator.dart';
import 'package:leet_tutur/di/services_locator.dart';
import 'package:leet_tutur/di/stores_locator.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/system_store.dart';
import 'package:leet_tutur/ui/auth/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env", mergeWith: Platform.environment);

  MiscLocator.setUp();
  OauthLocator.setUp();
  ServiceLocator.setUp();
  StoresLocator.setUp();

  var systemStore = GetIt.instance.get<SystemStore>();
  await systemStore.getSystemSettingAsync();

  runApp(
    Observer(builder: (context) {
      return MaterialApp(
        title: 'Leet Tutur',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(systemStore.systemSettingFuture?.value?.language ?? "en"),
        scrollBehavior: _MyCustomScrollBehavior(),
        theme: systemStore.currentTheme,
        routes: RouteConstants.routesMap,
        home: const SafeArea(
          child: Login(),
        ),
      );
    }),
  );
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
