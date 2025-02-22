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
    apiKey: 'AIzaSyDQ71akMe-qo0HwZlH1sfZuHBab5kYjtOU',
    appId: '1:821061575124:web:fbd75ca0a54371cee5f641',
    messagingSenderId: '821061575124',
    projectId: 'ecomt-36024',
    authDomain: 'ecomt-36024.firebaseapp.com',
    storageBucket: 'ecomt-36024.appspot.com',
    measurementId: 'G-1XR8KJVTNC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANa3bUKVSLeGs2_pNL-CxdkWwX12YCSJY',
    appId: '1:821061575124:android:cabe6442ab08174fe5f641',
    messagingSenderId: '821061575124',
    projectId: 'ecomt-36024',
    storageBucket: 'ecomt-36024.appspot.com',
  );
}
