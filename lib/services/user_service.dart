import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:logger/logger.dart';

class UserService {
  final _dio = GetIt.instance.get<Dio>();
  final _logger = GetIt.instance.get<Logger>();

  Future<User> getUserInfoAsync() async {
    var dioRes = await _dio.get("/user/info");

    var user = User.fromJson(dioRes.data["user"]);

    _logger.i("Get user info: ${user.name}");

    return user;
  }

  Future<User> updateUserAsync(User user) async {
    var dioRes = await _dio.put(
      "/user/info",
      data: {
        "birthday": user.birthday,
        "country": user.country,
        "level": user.level,
        "name": user.name,
        "phone": user.phone,
      },
    );

    var newUser = User.fromJson(dioRes.data["user"]);

    _logger.i("Update user info: ${newUser.name}");

    return newUser;
  }
}
