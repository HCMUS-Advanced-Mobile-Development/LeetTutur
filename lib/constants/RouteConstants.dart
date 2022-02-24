import 'package:flutter/material.dart';

import '../ui/auth/forgot_password.dart';
import '../ui/auth/login.dart';
import '../ui/auth/register.dart';

class RouteConstants {
  static const login = "login";
  static const register = "register";
  static const forgotPassword = "forgot password";

  static final routesMap = <String, WidgetBuilder>{
    login: (BuildContext context) => const Login(),
    register: (BuildContext context) => const Register(),
    forgotPassword: (BuildContext context) => const ForgotPassword(),
  };
}
