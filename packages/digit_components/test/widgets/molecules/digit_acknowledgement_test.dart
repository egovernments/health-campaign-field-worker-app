import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

void main() {
  group(
    'DigitAcknowledgement Test',
    () {
      bool actionTriggered = false;
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            WidgetApp(
              child: DigitAcknowledgement(
                action: () => actionTriggered = !actionTriggered,
                actionLabel: 'DIGIT_ACKNOWLEDGEMENT_ACTION_LABEL',
                cardHeight: 15,
                color: Colors.yellow,
                description: 'DIGIT_ACKNOWLEDGEMENT_DESCRIPTION',
                icon: Icons.abc_outlined,
                label: 'DIGIT_ACKNOWLEDGEMENT_LABEL',
              ),
            ),
          );
          expect(
            find.widgetWithText(
                DigitAcknowledgement, 'DIGIT_ACKNOWLEDGEMENT_LABEL'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
