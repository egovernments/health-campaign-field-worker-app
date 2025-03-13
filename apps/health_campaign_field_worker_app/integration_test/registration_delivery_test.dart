import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:registration_delivery/pages/beneficiary_registration/house_details.dart';
import 'package:registration_delivery/pages/beneficiary_registration/household_location.dart';
import 'package:registration_delivery/pages/beneficiary_registration/individual_details.dart';
import 'helper_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Registration delivery flow', () {
    late FlutterExceptionHandler originalOnError;

    setUp(() {
      // Save the original FlutterError handler
      originalOnError = FlutterError.onError!;
    });

    tearDown(() {
      // Restore the original FlutterError handler after each test
      FlutterError.onError = originalOnError;
    });

    testWidgets('Registration delivery flow', (WidgetTester tester) async {
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

        await tester.tap(find.byKey(const Key('registration_delivery_home_card')));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.enterText(find.byKey(const Key('registration_delivery_search_bar')), 'abcde');

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.tap(find.byKey(const Key('registration_delivery_register_household_button')));

        await tester.pumpAndSettle(const Duration(milliseconds: 500));

        expect(find.byType(HouseholdLocationPage),findsOneWidget);

        await tester.pump(const Duration(seconds: 10));

        await tester.tap(find.byKey(const Key('household_location_button')));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(HouseDetailsPage),findsOneWidget);

        final typeOfStructure = find.byType(Flexible);

        await tester.tap(typeOfStructure.first);

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.tap(find.byKey(const Key('house_details_next_button')));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.tap(find.byKey(const Key('household_details_next_button')));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(IndividualDetailsPage),findsOneWidget);

        await tester.tap(find.byKey(const Key('idTypeDropdown')));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.tap(find.text('Default'));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.tap(find.text('Male'));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        await tester.enterText(find.byKey(const Key('dobPicker')), '12 Mar 2023');

        await tester.pumpAndSettle(const Duration(seconds: 10));
      } finally {
        // Restore FlutterError.onError to its original state
        FlutterError.onError = originalOnError;
      }
    });
  });
}

