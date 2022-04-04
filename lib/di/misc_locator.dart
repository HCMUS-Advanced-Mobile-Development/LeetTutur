import 'package:get_it/get_it.dart';
import 'package:leet_tutur/utils/api_utils.dart';
import 'package:logger/logger.dart';

class MiscLocator {
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton(Logger());
    getIt.registerSingleton(ApiUtils.constructDio());
  }
}
