import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/auth_store.dart';
import 'package:leet_tutur/ui/auth/widgets/logo_intro.dart';
import 'package:leet_tutur/widgets/text_input.dart';
import 'package:leet_tutur/widgets/text_password_input.dart';
import 'package:logger/logger.dart';
import 'package:recase/recase.dart';
import 'package:validators/validators.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _authStore = GetIt.instance.get<AuthStore>();
  final _logger = GetIt.instance.get<Logger>();

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
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoIntro(),
                  // USER INPUT
                  Observer(
                    builder: (BuildContext context) => Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Column(children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextInput(
                              hintText: S.current.enterMail,
                              initialValue: _authStore.email,
                              onChanged: (value) => _authStore.email = value,
                              validator: (value) {
                                if (isNull(value) || !isEmail(value!)) {
                                  return S
                                      .current.pleaseEnterCorrectEmailFormat;
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextPasswordInput(
                              hintText: S.current.enterPassword,
                              initialValue: _authStore.password,
                              onChanged: (value) => _authStore.password = value,
                              validator: (value) {
                                if (isNull(value)) {
                                  return S.current.pleaseEnterSomeValue;
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: TextPasswordInput(
                              hintText: S.current.confirmPassword,
                              onChanged: (value) =>
                                  {_authStore.confirmPassword = value},
                              validator: (value) {
                                if (isNull(value)) {
                                  return S.current.pleaseEnterSomeValue;
                                }

                                if (_authStore.password != value) {
                                  return S.current.yourPasswordIsInCorrect;
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
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
      try {
        var cancelableLogin = CancelableOperation.fromFuture(
          _authStore.registerAsync(_authStore.email, _authStore.password),
        );

        cancelableLogin.then(
          (_) {
            // Dismiss dialog
            Navigator.of(context, rootNavigator: true).pop();
            // Go to login
            Navigator.pushNamed(context, RouteConstants.login);
          }
        );

        showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            var haveMsgToSpeak = false;
            var msg = "";

            return StatefulBuilder(builder: (context, setDialogState) {
              cancelableLogin.then(
                (_) {},
                onError: (err, trace) {
                  setDialogState(() {
                    haveMsgToSpeak = true;
                    if (err is DioError) {
                      msg = err.response?.data["message"];
                    }
                  });
                },
              );

              return AlertDialog(
                title: Center(child: Text(S.current.processing.titleCase)),
                content: Align(
                  heightFactor: 1,
                  alignment: Alignment.center,
                  child: !haveMsgToSpeak
                      ? const CircularProgressIndicator()
                      : Text(msg),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(S.current.cancel.toUpperCase()),
                    onPressed: () {
                      if (cancelableLogin.isCompleted) {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                      cancelableLogin.cancel();
                    },
                  ),
                ],
              );
            });
          },
        );
      } on DioError catch (err) {
        rethrow;
      }
    }
  }
}
