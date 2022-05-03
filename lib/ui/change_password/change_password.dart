import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/requests/change_password_request.dart';
import 'package:leet_tutur/stores/auth_store.dart';
import 'package:leet_tutur/widgets/text_input.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _authStore = GetIt.instance.get<AuthStore>();
  final _formKey = GlobalKey<FormState>();

  final sizedBox = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.changePassword.titleCase),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextInput(
                labelText: S.current.password,
                onChanged: (value) {
                  _authStore.oldPassword = value;
                },
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return S.current.thisFieldMustBeMoreThanSixChar;
                  }

                  return null;
                },
              ),
              sizedBox,
              TextInput(
                labelText: S.current.newPassword,
                onChanged: (value) {
                  _authStore.password = value;
                },
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return S.current.thisFieldMustBeMoreThanSixChar;
                  }

                  if (value != _authStore.confirmPassword) {
                    return S.current.yourPasswordIsInCorrect;
                  }

                  return null;
                },
              ),
              sizedBox,
              TextInput(
                labelText: S.current.confirmPassword,
                onChanged: (value) {
                  _authStore.confirmPassword = value;
                },
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return S.current.thisFieldMustBeMoreThanSixChar;
                  }

                  if (value != _authStore.password) {
                    return S.current.yourPasswordIsInCorrect;
                  }

                  return null;
                },
              ),
              sizedBox,
              sizedBox,
              ElevatedButton(
                onPressed: _handleChangePassword,
                child: Text(
                  S.current.submit.toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleChangePassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
        context: context,
        builder: (context) {
          var futureState = FutureStatus.pending;
          var errMsg = "";

          return AlertDialog(
            content: Align(
              heightFactor: 1,
              child: StatefulBuilder(
                builder: (context, setDialogState) {
                  _authStore
                      .changePasswordAsync(
                        request: ChangePasswordRequest(
                          password: _authStore.oldPassword,
                          newPassword: _authStore.confirmPassword,
                        ),
                      )
                      .then((value) => setDialogState(
                            () {
                              futureState = FutureStatus.fulfilled;
                            },
                          ))
                      .catchError((err) => setDialogState(
                            () {
                              futureState = FutureStatus.rejected;
                              errMsg = (err as DioError).response?.data["message"];
                            },
                          ));

                  if (futureState == FutureStatus.fulfilled) {
                    return Text(S.current.changePasswordSuccessfully);
                  } else if (futureState == FutureStatus.rejected) {
                    return Text(errMsg);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          );
        });
  }
}
