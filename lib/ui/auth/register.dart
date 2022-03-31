// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/auth_store.dart';
import 'package:leet_tutur/ui/auth/widgets/logo_intro.dart';
import 'package:leet_tutur/widgets/text_input.dart';
import 'package:leet_tutur/widgets/text_password_input.dart';
import 'package:recase/recase.dart';
import 'package:validators/validators.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authStore = GetIt.instance.get<AuthStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(RouteConstants.register.pascalCase),
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
                  Observer(
                    builder: (BuildContext context) => Form(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextPasswordInput(
                              hintText: S.current.confirmPassword,
                              onChanged: (value) =>
                                  {authStore.confirmPassword = value},
                              validator: (value) {
                                if (isNull(value)) {
                                  return S.current.pleaseEnterSomeValue;
                                }

                                if (authStore.password != value) {
                                  return S.current.yourPasswordIsInCorrect;
                                }

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: _handleRegister,
                                    child:
                                        Text(S.current.register.toUpperCase())),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, RouteConstants.login);
    }
  }
}
