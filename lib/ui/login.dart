// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              Column(
                children: [
                  Image.asset("assets/images/logo.png", width: 125),
                  Expanded(
                    flex: 0,
                    child: Text(
                      "Leet Tutur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "IBM_Mono",
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text("1 on 1 online education platform",
                        style: TextStyle(fontFamily: "IBM_Mono", fontSize: 14)),
                  ),
                ],
              ),
              // USER INPUT
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(children: [
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your email address",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your password",
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                            text: "Forgot password?",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to forgot password
                                if (kDebugMode) {
                                  print("Forgot password");
                                }
                              }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Login".toUpperCase())),
                      ),
                    ],
                  )
                ]),
              ),
              // OAuth2 authentication,
              Column(children: [
                SizedBox(height: 15),
                Text("or with"),
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
                Text("Don't have an account?"),
                SizedBox(width: 5),
                RichText(
                  text: TextSpan(
                      text: "Register",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to forgot password
                          if (kDebugMode) {
                            print("Register");
                          }
                        }),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}