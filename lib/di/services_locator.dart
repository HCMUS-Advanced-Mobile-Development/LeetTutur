import 'package:get_it/get_it.dart';
import 'package:leet_tutur/services/auth_service.dart';

class ServiceLocator {
    static void setUp() {
      final getIt = GetIt.instance;

      getIt.registerSingleton(AuthService());
    }
}
