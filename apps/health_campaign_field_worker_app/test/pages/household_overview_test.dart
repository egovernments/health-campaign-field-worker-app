import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/app_initialization/app_initialization.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/data/local_store/no_sql/schema/app_configuration.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:mocktail/mocktail.dart';

import '../router/router.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppInitializationBloc extends Mock implements AppInitializationBloc {
  @override
  Stream<AppInitializationState> get stream async* {
    yield AppInitialized(
      appConfiguration: AppConfiguration(),
    );
  }
}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Household OverView Page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();
    AppInitializationBloc appInitializationBloc = MockAppInitializationBloc();

    setUpAll(() {
      when(() => appInitializationBloc.state)
          .thenAnswer((invocation) => AppInitialized(
                appConfiguration: AppConfiguration(),
              ));

      for (final element in [
        i18.householdOverView.householdOverViewActionCardTitle,
        i18.householdOverView.householdOverViewLabel,
        i18.householdOverView.householdOverViewEditLabel,
        i18.householdOverView.householdOverViewDeleteLabel,
        i18.householdOverView.householdOverViewActionCardTitle,
        i18.householdOverView.householdOverViewPrimaryActionLabel,
        i18.householdOverView.householdOverViewSecondaryActionLabel,
        i18.householdOverView.householdOverViewEditIconText,
        i18.householdOverView.householdOverViewDeliveredIconLabel,
        i18.householdOverView.householdOverViewHouseholdHeadLabel,
        i18.householdOverView.householdOverViewHouseholdHeadNameLabel,
        i18.memberCard.deliverDetailsYearText,
        i18.householdOverView.householdOverViewAddActionText,
        i18.householdOverView.householdOverViewActionText,
        i18.memberCard.deleteIndividualActionText,
        i18.householdOverView.householdOverViewPrimaryActionLabel,
        i18.memberCard.assignAsHouseholdhead,
        i18.memberCard.editIndividualDetails,
        i18.householdOverView.householdOverViewActionCardTitle,
        i18.householdOverView.householdOverViewSecondaryActionLabel,
        i18.householdOverView.householdOverViewEditIconText,
        i18.householdOverView.householdOverViewNotDeliveredIconLabel,
        i18.householdOverView.householdOverViewDeliveredIconLabel,
        i18.memberCard.deliverInterventionSubmitLabel,
        i18.memberCard.deliverDetailsUpdateLabel,
        i18.memberCard.deliverDetailsYearText,
        i18.householdOverView.householdOverViewEditIconText,
        'Male',
        'Female',
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
                HouseholdOverViewRoute(appLocalizations: mockLocalization),
              ],
            ),
          ),
        ),
      );
    }

    testWidgets(
      'Ensure that Submit button is initialized and rendered correctly',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();

        expect(find.byType(DigitElevatedButton), findsAtLeastNWidgets(1));
        expect(
          find.widgetWithText(
            DigitElevatedButton,
            i18.householdOverView.householdOverViewActionText,
          ),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      'Ensure that correct number of DigitCards are rendered on screen',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();

        expect(find.byType(DigitCard), findsNWidgets(2));
      },
    );
  });
}
