import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/individual_details.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:mocktail/mocktail.dart';

class MockStackRouter extends Mock implements StackRouter {
  @override
  bool canPop({
    bool ignoreChildRoutes = false,
    bool ignoreParentRoutes = false,
    bool ignorePagelessRoutes = false,
  }) {
    return true;
  }
}

void main() {
  group('Individual Details Page', () {
    final mockStackRouter = MockStackRouter();
    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        Center(
          child: MaterialApp(
            home: StackRouterScope(
              controller: mockStackRouter,
              stateHash: 1,
              child: const IndividualDetailsPage(),
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
