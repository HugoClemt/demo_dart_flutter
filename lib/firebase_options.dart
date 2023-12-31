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
    apiKey: 'AIzaSyDcbCEDyr1vfvNFaHJ4lIYIj2JGgXJke9k',
    appId: '1:847976045418:web:0639fe8c3a69fd1182e313',
    messagingSenderId: '847976045418',
    projectId: 'asynconf-b1f4e',
    authDomain: 'asynconf-b1f4e.firebaseapp.com',
    storageBucket: 'asynconf-b1f4e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBlkYGKqY2dFyKE13FHLEGxfhCBBaeFVY',
    appId: '1:847976045418:android:cd0080c285bdb7da82e313',
    messagingSenderId: '847976045418',
    projectId: 'asynconf-b1f4e',
    storageBucket: 'asynconf-b1f4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB233Wz_t3C0RPh-92KmCJ-aDqx6q0dRSM',
    appId: '1:847976045418:ios:88a181b28fce8f6d82e313',
    messagingSenderId: '847976045418',
    projectId: 'asynconf-b1f4e',
    storageBucket: 'asynconf-b1f4e.appspot.com',
    iosBundleId: 'com.example.crocTop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB233Wz_t3C0RPh-92KmCJ-aDqx6q0dRSM',
    appId: '1:847976045418:ios:4b62066c8e1afbce82e313',
    messagingSenderId: '847976045418',
    projectId: 'asynconf-b1f4e',
    storageBucket: 'asynconf-b1f4e.appspot.com',
    iosBundleId: 'com.example.crocTop.RunnerTests',
  );
}
