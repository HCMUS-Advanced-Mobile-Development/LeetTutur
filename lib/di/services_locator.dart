import 'package:get_it/get_it.dart';
import 'package:leet_tutur/services/auth_service.dart';
import 'package:leet_tutur/services/schedule_service.dart';
import 'package:leet_tutur/services/tutor_service.dart';


class ServiceLocator {
    static void setUp() {
      final getIt = GetIt.instance;

      getIt.registerSingleton(AuthService());
      getIt.registerSingleton(TutorService());
      getIt.registerSingleton(ScheduleService());
    }
}
