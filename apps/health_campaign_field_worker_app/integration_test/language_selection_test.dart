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

void main() {
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

