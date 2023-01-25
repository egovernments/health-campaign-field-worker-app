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
      appConfiguration: AppConfiguration()
        ..genderOptions = [
          GenderOptions()
            ..name = 'MALE'
            ..code = 'MALE',
          GenderOptions()
            ..name = 'FEMALE'
            ..code = 'FEMALE',
          GenderOptions()
            ..name = 'OTHER'
            ..code = 'OTHER',
        ],
    );
  }
}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Individual Details Page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();
    final appRouter = AppRouter();
    AppInitializationBloc appInitializationBloc = MockAppInitializationBloc();

    setUpAll(() {
      when(() => appInitializationBloc.state)
          .thenAnswer((invocation) => AppInitialized(
                appConfiguration: AppConfiguration()
                  ..genderOptions = [
                    GenderOptions()
                      ..name = 'MALE'
                      ..code = 'MALE',
                    GenderOptions()
                      ..name = 'FEMALE'
                      ..code = 'FEMALE',
                    GenderOptions()
                      ..name = 'OTHER'
                      ..code = 'OTHER',
                  ],
              ));

      for (final element in [
        i18.individualDetails.submitButtonLabelText,
        i18.individualDetails.individualsDetailsLabelText,
        i18.individualDetails.nameLabelText,
        i18.individualDetails.checkboxLabelText,
        i18.individualDetails.idTypeLabelText,
        i18.individualDetails.idNumberLabelText,
        i18.individualDetails.idNumberSuggestionText,
        i18.individualDetails.dobLabelText,
        i18.individualDetails.ageLabelText,
        i18.individualDetails.separatorLabelText,
        i18.individualDetails.genderLabelText,
        i18.individualDetails.mobileNumberLabelText,
        i18.individualDetails.submitButtonLabelText,
        'MALE',
        'FEMALE',
        'OTHER',
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
                IndividualDetailsRoute(appLocalizations: mockLocalization),
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
            i18.individualDetails.submitButtonLabelText,
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
            DigitTextFormField,
            i18.individualDetails.nameLabelText,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.individualDetails.idTypeLabelText,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.individualDetails.idNumberLabelText,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitDobPicker,
            i18.individualDetails.dobLabelText,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitDropdown,
            i18.individualDetails.genderLabelText,
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            DigitTextFormField,
            i18.individualDetails.mobileNumberLabelText,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
