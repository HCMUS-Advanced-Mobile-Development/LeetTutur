import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/learn_topic.dart';
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
        "learnTopics": user.learnTopics?.map((e) => e.id.toString()).toList() ?? [],
        "testPreparations": user.testPreparations?.map((e) => e.id.toString()).toList() ?? [],
      },
    );

    var newUser = User.fromJson(dioRes.data["user"]);

    _logger.i("Update user info: ${newUser.name}");

    return newUser;
  }

  Future<User> updateAvatarAsync(String localPath) async {
    var dioRes = await _dio.post(
      "/user/uploadAvatar",
      data: FormData.fromMap(
        {
          "avatar": await MultipartFile.fromFile(localPath),
        },
      ),
    );

    var user = User.fromJson(dioRes.data);

    _logger.i("Upload avatar: ${user.avatar}");

    return user;
  }

  Future<List<LearnTopic>> getLearnTopicsAsync() async {
    var dioRes = await _dio.get("/learn-topic");
    var topics = (dioRes.data as List).map((e) => LearnTopic.fromJson(e)).toList();

    _logger.i("Get learn topics: ${topics.length} items");

    return topics;
  }

  Future<List<LearnTopic>> getTestPreparationsAsync() async {
    var dioRes = await _dio.get("/test-preparation");
    var preparations = (dioRes.data as List)
        .map((e) => LearnTopic.fromJson(e))
        .toList();

    _logger.i("Get learn topics: ${preparations.length} items");

    return preparations;
  }
}
