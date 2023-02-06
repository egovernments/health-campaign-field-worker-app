import 'package:digit_components/digit_components.dart';
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
      appConfiguration: AppConfiguration()
        ..deliveryCommentOptions = [
          DeliveryCommentOptions()
            ..code = 'INSUFFICIENT_RESOURCES'
            ..name = 'INSUFFICIENT_RESOURCES',
          DeliveryCommentOptions()
            ..code = 'BENEFICIARY_REFUSED'
            ..name = 'BENEFICIARY_REFUSED',
          DeliveryCommentOptions()
            ..code = 'BENEFICIARY_ABSENT'
            ..name = 'BENEFICIARY_ABSENT',
        ],
    );
  }
}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Deliver Intervention  Page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();
    AppInitializationBloc appInitializationBloc = MockAppInitializationBloc();

    setUpAll(() {
      when(() => appInitializationBloc.state)
          .thenAnswer((invocation) => AppInitialized(
                appConfiguration: AppConfiguration()
                  ..deliveryCommentOptions = [
                    DeliveryCommentOptions()
                      ..code = 'INSUFFICIENT_RESOURCES'
                      ..name = 'INSUFFICIENT_RESOURCES',
                    DeliveryCommentOptions()
                      ..code = 'BENEFICIARY_REFUSED'
                      ..name = 'BENEFICIARY_REFUSED',
                    DeliveryCommentOptions()
                      ..code = 'BENEFICIARY_ABSENT'
                      ..name = 'BENEFICIARY_ABSENT',
                  ],
              ));

      for (final element in [
        i18.deliverIntervention.deliverInterventionLabel,
        i18.deliverIntervention.dateOfRegistrationLabel,
        i18.deliverIntervention.resourceDeliveredLabel,
        i18.deliverIntervention.quantityDistributedLabel,
        i18.deliverIntervention.deliveryCommentLabel,
        i18.deliverIntervention.idTypeText,
        i18.deliverIntervention.idNumberText,
        i18.deliverIntervention.memberCountText,
        i18.deliverIntervention.noOfResourcesForDelivery,
        i18.deliverIntervention.dialogTitle,
        i18.deliverIntervention.dialogContent,
        i18.common.coreCommonAge,
        i18.common.coreCommonGender,
        i18.common.coreCommonMobileNumber,
        i18.common.coreCommonCancel,
        i18.common.coreCommonSubmit,
        i18.householdOverView.householdOverViewHouseholdHeadLabel,
        'INSUFFICIENT_RESOURCES',
        'BENEFICIARY_REFUSED',
        'BENEFICIARY_ABSENT',
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
                DeliverInterventionRoute(appLocalizations: mockLocalization),
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
          find.widgetWithText(DigitElevatedButton, i18.common.coreCommonSubmit),
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

    testWidgets(
      'Ensure that all static components are initialized and rendered correctly',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();
        expect(
          find.widgetWithText(
            DigitIntegerFormPicker,
            i18.deliverIntervention.quantityDistributedLabel,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.deliverIntervention.deliveryCommentLabel,
          ),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.deliverIntervention.resourceDeliveredLabel,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
