// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/login_response.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

import '../../constants/route_constants.dart';
import '../../generated/l10n.dart';
import '../../stores/auth_store/auth_store.dart';
import '../../widgets/text_input.dart';
import '../../widgets/text_password_input.dart';
import 'widgets/logo_intro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authStore = GetIt.instance.get<AuthStore>();
  final logger = GetIt.instance.get<Logger>();

  final _formKey = GlobalKey<FormState>();

  late final ReactionDisposer reactionDisposer;

  @override
  void initState() {
    authStore.retrieveLocalLoginResponseAsync().then((value) {
      logger.i("Detect tokens in local shared preferences. Auto login.");
      Navigator.pushNamed(context, RouteConstants.homeTabs);
    })
    .onError((error, stackTrace) {
      logger.e("Can't get token from local shared preferences", error, stackTrace);
    });

    super.initState();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      authStore.loginAsync();
      Navigator.pushNamed(context, RouteConstants.homeTabs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/geometry-bg.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO AND INTRO
                LogoIntro(),
                // USER INPUT
                Observer(
                  builder: (context) => Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Column(children: [
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: TextInput(
                            hintText: S.current.enterMail,
                            initialValue: authStore.email,
                            onChanged: (value) => {authStore.email = value},
                            validator: (value) {
                              if (isNull(value) || !isEmail(value!)) {
                                return S.current.pleaseEnterCorrectEmailFormat;
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: TextPasswordInput(
                            hintText: S.current.enterPassword,
                            initialValue: authStore.password,
                            onChanged: (value) => {authStore.password = value},
                            validator: (value) {
                              if (isNull(value)) {
                                return S.current.pleaseEnterSomeValue;
                              }

                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                  text: S.current.forgotPassword,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to forgot password
                                      Navigator.pushNamed(context,
                                          RouteConstants.forgotPassword);
                                    }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: _handleLogin,
                                  child: Text(S.current.login.toUpperCase())),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                // OAuth2 authentication,
                Column(children: [
                  SizedBox(height: 15),
                  Text(S.current.orWith),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                // GG OAuth2
                              },
                              icon: Image.asset(
                                "assets/images/google.png",
                              ),
                              iconSize: 50),
                          IconButton(
                              onPressed: () {
                                // GG OAuth2
                              },
                              icon: Image.asset(
                                "assets/images/facebook.png",
                              ),
                              iconSize: 50),
                        ]),
                  )
                ]),
                // Register
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(height: 50),
                  Text(S.current.dontHaveAccount),
                  SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                        text: S.current.register,
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, RouteConstants.register);
                          }),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
