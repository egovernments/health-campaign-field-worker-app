import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_app.dart';

void main() {
  group('DigitRadioListTile Test', () {
    testWidgets('DigitRadioListTile widget test', (widgetTester) async {
      // Create a DigitRadioListTile widget
      final digitRadioListTile = DigitRadioListTile(
        groupValue: 0,
        title: const Text('Test'),
        onchange: () {},
        value: 0,
      );
      await widgetTester.pumpWidget(WidgetApp(child: digitRadioListTile));
      // Verify that the groupValue is 0
      expect(digitRadioListTile.groupValue, 0);

      // Verify that the title is 'Test'
      expect(
        find.widgetWithText(DigitRadioListTile, 'Test'),
        findsOneWidget,
      );

      // Verify that the value is 0
      expect(digitRadioListTile.value, 0);
    });
  });
}
