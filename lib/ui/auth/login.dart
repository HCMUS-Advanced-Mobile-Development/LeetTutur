import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
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
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';
import 'package:validators/validators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authStore = GetIt.instance.get<AuthStore>();
  final _logger = GetIt.instance.get<Logger>();

  final _formKey = GlobalKey<FormState>();

  late final ReactionDisposer reactionDisposer;

  @override
  void initState() {
    _authStore.retrieveLocalLoginResponseAsync().then((value) {
      _logger.i("Detect tokens in local shared preferences. Auto login.");
      Navigator.pushNamed(context, RouteConstants.homeTabs);
    }).onError((error, stackTrace) {
      _logger.e(
          "Can't get token from local shared preferences", error, stackTrace);
    });

    super.initState();
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
                const LogoIntro(),
                // USER INPUT
                Observer(
                  builder: (context) => Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Column(children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: TextInput(
                            hintText: S.current.enterMail,
                            initialValue: _authStore.email,
                            onChanged: (value) => {_authStore.email = value},
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
                            initialValue: _authStore.password,
                            onChanged: (value) => {_authStore.password = value},
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
                                  style: const TextStyle(
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
                        const SizedBox(
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
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 50),
                  Text(S.current.dontHaveAccount),
                  const SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                        text: S.current.register,
                        style: const TextStyle(
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

  Future _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            var isLoginFailed = false;
            var errMessage = "";

            return StatefulBuilder(builder: (context, setDialogState) {
              var cancelableLogin = CancelableOperation.fromFuture(
                _authStore.loginAsync(_authStore.email, _authStore.password),
              );

              cancelableLogin.then(
                (_) {
                  // Dismiss dialog
                  Navigator.of(context, rootNavigator: true).pop();
                  // Go to home
                  Navigator.pushNamed(context, RouteConstants.homeTabs);
                },
                onCancel: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Dismiss alert dialog
                },
                onError: (err, trace) {
                  setDialogState(() {
                    isLoginFailed = true;

                    var dioErr = err as DioError;
                    errMessage = dioErr.response?.data["message"];

                    _logger.e(errMessage);
                  });

                  // Navigator.of(context, rootNavigator: true)
                  //     .pop();
                },
              );

              return AlertDialog(
                title: Center(child: Text(S.current.processing.titleCase)),
                content: Align(
                  heightFactor: 1,
                  alignment: Alignment.center,
                  child: !isLoginFailed
                      ? const CircularProgressIndicator()
                      : Text(errMessage),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(S.current.cancel.toUpperCase()),
                    onPressed: () {
                      cancelableLogin.cancel();
                    },
                  ),
                ],
              );
            });
          },
        );
      } on DioError catch (e) {
        rethrow;
      }
    }
  }
}
