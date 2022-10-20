import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:digit_components/digit_components.dart';

void main() {
  group('Dialog Digit widget', () {
    testWidgets('Widget Display without errors', (widgetTester) async {
      bool primaryAction = false;

      primaryCallback() {
        primaryAction = true;
      }

      await widgetTester.pumpWidget(MaterialApp(
          home: Material(child: Builder(builder: (BuildContext context) {
        return TextButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return DigitDialog(
                      primaryActionLabel: 'Dialog Action Text',
                      title: 'Dialog Title',
                      primaryAction: () => primaryCallback(),
                      child: const Text('Digit Dialog'));
                });
          },
          child: const Text('OK'),
        );
      }))));
      // Tap to Enable Dialog
      await widgetTester.tap(find.text('OK'));
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.widgetWithText(DigitDialog, 'Dialog Title'), findsOneWidget);
      expect(find.text('Dialog Action Text'), findsOneWidget);
      expect(find.text('Dialog Title'), findsOneWidget);
      expect(find.text('Digit Dialog'), findsOneWidget);
      expect(primaryAction, false);

      await widgetTester.tap(find.text('Dialog Action Text'));
      expect(primaryAction, true);
    });

    testWidgets(
        'Widget Primary and secondary actions and labels without errors',
        (widgetTester) async {
      bool primaryAction = false;

      primaryCallback() {
        primaryAction = true;
      }

      bool secondaryAction = false;
      secondaryCallback() {
        secondaryAction = true;
      }

      await widgetTester.pumpWidget(MaterialApp(
          home: Material(child: Builder(builder: (BuildContext context) {
        return TextButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return DigitDialog(
                      primaryActionLabel: 'Primary Action Text',
                      secondaryActionLabel: 'Secondary Action Text',
                      title: 'Dialog Title',
                      primaryAction: () => primaryCallback(),
                      secondaryAction: () => secondaryCallback(),
                      child: const Text('Digit Dialog'));
                });
          },
          child: const Text('OK'),
        );
      }))));
      // Tap to Enable Dialog
      await widgetTester.tap(find.text('OK'));
      await widgetTester.pump();

      expect(find.widgetWithText(DigitDialog, 'Dialog Title'), findsOneWidget);
      expect(find.text('Primary Action Text'), findsOneWidget);
      expect(find.text('Secondary Action Text'), findsOneWidget);
      expect(find.text('Dialog Title'), findsOneWidget);
      expect(find.text('Digit Dialog'), findsOneWidget);
      expect(primaryAction, false);

      await widgetTester.tap(find.text('Primary Action Text'));
      expect(primaryAction, true);
      expect(secondaryAction, false);

      await widgetTester.tap(find.text('Secondary Action Text'));
      expect(secondaryAction, true);
    });
  });
}
