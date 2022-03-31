// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$emailAtom = Atom(name: '_AuthStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_AuthStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$loginResponseAtom = Atom(name: '_AuthStore.loginResponse');

  @override
  ObservableFuture<LoginResponse>? get loginResponse {
    _$loginResponseAtom.reportRead();
    return super.loginResponse;
  }

  @override
  set loginResponse(ObservableFuture<LoginResponse>? value) {
    _$loginResponseAtom.reportWrite(value, super.loginResponse, () {
      super.loginResponse = value;
    });
  }

  final _$loginAsyncAsyncAction = AsyncAction('_AuthStore.loginAsync');

  @override
  Future<dynamic> loginAsync() {
    return _$loginAsyncAsyncAction.run(() => super.loginAsync());
  }

  final _$retrieveLocalLoginResponseAsyncAsyncAction =
      AsyncAction('_AuthStore.retrieveLocalLoginResponseAsync');

  @override
  Future<dynamic> retrieveLocalLoginResponseAsync() {
    return _$retrieveLocalLoginResponseAsyncAsyncAction
        .run(() => super.retrieveLocalLoginResponseAsync());
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
loginResponse: ${loginResponse}
    ''';
  }
}
