import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/household_details/household_details.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';

import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:mocktail/mocktail.dart';

import '../router/router.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group("Household Details Page", () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();

    setUpAll(() {
      for (final element in [
        i18.housholdDetails.actionLabel,
        i18.housholdDetails.dateOfRegistrationLabel,
        i18.housholdDetails.householdDetailsLabel,
        i18.housholdDetails.noOfMembersCountLabel,
      ]) {
        when(() => mockLocalization.translate(element)).thenReturn(element);
      }

      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
    });

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => HouseholdDetailsBloc(const HouseholdDetailsState()),
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: AutoRouterDelegate.declarative(
            appRouter,
            navigatorObservers: () => [mockObserver],
            routes: (PendingRoutesHandler handler) => [
              HouseHoldDetailsRoute(appLocalizations: mockLocalization),
            ],
          ),
        ),
      ));
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
