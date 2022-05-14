import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/requests/change_password_request.dart';
import 'package:leet_tutur/models/responses/auth_response.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final _authService = GetIt.instance.get<AuthService>();

  @observable
  String email = '';

  @observable
  String oldPassword = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  ObservableFuture<AuthResponse>? authResponseFuture;

  @computed
  User? get currentUser => authResponseFuture?.value?.user;

  @action
  Future<AuthResponse> loginAsync(String email, String password) async =>
      authResponseFuture =
          ObservableFuture(_authService.loginAsync(email, password));

  @action
  Future<User> getUserInfoAsync() async {
    var user = await _authService.getUserInfoAsync();
    authResponseFuture?.value?.user = user;
    return user;
  }

  @action
  Future<AuthResponse> loginWithGoogleAsync(String token) async =>
      authResponseFuture =
          ObservableFuture(_authService.loginWithGoogleAsync(token));

  @action
  Future<AuthResponse> loginWithFacebookAsync(String token) async =>
      authResponseFuture =
          ObservableFuture(_authService.loginWithFacebookAsync(token));

  @action
  Future retrieveLocalLoginResponseAsync() async => authResponseFuture =
      ObservableFuture(_authService.retrieveLocalLoginResponseAsync());

  @action
  Future registerAsync(String email, String password) async =>
      authResponseFuture =
          ObservableFuture(_authService.registerAsync(email, password));

  @action
  Future forgotPasswordAsync(String email) async {
    authResponseFuture = null;
    await _authService.forgotPasswordAsync(email);
  }

  @action
  Future refreshTokenAsync() async =>
      authResponseFuture = ObservableFuture(_authService.refreshTokenAsync());

  Future changePasswordAsync({ChangePasswordRequest? request}) async =>
      await _authService.changePasswordAsync(request: request);
}
