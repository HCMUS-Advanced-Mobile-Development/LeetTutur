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
import 'package:recase/recase.dart';
import 'package:validators/validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _authStore = GetIt.instance.get<AuthStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.forgotPassword),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/geometry-bg.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoIntro(),
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
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: _handleForgotPassword,
                                  child: Text(
                                      S.current.resetPassword.toUpperCase())),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _handleForgotPassword() async {
    if (_formKey.currentState!.validate()) {
      var cancelableOperation = CancelableOperation.fromFuture(
        _authStore.forgotPasswordAsync(_authStore.email),
      );

      cancelableOperation.then(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(S.current.resetPasswordCheckYourMail),
          ));
          // Dismiss dialog
          Navigator.of(context, rootNavigator: true).pop();
          // Go to home
          Navigator.pushNamed(context, RouteConstants.login);
        },
      );

      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          var haveMsgToSpeak = false;
          var msg = "";

          return StatefulBuilder(builder: (context, setDialogState) {
            cancelableOperation.then(
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
                    if (cancelableOperation.isCompleted) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    cancelableOperation.cancel();
                  },
                ),
              ],
            );
          });
        },
      );
    }
  }
}
