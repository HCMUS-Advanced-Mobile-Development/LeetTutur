import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/services/user_service.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final _userService = GetIt.instance.get<UserService>();

  @observable
  ObservableFuture<User>? userFuture;

  @action
  Future<User> getUserInfoAsync() =>
      userFuture = ObservableFuture(_userService.getUserInfoAsync());

  @action
  Future<User> updateUserAsync(User user) =>
      userFuture = ObservableFuture(_userService.updateUserAsync(user));

  @action
  Future<User> updateAvatarAsync(String localPath) =>
      userFuture = ObservableFuture(_userService.updateAvatarAsync(localPath));

  Map<String, String> levelMap = <String, String>{
    "BEGINNER": "BEGINNER",
    "HIGHER_BEGINNER": "HIGHER BEGINNER",
    "PRE_INTERMEDIATE": "PRE INTERMEDIATE",
    "INTERMEDIATE": "INTERMEDIATE",
    "UPPER_INTERMEDIATE": "UPPER INTERMEDIATE",
    "ADVANCED": "ADVANCED",
    "PROFICIENCY": "PROFICIENCY"
  };
}
