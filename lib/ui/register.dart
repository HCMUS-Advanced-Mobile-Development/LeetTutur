// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/RouteConstants.dart';
import '../widgets/text_input.dart';
import '../widgets/text_password_input.dart';
import 'login/logo_intro.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(RouteConstants.register.toUpperCase()),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/geometry-bg.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          hintText: "Enter you email address",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: TextPasswordInput(
                          hintText: "Enter your password",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: TextPasswordInput(
                          hintText: "Confirm password",
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Register".toUpperCase())),
                          ),
                        ],
                      )
                    ]),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
