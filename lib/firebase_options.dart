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

      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUy_xzuSk_4eOh0iK3vr7ZznYTYpX9l04',
    appId: '1:983521269920:web:64b0b436ab33743678d1c5',
    messagingSenderId: '983521269920',
    projectId: 'royal-test-de10c',
    authDomain: 'royal-test-de10c.firebaseapp.com',
    storageBucket: 'royal-test-de10c.appspot.com',
    measurementId: 'G-HDE6RSSMNE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg0fteJbtRf6MQhqvZuTsI6aPiisEnnB4',
    appId: '1:983521269920:android:c7175b2dc41e47b778d1c5',
    messagingSenderId: '983521269920',
    projectId: 'royal-test-de10c',
    storageBucket: 'royal-test-de10c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWnp3c8aQCkEgfM9OlzG8pgEUwYkC8sUc',
    appId: '1:983521269920:ios:b43a1d8ad8cf59bb78d1c5',
    messagingSenderId: '983521269920',
    projectId: 'royal-test-de10c',
    storageBucket: 'royal-test-de10c.appspot.com',
    iosBundleId: 'com.example.royalTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUy_xzuSk_4eOh0iK3vr7ZznYTYpX9l04',
    appId: '1:983521269920:web:e7dbb9b64a005c5578d1c5',
    messagingSenderId: '983521269920',
    projectId: 'royal-test-de10c',
    authDomain: 'royal-test-de10c.firebaseapp.com',
    storageBucket: 'royal-test-de10c.appspot.com',
    measurementId: 'G-WHLM0Q2G2S',
  );
}