import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/pages/acknowledgement.dart';
import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:mocktail/mocktail.dart';

import '../widget_app.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppLocalization extends Mock implements AppLocalizations {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Acknowledgement page', () {
    final mockObserver = MockNavigatorObserver();
    final mockLocalization = MockAppLocalization();

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetApp(
          navigatorObserver: mockObserver,
          child: AcknowledgementPage(appLocalizations: mockLocalization),
        ),
      );
    }

    setUpAll(() {
      for (final element in [
        i18.acknowledgementSuccess.acknowledgementLabelText,
        i18.acknowledgementSuccess.acknowledgementDescriptionText,
        i18.acknowledgementSuccess.actionLabelText,
      ]) {
        when(() => mockLocalization.translate(element)).thenReturn(element);
      }

      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
    });

    testWidgets('is initialized correctly', (widgetTester) async {
      await buildTester(widgetTester);
      expect(
        find.text(
          i18.acknowledgementSuccess.acknowledgementLabelText,
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(
          DigitButton,
          i18.acknowledgementSuccess.actionLabelText,
        ),
        findsOneWidget,
      );
    });
  });
}
