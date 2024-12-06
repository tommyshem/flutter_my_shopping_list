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
    apiKey: 'AIzaSyCWUIj6MLFNgGT46P7g5gCgilNSU_-zHZQ',
    appId: '1:419101855354:web:5d7809849591850a70b5c3',
    messagingSenderId: '419101855354',
    projectId: 'shopping-list-db6b6',
    authDomain: 'shopping-list-db6b6.firebaseapp.com',
    databaseURL: 'https://shopping-list-db6b6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shopping-list-db6b6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBshiV7DvXYeUtabiNSfWl4g4K6Mb41f4I',
    appId: '1:419101855354:android:617ba447558aee1670b5c3',
    messagingSenderId: '419101855354',
    projectId: 'shopping-list-db6b6',
    databaseURL: 'https://shopping-list-db6b6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shopping-list-db6b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6LjWZZHezAR9WqVoH3h3ARzhfhTuJ_Yo',
    appId: '1:419101855354:ios:9c0bee9757e3cc5070b5c3',
    messagingSenderId: '419101855354',
    projectId: 'shopping-list-db6b6',
    databaseURL: 'https://shopping-list-db6b6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shopping-list-db6b6.appspot.com',
    iosClientId: '419101855354-2m1r1s349bb1faib4m0qi8g1g5r7edb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseShoppingList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6LjWZZHezAR9WqVoH3h3ARzhfhTuJ_Yo',
    appId: '1:419101855354:ios:9c0bee9757e3cc5070b5c3',
    messagingSenderId: '419101855354',
    projectId: 'shopping-list-db6b6',
    databaseURL: 'https://shopping-list-db6b6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'shopping-list-db6b6.appspot.com',
    iosClientId: '419101855354-2m1r1s349bb1faib4m0qi8g1g5r7edb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseShoppingList',
  );
}
