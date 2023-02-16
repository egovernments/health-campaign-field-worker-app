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
    yield AppInitialized(appConfiguration: AppConfiguration());
  }
}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Stock Received Details Page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();
    AppInitializationBloc appInitializationBloc = MockAppInitializationBloc();

    setUpAll(() {
      when(() => appInitializationBloc.state).thenAnswer(
        (invocation) => AppInitialized(appConfiguration: AppConfiguration()),
      );

      for (final element in [
        i18.stockDetails.stockReceivedDetailsLabel,
        i18.stockDetails.stockIssuedDetailsLabel,
        i18.stockDetails.stockReturnedDetailsLabel,
        i18.stockDetails.stockDamagedDetailsLabel,
        i18.stockDetails.stockLostDetailsLabel,
        i18.stockDetails.selectProduct,
        i18.stockDetails.receivedFrom,
        i18.stockDetails.quantityReceived,
        i18.stockDetails.waybillNumber,
        i18.stockDetails.quantitySent,
        i18.stockDetails.noIndicatedOnWaybill,
        i18.stockDetails.noIndicatedOnThePackingSlip,
        i18.stockDetails.noOfPackingSlip,
        i18.stockDetails.typeOfTransport,
        i18.stockDetails.vehicleNumber,
        i18.stockDetails.comments,
        i18.common.coreCommonSubmit,
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
                StockReceivedDetailsRoute(appLocalizations: mockLocalization),
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

        expect(find.byType(DigitElevatedButton), findsOneWidget);
        expect(
          find.widgetWithText(
            DigitElevatedButton,
            i18.common.coreCommonSubmit,
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
    testWidgets(
      'Ensure that all static components are initialized and rendered correctly',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();
        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.stockDetails.selectProduct,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.stockDetails.receivedFrom,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.stockDetails.quantityReceived,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.stockDetails.waybillNumber,
          ),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.stockDetails.noIndicatedOnWaybill,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.stockDetails.typeOfTransport,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.stockDetails.vehicleNumber,
          ),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.stockDetails.comments,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
