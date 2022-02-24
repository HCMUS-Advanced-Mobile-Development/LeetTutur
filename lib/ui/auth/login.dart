// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/RouteConstants.dart';
import '../../generated/l10n.dart';
import '../../widgets/text_input.dart';
import '../../widgets/text_password_input.dart';
import 'widgets/logo_intro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(children: [
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: TextInput(
                        hintText: S.current.enterMail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: TextPasswordInput(
                        hintText: S.current.enterPassword,
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
                                  Navigator.pushNamed(
                                      context, RouteConstants.forgotPassword);
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
                              onPressed: () {},
                              child: Text(S.current.login.toUpperCase())),
                        ),
                      ],
                    )
                  ]),
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
