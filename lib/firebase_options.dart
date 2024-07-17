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
    apiKey: 'AIzaSyBeGD495TKS1zwTRu_Fb2u6p87J1SFJAHo',
    appId: '1:240012746899:web:bd53ead66995544c13ed66',
    messagingSenderId: '240012746899',
    projectId: 'tentertainment-9d170',
    authDomain: 'tentertainment-9d170.firebaseapp.com',
    storageBucket: 'tentertainment-9d170.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeqZEMRDU9vU3u0CRZoypxbqh-R1ZMJXE',
    appId: '1:240012746899:android:c4a5515468c4e8b613ed66',
    messagingSenderId: '240012746899',
    projectId: 'tentertainment-9d170',
    storageBucket: 'tentertainment-9d170.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs6oP5hEgwmMqyxUxgna3EdSCCv4cksgs',
    appId: '1:240012746899:ios:3c83bc8f57e9a37a13ed66',
    messagingSenderId: '240012746899',
    projectId: 'tentertainment-9d170',
    storageBucket: 'tentertainment-9d170.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs6oP5hEgwmMqyxUxgna3EdSCCv4cksgs',
    appId: '1:240012746899:ios:3c83bc8f57e9a37a13ed66',
    messagingSenderId: '240012746899',
    projectId: 'tentertainment-9d170',
    storageBucket: 'tentertainment-9d170.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBeGD495TKS1zwTRu_Fb2u6p87J1SFJAHo',
    appId: '1:240012746899:web:1ef0c36fc6e9ad7d13ed66',
    messagingSenderId: '240012746899',
    projectId: 'tentertainment-9d170',
    authDomain: 'tentertainment-9d170.firebaseapp.com',
    storageBucket: 'tentertainment-9d170.appspot.com',
  );
}
