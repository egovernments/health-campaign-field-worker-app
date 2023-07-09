library digit_firebase_services;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

export './crash_button.dart';

Future initialize({
  required FirebaseOptions options,
  ValueChanged<String>? onErrorMessage,
}) async {
  await Firebase.initializeApp(options: options);

  FlutterError.onError = (errorDetails) {
    onErrorMessage?.call(
      'Diagnostic node: '
      '${errorDetails.summary.name.toString()}',
    );
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    onErrorMessage?.call(error.toString());
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
