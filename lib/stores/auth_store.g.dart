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

  final _$authResponseAtom = Atom(name: '_AuthStore.authResponse');

  @override
  ObservableFuture<AuthResponse>? get authResponse {
    _$authResponseAtom.reportRead();
    return super.authResponse;
  }

  @override
  set authResponse(ObservableFuture<AuthResponse>? value) {
    _$authResponseAtom.reportWrite(value, super.authResponse, () {
      super.authResponse = value;
    });
  }

  final _$loginAsyncAsyncAction = AsyncAction('_AuthStore.loginAsync');

  @override
  Future<dynamic> loginAsync(String email, String password) {
    return _$loginAsyncAsyncAction.run(() => super.loginAsync(email, password));
  }

  final _$retrieveLocalLoginResponseAsyncAsyncAction =
      AsyncAction('_AuthStore.retrieveLocalLoginResponseAsync');

  @override
  Future<dynamic> retrieveLocalLoginResponseAsync() {
    return _$retrieveLocalLoginResponseAsyncAsyncAction
        .run(() => super.retrieveLocalLoginResponseAsync());
  }

  final _$registerAsyncAsyncAction = AsyncAction('_AuthStore.registerAsync');

  @override
  Future<dynamic> registerAsync(String email, String password) {
    return _$registerAsyncAsyncAction
        .run(() => super.registerAsync(email, password));
  }

  final _$forgotPasswordAsyncAsyncAction =
      AsyncAction('_AuthStore.forgotPasswordAsync');

  @override
  Future<dynamic> forgotPasswordAsync(String email) {
    return _$forgotPasswordAsyncAsyncAction
        .run(() => super.forgotPasswordAsync(email));
  }

  final _$refreshTokenAsyncAsyncAction =
      AsyncAction('_AuthStore.refreshTokenAsync');

  @override
  Future<dynamic> refreshTokenAsync() {
    return _$refreshTokenAsyncAsyncAction.run(() => super.refreshTokenAsync());
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
authResponse: ${authResponse}
    ''';
  }
}
