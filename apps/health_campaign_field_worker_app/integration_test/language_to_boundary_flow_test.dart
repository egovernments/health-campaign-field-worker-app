import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'helper_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Complete flow from language page to boundary selection page', () {
    late FlutterExceptionHandler originalOnError;

    setUp(() {
      // Save the original FlutterError handler
      originalOnError = FlutterError.onError!;
    });

    tearDown(() {
      // Restore the original FlutterError handler after each test
      FlutterError.onError = originalOnError;
    });

    testWidgets('Complete flow test from language page to boundary selection page', (WidgetTester tester) async {
      // Override FlutterError.onError temporarily
      // Chain error handlers properly
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        debugPrint('Test Error: ${details.exception}');
        originalOnError?.call(details); // Forward to framework
      };

      try {
        // Run the app
        app.main();

        // Wait for the app to settle
        await tester.pumpAndSettle(const Duration(seconds: 5));

        await languageToHomepageHelper(tester);
      } finally {
        // Restore FlutterError.onError to its original state
        FlutterError.onError = originalOnError;
      }
    });
  });
}

