import 'package:common/common.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

extension FirebaseConfig on Flavor {
  /// `web` の場合、 [Flavor] に応じた [FirebaseOptions] を返す。
  ///
  /// `web` 以外のプラットフォームの場合は `null` を返す。
  FirebaseOptions? get firebaseOptions {
    if (kIsWeb) {
      return this == Flavor.dev ? _devOptions : _prodOptions;
    }

    return null;
  }

  String get recaptchaSiteKey {
    return switch (this) {
      Flavor.dev => dotenv.env['RECAPTCHA_SITE_KEY_DEV']!,
      Flavor.prod => dotenv.env['RECAPTCHA_SITE_KEY_PROD']!,
    };
  }
}

const _devOptions = FirebaseOptions(
  apiKey: 'AIzaSyAmv7ihMazXZkLDFANrMMk_ePC1eKJ-rek',
  authDomain: 'dev-99725.firebaseapp.com',
  projectId: 'dev-99725',
  storageBucket: 'dev-99725.appspot.com',
  messagingSenderId: '937254513211',
  appId: '1:937254513211:web:62ba9dfe1cc0f310a48a1e',
  measurementId: 'G-DCK3KJPLP0',
);

const _prodOptions = FirebaseOptions(
  apiKey: 'AIzaSyDoSRdWAI3GCdMBbmCVjVdzTyEzBxwQwHs',
  authDomain: 'prod-7cdde.firebaseapp.com',
  projectId: 'prod-7cdde',
  storageBucket: 'prod-7cdde.appspot.com',
  messagingSenderId: '32864327402',
  appId: '1:32864327402:web:595d47afb47faa62d3a993',
  measurementId: 'G-DWBFS9Q3SE',
);
