import 'package:flutter/material.dart';

import 'widget_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digit_components/digit_components.dart';

void main() {
  group('Dialog Digit widget', () {
    testWidgets('Widget is created without errors', (widgetTester) async {
      await widgetTester.pumpWidget(WidgetApp(
          child: DigitDialog(
        primaryCallback: () {},
        primaryText: 'Dialog Action Text',
        title: 'Dialog Title',
        child: const Text('Digit Dialog'),
      )));

      expect(
        find.byWidget(
          DigitDialog(
              primaryText: 'Dialog Action Text',
              title: 'Dialog Title',
              primaryCallback: () {},
              child: const Text('Digit Dialog')),
        ),
        findsOneWidget,
      );
    });
  });
}
