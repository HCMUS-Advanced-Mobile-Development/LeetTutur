import 'package:flutter/material.dart';

import '../ui/login/login.dart';
import '../ui/register.dart';

class RouteConstants {
  static const login = "login";
  static const register = "register";

  static final routesMap = <String, WidgetBuilder>{
    login: (BuildContext context) => const Login(),
    register: (BuildContext context) => const Register(),
  };
}
