import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/services/ws_service.dart';
import 'package:leet_tutur/ui/auth/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Login(),
    );
  }

  @override
  void dispose() async {
    await GetIt.instance.reset();
    super.dispose();
  }
}
