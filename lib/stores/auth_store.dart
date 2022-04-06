import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/responses/auth_response.dart';
import 'package:leet_tutur/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final _authService = GetIt.instance.get<AuthService>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  ObservableFuture<AuthResponse>? authResponse;

  @action
  Future loginAsync(String email, String password) async => authResponse =
      ObservableFuture(_authService.loginAsync(email, password));

  @action
  Future retrieveLocalLoginResponseAsync() async => authResponse =
      ObservableFuture(_authService.retrieveLocalLoginResponseAsync());

  @action
  Future registerAsync(String email, String password) async => authResponse =
      ObservableFuture(_authService.registerAsync(email, password));
}
