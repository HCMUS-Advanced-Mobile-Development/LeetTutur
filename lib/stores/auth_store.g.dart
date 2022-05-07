// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  late final _$emailAtom = Atom(name: '_AuthStore.email', context: context);

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

  late final _$oldPasswordAtom =
      Atom(name: '_AuthStore.oldPassword', context: context);

  @override
  String get oldPassword {
    _$oldPasswordAtom.reportRead();
    return super.oldPassword;
  }

  @override
  set oldPassword(String value) {
    _$oldPasswordAtom.reportWrite(value, super.oldPassword, () {
      super.oldPassword = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStore.password', context: context);

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

  late final _$confirmPasswordAtom =
      Atom(name: '_AuthStore.confirmPassword', context: context);

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

  late final _$authResponseAtom =
      Atom(name: '_AuthStore.authResponse', context: context);

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

  late final _$loginAsyncAsyncAction =
      AsyncAction('_AuthStore.loginAsync', context: context);

  @override
  Future<dynamic> loginAsync(String email, String password) {
    return _$loginAsyncAsyncAction.run(() => super.loginAsync(email, password));
  }

  late final _$loginWithGoogleAsyncAsyncAction =
      AsyncAction('_AuthStore.loginWithGoogleAsync', context: context);

  @override
  Future<AuthResponse> loginWithGoogleAsync(String token) {
    return _$loginWithGoogleAsyncAsyncAction
        .run(() => super.loginWithGoogleAsync(token));
  }

  late final _$loginWithFacebookAsyncAsyncAction =
      AsyncAction('_AuthStore.loginWithFacebookAsync', context: context);

  @override
  Future<AuthResponse> loginWithFacebookAsync(String token) {
    return _$loginWithFacebookAsyncAsyncAction
        .run(() => super.loginWithFacebookAsync(token));
  }

  late final _$retrieveLocalLoginResponseAsyncAsyncAction = AsyncAction(
      '_AuthStore.retrieveLocalLoginResponseAsync',
      context: context);

  @override
  Future<dynamic> retrieveLocalLoginResponseAsync() {
    return _$retrieveLocalLoginResponseAsyncAsyncAction
        .run(() => super.retrieveLocalLoginResponseAsync());
  }

  late final _$registerAsyncAsyncAction =
      AsyncAction('_AuthStore.registerAsync', context: context);

  @override
  Future<dynamic> registerAsync(String email, String password) {
    return _$registerAsyncAsyncAction
        .run(() => super.registerAsync(email, password));
  }

  late final _$forgotPasswordAsyncAsyncAction =
      AsyncAction('_AuthStore.forgotPasswordAsync', context: context);

  @override
  Future<dynamic> forgotPasswordAsync(String email) {
    return _$forgotPasswordAsyncAsyncAction
        .run(() => super.forgotPasswordAsync(email));
  }

  late final _$refreshTokenAsyncAsyncAction =
      AsyncAction('_AuthStore.refreshTokenAsync', context: context);

  @override
  Future<dynamic> refreshTokenAsync() {
    return _$refreshTokenAsyncAsyncAction.run(() => super.refreshTokenAsync());
  }

  @override
  String toString() {
    return '''
email: ${email},
oldPassword: ${oldPassword},
password: ${password},
confirmPassword: ${confirmPassword},
authResponse: ${authResponse}
    ''';
  }
}
