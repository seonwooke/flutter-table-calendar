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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDKNWW9R2o4gXj1jnulW2b-WQcvX6FTL_Q',
    appId: '1:500181429441:web:4d1c96fb2ecfec8b203840',
    messagingSenderId: '500181429441',
    projectId: 'flutter-table-calendar-5afe2',
    authDomain: 'flutter-table-calendar-5afe2.firebaseapp.com',
    storageBucket: 'flutter-table-calendar-5afe2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbT7Sv8sFrpDdb2-SC7fiFGz-MhkDRBpk',
    appId: '1:500181429441:android:3c9f4efa9636eade203840',
    messagingSenderId: '500181429441',
    projectId: 'flutter-table-calendar-5afe2',
    storageBucket: 'flutter-table-calendar-5afe2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSSyBhd51Z8yWKWUSpmg0AumkRa_sdylA',
    appId: '1:500181429441:ios:afa3f35c5b75887e203840',
    messagingSenderId: '500181429441',
    projectId: 'flutter-table-calendar-5afe2',
    storageBucket: 'flutter-table-calendar-5afe2.appspot.com',
    iosClientId: '500181429441-mtmh6b84fpj0kn8bnpftt7e3qo5rulp6.apps.googleusercontent.com',
    iosBundleId: 'com.example.tableCalendar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSSyBhd51Z8yWKWUSpmg0AumkRa_sdylA',
    appId: '1:500181429441:ios:5a3cb5e49bd7aae3203840',
    messagingSenderId: '500181429441',
    projectId: 'flutter-table-calendar-5afe2',
    storageBucket: 'flutter-table-calendar-5afe2.appspot.com',
    iosClientId: '500181429441-9ht0a8ffmtis99c8dfvfpb6a7uf2pod8.apps.googleusercontent.com',
    iosBundleId: 'com.example.tableCalendar.RunnerTests',
  );
}