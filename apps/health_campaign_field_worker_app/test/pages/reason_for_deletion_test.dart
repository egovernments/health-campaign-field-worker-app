//Unit Test Code
import 'package:flutter_test/flutter_test.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/blocs/app_initialization/app_initialization.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/data/local_store/no_sql/schema/app_configuration.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:health_campaign_field_worker_app/widgets/header/back_navigation_help_header.dart';
import 'package:mocktail/mocktail.dart';

import '../router/router.dart';
import 'login_test.dart';

class MockAppInitializationBloc extends Mock implements AppInitializationBloc {
  @override
  Stream<AppInitializationState> get stream async* {
    yield AppInitialized(
      appConfiguration: AppConfiguration()
        ..householdDeletionReasonOptions = [
          HouseholdDeletionReasonOptions()
            ..name = 'HOUSEHOLD_RELOCATED'
            ..code = 'HOUSEHOLD_RELOCATED',
          HouseholdDeletionReasonOptions()
            ..name = 'HOUSEHOLD_DOES_NOT_EXIST'
            ..code = 'HOUSEHOLD_DOES_NOT_EXIST',
        ],
    );
  }
}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Login page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();
    AppInitializationBloc appInitializationBloc = MockAppInitializationBloc();

    setUpAll(() {
      when(() => appInitializationBloc.state)
          .thenAnswer((invocation) => AppInitialized(
                appConfiguration: AppConfiguration()
                  ..householdDeletionReasonOptions = [
                    HouseholdDeletionReasonOptions()
                      ..name = 'HOUSEHOLD_RELOCATED'
                      ..code = 'HOUSEHOLD_RELOCATED',
                    HouseholdDeletionReasonOptions()
                      ..name = 'HOUSEHOLD_DOES_NOT_EXIST'
                      ..code = 'HOUSEHOLD_DOES_NOT_EXIST',
                  ],
              ));

      for (final element in [
        i18.reasonForDeletion.reasonForDeletionLabel,
        'HOUSEHOLD_RELOCATED',
        'HOUSEHOLD_DOES_NOT_EXIST',
      ]) {
        when(() => mockLocalization.translate(element)).thenReturn(element);
      }
    });

    registerFallbackValue(FakeRoute());
    registerFallbackValue(FakeDialogRoute());

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: appInitializationBloc,
          child: MaterialApp.router(
            routerDelegate: AutoRouterDelegate.declarative(
              appRouter,
              navigatorObservers: () => [mockObserver],
              routes: (PendingRoutesHandler handler) => [
                ReasonForDeletionRoute(appLocalizations: mockLocalization),
              ],
            ),
          ),
        ),
      );
    }

    testWidgets(
      'Test ReasonForDeletionPage Widget',
      (WidgetTester widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();
        // Create the widget by telling the tester to build it.

        // Create our Finders
        final headerFinder = find.byType(BackNavigationHelpHeaderWidget);

        // Use the `findsOneWidget` matcher provided by flutter to verify that
        // there is exactly one widget in the tree with the type BackNavigationHelpHeaderWidget
        expect(headerFinder, findsOneWidget);

        final cardFinder = find.byType(DigitCard);

        // Use the `findsOneWidget` matcher provided by flutter to verify that
        // there is exactly one widget in the tree with the type DigitCard
        expect(cardFinder, findsOneWidget);

        final textFinder = find.text(
          i18.reasonForDeletion.reasonForDeletionLabel,
        );

        // Use the `findsOneWidget` matcher provided by flutter to verify that
        // there is exactly one widget in the tree with text Reason for Deletion
        expect(textFinder, findsOneWidget);

        final radioListTileFinder = find.byType(DigitRadioListTile);

        expect(radioListTileFinder, findsAtLeastNWidgets(1));
        // Use the `findsNWidgets` matcher provided by flutter to verify that
        // there are
      },
    );
  });
}
