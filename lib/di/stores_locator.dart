import 'package:get_it/get_it.dart';
import 'package:leet_tutur/stores/auth_store/auth_store.dart';

class StoresLocator {
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton(AuthStore());
  }
}
