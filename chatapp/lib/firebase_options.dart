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
    apiKey: 'AIzaSyD94r5BevlSui4u6OvVOm70drftlgcd8i0',
    appId: '1:1031828574650:web:3ea00a15bd2f3c3dfd0d83',
    messagingSenderId: '1031828574650',
    projectId: 'chat-app-a55a3',
    authDomain: 'chat-app-a55a3.firebaseapp.com',
    storageBucket: 'chat-app-a55a3.appspot.com',
    measurementId: 'G-G0GQZMQRE7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_vMYLQ2JunlR5VvGJF5GxGKerDtEAHRs',
    appId: '1:1031828574650:android:f93b31d344882316fd0d83',
    messagingSenderId: '1031828574650',
    projectId: 'chat-app-a55a3',
    storageBucket: 'chat-app-a55a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbKHgHs3I62FCYB1UdwS8xctvp07-h6Cc',
    appId: '1:1031828574650:ios:6b02d09e538ea7b6fd0d83',
    messagingSenderId: '1031828574650',
    projectId: 'chat-app-a55a3',
    storageBucket: 'chat-app-a55a3.appspot.com',
    iosBundleId: 'com.example.chataps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbKHgHs3I62FCYB1UdwS8xctvp07-h6Cc',
    appId: '1:1031828574650:ios:000c0ee0127ab974fd0d83',
    messagingSenderId: '1031828574650',
    projectId: 'chat-app-a55a3',
    storageBucket: 'chat-app-a55a3.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
