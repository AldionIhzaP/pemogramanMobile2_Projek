// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAG53c9OZ0eqgMdq1AaXztiE-wZ39u-O5s',
    appId: '1:282064200981:web:e1bbec0801be04c975f51c',
    messagingSenderId: '282064200981',
    projectId: 'if22a-materi',
    authDomain: 'if22a-materi.firebaseapp.com',
    storageBucket: 'if22a-materi.firebasestorage.app',
    measurementId: 'G-PMXEYEHJ57',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANwkoxi1MV_2yJKMy2jSZUbAZs_0g_R0k',
    appId: '1:282064200981:android:52af47c15082200575f51c',
    messagingSenderId: '282064200981',
    projectId: 'if22a-materi',
    storageBucket: 'if22a-materi.firebasestorage.app',
  );

}