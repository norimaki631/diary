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
    apiKey: 'AIzaSyBWZcRkPe5T2LD2QWu3l0aVe0xlmynbPsQ',
    appId: '1:743493409156:web:0f21f7b6a59ee17d0e25d1',
    messagingSenderId: '743493409156',
    projectId: 'diary-280dc',
    authDomain: 'diary-280dc.firebaseapp.com',
    storageBucket: 'diary-280dc.appspot.com',
    measurementId: 'G-VGS220BG71',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3_AN901GXgowuTyM8E5SsPIM96JaI0Iw',
    appId: '1:743493409156:android:4f6e3dba08f427a80e25d1',
    messagingSenderId: '743493409156',
    projectId: 'diary-280dc',
    storageBucket: 'diary-280dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCoh_7RY2BPiHpx_6K6Z7-5d3ZTv4tIM0',
    appId: '1:743493409156:ios:f24604b7d671e8db0e25d1',
    messagingSenderId: '743493409156',
    projectId: 'diary-280dc',
    storageBucket: 'diary-280dc.appspot.com',
    iosClientId: '743493409156-t3hkns0gun3via50offb70dbvqqv7t12.apps.googleusercontent.com',
    iosBundleId: 'com.sami.diary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCoh_7RY2BPiHpx_6K6Z7-5d3ZTv4tIM0',
    appId: '1:743493409156:ios:0934c9dda52bf2db0e25d1',
    messagingSenderId: '743493409156',
    projectId: 'diary-280dc',
    storageBucket: 'diary-280dc.appspot.com',
    iosClientId: '743493409156-vqimd571gig7ushfaord6ao38clkqi83.apps.googleusercontent.com',
    iosBundleId: 'com.tsuruo.diary',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWZcRkPe5T2LD2QWu3l0aVe0xlmynbPsQ',
    appId: '1:743493409156:web:789e2f1f87cccab20e25d1',
    messagingSenderId: '743493409156',
    projectId: 'diary-280dc',
    authDomain: 'diary-280dc.firebaseapp.com',
    storageBucket: 'diary-280dc.appspot.com',
    measurementId: 'G-27KN4FSWF1',
  );

}