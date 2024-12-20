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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDfFUjdFXZjf-sgpC6Ubd8QvnAlyddEcmw',
    appId: '1:1050026223783:web:18a151727dac20cc8e1382',
    messagingSenderId: '1050026223783',
    projectId: 'flutterfirebasecoffeeapp',
    authDomain: 'flutterfirebasecoffeeapp.firebaseapp.com',
    storageBucket: 'flutterfirebasecoffeeapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8S9bJ3aakeXASDgh-XchoJTAsM7QUZ4g',
    appId: '1:1050026223783:android:7cda2bfc5e2638428e1382',
    messagingSenderId: '1050026223783',
    projectId: 'flutterfirebasecoffeeapp',
    storageBucket: 'flutterfirebasecoffeeapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU2qWcDhZWj5fsfYuU56-FBsfU-VW_RbQ',
    appId: '1:1050026223783:ios:65a82e526f7cf5388e1382',
    messagingSenderId: '1050026223783',
    projectId: 'flutterfirebasecoffeeapp',
    storageBucket: 'flutterfirebasecoffeeapp.appspot.com',
    iosBundleId: 'com.example.coffeeShopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBU2qWcDhZWj5fsfYuU56-FBsfU-VW_RbQ',
    appId: '1:1050026223783:ios:65a82e526f7cf5388e1382',
    messagingSenderId: '1050026223783',
    projectId: 'flutterfirebasecoffeeapp',
    storageBucket: 'flutterfirebasecoffeeapp.appspot.com',
    iosBundleId: 'com.example.coffeeShopApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfFUjdFXZjf-sgpC6Ubd8QvnAlyddEcmw',
    appId: '1:1050026223783:web:6c7f8d9ef36cfed18e1382',
    messagingSenderId: '1050026223783',
    projectId: 'flutterfirebasecoffeeapp',
    authDomain: 'flutterfirebasecoffeeapp.firebaseapp.com',
    storageBucket: 'flutterfirebasecoffeeapp.appspot.com',
  );
}
