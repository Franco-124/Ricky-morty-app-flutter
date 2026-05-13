import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDlh8aG8Cj_GQvr3KlU2zKdGzSzs3OLnd8',
    appId: '1:977159803476:web:310cf8bf549e1e65a1d3c1',
    messagingSenderId: '977159803476',
    projectId: 'tercerproyectoex',
    authDomain: 'tercerproyectoex.firebaseapp.com',
    storageBucket: 'tercerproyectoex.firebasestorage.app',
    measurementId: 'G-HJ8DLBVTJN',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFXc4S6IS7kY1qcTFNcA2r7i3JfUUcBBY',
    appId: '1:977159803476:ios:fec3afedef13606ba1d3c1',
    messagingSenderId: '977159803476',
    projectId: 'tercerproyectoex',
    storageBucket: 'tercerproyectoex.firebasestorage.app',
    iosClientId: '977159803476-q1plt4olnl712na2mokb5indgdts13gc.apps.googleusercontent.com',
    iosBundleId: 'com.ejemploOrganization.secondAppp',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmfxBPbPJN2cre3wsjdwEJWM1PYPUVhzc',
    appId: '1:977159803476:android:aa1e2c92b2840f6ba1d3c1',
    messagingSenderId: '977159803476',
    projectId: 'tercerproyectoex',
    storageBucket: 'tercerproyectoex.firebasestorage.app',
  );

}