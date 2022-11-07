import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

void main() {
  group('DigitIconCard  Model', () {
    const title = "Registration";
    const icon = 0xe44a;
    const widgetKey = "REGISTRATION_ICON_KEY";
    testWidgets('Widget is created without errors', (widgetTester) async {
      await widgetTester.pumpWidget(WidgetApp(
          child: DigitIconCard(
        icon: const IconData(icon, fontFamily: 'MaterialIcons'),
        label: title,
        key: const GlobalObjectKey(widgetKey),
        onPressed: () {},
      )));

      expect(
        find.byKey(const GlobalObjectKey(widgetKey)),
        findsOneWidget,
      );
    });
  });
}
