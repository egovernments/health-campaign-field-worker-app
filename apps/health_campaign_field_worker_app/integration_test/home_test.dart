import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'helper_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home page flow', () {
    late FlutterExceptionHandler originalOnError;

    setUp(() {
      // Save the original FlutterError handler
      originalOnError = FlutterError.onError!;
    });

    tearDown(() {
      // Restore the original FlutterError handler after each test
      FlutterError.onError = originalOnError;
    });

    testWidgets('Home page flow', (WidgetTester tester) async {
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

        expect(find.byType(HomePage), findsOneWidget);

        await tester.tap(find.byKey(const Key('home_page_selected_boundary')));

        await tester.pump(const Duration(seconds: 1));

        expect(find.byKey(const Key('boundary_form')), findsWidgets);

        // Find the submit button; here we assume it's a DigitButton with "Submit" in its label.
        final submitButtonFinder = find.byKey(const Key('boundary_selection_submit_button')); //find.text('boundary_selection_submit_button');
        expect(submitButtonFinder, findsOneWidget);

        // Tap the submit button.
        await tester.tap(submitButtonFinder);
        await tester.pumpAndSettle(const Duration(seconds: 5));

        await tester.tap(find.text('Proceed Without Downloading'));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(HomePage), findsOneWidget);
      } finally {
        // Restore FlutterError.onError to its original state
        FlutterError.onError = originalOnError;
      }
    });
  });
}

