import 'package:leet_tutur/models/login_response.dart';
import 'package:leet_tutur/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  ObservableFuture<LoginResponse>? loginResponse;

  @action
  Future loginAsync() async => loginResponse = ObservableFuture(AuthService.loginAsync(email, password));

  @action
  Future retrieveLocalLoginResponseAsync() async => loginResponse = ObservableFuture(AuthService.retrieveLocalLoginResponseAsync());
}
