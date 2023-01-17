import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/household_location.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group("HouseholdLocation Page", () {
    final mockObserver = MockNavigatorObserver();

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: const HouseholdLocationPage(),
        ),
      );
    }

    setUpAll(() {
      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
    });

    testWidgets('is initialized correctly', (widgetTester) async {
      await buildTester(widgetTester);
      await widgetTester.pumpAndSettle();

      expect(
        find.widgetWithText(
          DigitTextFormField,
          i18.householdLocation.householdLocationLabelText,
        ),
        findsWidgets,
      );
      expect(
        find.widgetWithText(
          DigitElevatedButton,
          i18.householdLocation.actionLabel,
        ),
        findsOneWidget,
      );
    });
  });
}
