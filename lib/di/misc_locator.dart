import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class MiscLocator {
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton(Logger());
  }
}
