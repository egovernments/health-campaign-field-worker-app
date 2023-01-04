import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:health_campaign_field_worker_app/utils/I18KeyConstants.dart';
import 'package:mocktail/mocktail.dart';

import '../router/router.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group("Household Details Page", () {
    final appRouter = AppRouter();
    setUpAll(() {
      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
    });
    final mockObserver = MockNavigatorObserver();

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerDelegate: AutoRouterDelegate.declarative(
            appRouter,
            navigatorObservers: () => [mockObserver],
            routes: (PendingRoutesHandler handler) => [
              const HouseHoldDetailsRoute(),
            ],
          ),
        ),
      );
    }

    testWidgets('is initialized correctly', (widgetTester) async {
      await buildTester(widgetTester);
      await widgetTester.pumpAndSettle();

      expect(
        find.widgetWithText(
          DigitDateFormPicker,
          i18.housholdDetails.dateOfRegistrationLabel,
        ),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(
          DigitElevatedButton,
          i18.housholdDetails.actionLabel,
        ),
        findsOneWidget,
      );
    });
  });
}
