// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvNSDGB_M-C64vcTbX_Ct4xUGuWK2DPGQ',
    appId: '1:426115119499:android:6e5ce1c9c295602384978e',
    messagingSenderId: '426115119499',
    projectId: 'let-tutor-kafka',
    storageBucket: 'let-tutor-kafka.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6Dcvey3bpIwuA5O6Dtvms24PCm-IUt6k',
    appId: '1:426115119499:ios:dc045f2bfef3228d84978e',
    messagingSenderId: '426115119499',
    projectId: 'let-tutor-kafka',
    storageBucket: 'let-tutor-kafka.appspot.com',
    androidClientId: '426115119499-cscubu1tauk3r4js0tjjdprsp6jsvhj0.apps.googleusercontent.com',
    iosClientId: '426115119499-medo8vkjd90eaqjevcl1cmgp9a77hdvi.apps.googleusercontent.com',
    iosBundleId: 'com.hcmus.leetTutur',
  );
}
