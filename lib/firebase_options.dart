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
    apiKey: 'AIzaSyDOD4rFHeF-4u9dbejPYoUz_mT5FeqFFuE',
    appId: '1:921554877512:web:b83c1a4b4a064c02c46c7d',
    messagingSenderId: '921554877512',
    projectId: 'blinkbuy6',
    authDomain: 'blinkbuy6.firebaseapp.com',
    storageBucket: 'blinkbuy6.appspot.com',
    measurementId: 'G-FK2GKL7QDM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiViBDjOtJz9tI-4MxW6kNpOCCloCGuMk',
    appId: '1:921554877512:android:a0b5a09d0842f7b4c46c7d',
    messagingSenderId: '921554877512',
    projectId: 'blinkbuy6',
    storageBucket: 'blinkbuy6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz5f7Gj8S6AgB6kdk8cxkQR_dpCcii9h4',
    appId: '1:921554877512:ios:7f5aea8e4257e906c46c7d',
    messagingSenderId: '921554877512',
    projectId: 'blinkbuy6',
    storageBucket: 'blinkbuy6.appspot.com',
    iosBundleId: 'com.example.blinkbuy6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDz5f7Gj8S6AgB6kdk8cxkQR_dpCcii9h4',
    appId: '1:921554877512:ios:e35f9e3819c72ebfc46c7d',
    messagingSenderId: '921554877512',
    projectId: 'blinkbuy6',
    storageBucket: 'blinkbuy6.appspot.com',
    iosBundleId: 'com.example.blinkbuy6.RunnerTests',
  );
}
