import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:health_campaign_field_worker_app/utils/utils.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart' as i18;

import 'helper_test.dart';

import 'dart:io';

/// Returns the path to the adb executable.
/// It first checks the ANDROID_HOME or ANDROID_SDK_ROOT environment variable,
/// then appends the platform-tools directory and adb (or adb.exe on Windows).
String getAdbPath() {
  // Try to look up the Android SDK path from environment variables.
  final sdkPath = Platform.environment['ANDROID_HOME'] ??
      Platform.environment['ANDROID_SDK_ROOT'];
  if (sdkPath != null && sdkPath.isNotEmpty) {
    final adbBinary = Platform.isWindows ? 'adb.exe' : 'adb';
    // Construct the adb path based on the platform.
    final adbPath = Platform.isWindows
        ? '$sdkPath\\platform-tools\\$adbBinary'
        : '$sdkPath/platform-tools/$adbBinary';

    if (File(adbPath).existsSync()) {
      return adbPath;
    } else {
      // Log an informational message if adb is not found in the expected location.
      print('adb not found at computed path: $adbPath');
    }
  }
  // Fallback: If no environment variable is set or file doesn't exist,
  // assume that adb is available in the PATH.
  return 'adb';
}

// Helper function to grant permissions
Future<void> grantPermissions() async {
  if (Platform.isAndroid) {
// Use 'adb' if it's in your PATH; otherwise, provide the full path to adb.exe.
    final adbPath =  getAdbPath();
// List of permission commands to run. Adjust the package name and permissions as needed.
    final List<List<String>> commands = [
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.ACCESS_FINE_LOCATION'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.ACCESS_COARSE_LOCATION'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.READ_EXTERNAL_STORAGE'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.READ_PHONE_STATE'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.READ_CONTACTS'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.WRITE_CONTACTS'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.CAMERA'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.RECORD_AUDIO'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.USE_BIOMETRIC'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.INTERNET'],
      ['shell', 'pm', 'grant', 'com.LMJ.ounceapp', 'android.permission.VIBRATE'],
    ];
// Run each adb command sequentially
    for (final command in commands) {
      final result = await Process.run(adbPath, command);
      if (result.exitCode != 0) {
        debugPrint('Error granting permission with command $command: ${result.stderr}');
      } else {
        debugPrint('Granted permission with command $command');
      }
    }
  }
}

void main() async {
  // First, automatically grant permissions
  await grantPermissions();

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Language Selection Test', () {
    late FlutterExceptionHandler originalOnError;

    setUp(() {
      // Save the original FlutterError handler
      originalOnError = FlutterError.onError!;
    });

    tearDown(() {
      // Restore the original FlutterError handler after each test
      FlutterError.onError = originalOnError;
    });

    testWidgets('Test Language Selection Page', (WidgetTester tester) async {
      // Override FlutterError.onError temporarily
      FlutterError.onError = (FlutterErrorDetails details) {
        debugPrint('Caught error: ${details.exception}');
      };

      try {
        // Run the app
        app.main();

        // Wait for the app to settle
        await tester.pumpAndSettle(const Duration(seconds: 5));

        // Verify that we are on the Language Selection Page
        expect(find.byKey(const Key('language_selection_container')), findsOneWidget);

        // Select language option
        await languageSelectionPageHelper(tester);

        // Check for errors during test
        final exception = tester.takeException();
        if (exception != null) {
          debugPrint('Unhandled exception: $exception');
        }

        // Verify navigation to login
        expect(find.byType(LoginPage), findsOneWidget);
      } finally {
        // Restore FlutterError.onError to its original state
        FlutterError.onError = originalOnError;
      }
    });
  });
}

