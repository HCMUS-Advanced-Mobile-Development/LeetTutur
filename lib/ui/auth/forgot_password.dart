import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:recase/recase.dart';
import 'package:validators/validators.dart';

import '../../constants/route_constants.dart';
import '../../generated/l10n.dart';
import '../../stores/auth_store/auth_store.dart';
import '../../widgets/text_input.dart';
import 'widgets/logo_intro.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final authStore = GetIt.instance.get<AuthStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(RouteConstants.forgotPassword.pascalCase),
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
                            initialValue: authStore.email,
                            onChanged: (value) => {
                              authStore.email = value
                            },
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
                                  onPressed: () {
                                    _formKey.currentState!.validate();
                                  },
                                  child: Text(S.current.resetPassword.toUpperCase())),
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
}
