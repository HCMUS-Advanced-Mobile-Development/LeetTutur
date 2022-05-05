import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OauthLocator {
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton(
      GoogleSignIn(
        scopes: [
          'email',
        ],
      ),
    );
  }
}
