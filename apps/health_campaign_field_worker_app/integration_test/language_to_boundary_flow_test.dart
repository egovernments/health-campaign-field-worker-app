import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/home.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:health_campaign_field_worker_app/pages/project_selection.dart';
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

        // Use shared navigation helper
        await languageSelectionPageHelper(tester);

        // Check for errors during test
        var exception = tester.takeException();
        if (exception != null) {
          debugPrint('Unhandled exception: $exception');
        }

        // Verify navigation to login
        expect(find.byType(LoginPage), findsOneWidget);

        // Enter credentials(Valid credentials flow)
        await loginPageHelper(tester,'USR-260848','eGov@123',5);

        // Verify successful navigation
        expect(find.byType(ProjectSelectionPage), findsOneWidget);

        // Wait for asynchronous operations to settle.
        await tester.pump(const Duration(seconds: 3));

        await tester.tap(find.byKey(const Key('projects')).first);

        // Wait for asynchronous operations to settle.
        await tester.pump(const Duration(seconds: 5));

        // Additionally, verify a part of the loaded UI exists.
        // For instance, check for the presence of a Form widget.
        expect(find.byKey(const Key('boundary_form')), findsWidgets);

        // Wait for asynchronous operations to settle.
        await tester.pump(const Duration(seconds: 1));

        // Find all DigitDropdown widgets that display boundaries.
        final dropdownFinder = find.byKey(const Key('boundary_selection_page_dropdown'));
        expect(dropdownFinder, findsWidgets);

        // For each dropdown, simulate a tap to open the dropdown menu,
        // then select the first option (dummyBoundary's code is "B1").
        final dropdownElements = dropdownFinder.evaluate().toList();
        for (final element in dropdownElements) {
          // Tap on the dropdown widget.
          await tester.tap(find.byWidget(element.widget));
          await tester.pumpAndSettle(const Duration(seconds: 1));

          // Locate the dropdown menu option; use find.text with the boundary code.
          final optionFinder = find.byType(Text);
          expect(optionFinder, findsWidgets);
          await tester.tap(optionFinder.first);
          await tester.pumpAndSettle(const Duration(seconds: 1));
        }

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

