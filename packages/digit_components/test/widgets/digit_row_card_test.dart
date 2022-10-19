import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

const _target = """

    [
    {
      "label": "ਪੰਜਾਬੀ",
      "value": "pn_IN",
      "isSelected": false
    },
    {
      "label": "ENGLISH",
      "value": "en_IN",
      "isSelected": true
    }
  ]
  """;
void main() {
  group('Digit Row card widget', () {
    final List list = json.decode(_target);
    List<DigitRowCardModel> languageList =
        list.map((e) => DigitRowCardModel.fromJson(e)).toList();
    testWidgets('Widget is created without errors', (widgetTester) async {
      bool primary = false;

      onPressed(data) {
        primary = !primary;
      }

      await widgetTester.pumpWidget(WidgetApp(
          child: DigitRowCard(
        list: languageList,
        onPressed: (data) => onPressed(data),
        width: 90,
      )));

      expect(
        find.widgetWithText(DigitRowCard, 'ENGLISH'),
        findsOneWidget,
      );
    });

    testWidgets('DigitRowcard widget OnTap', (widgetTester) async {
      bool primary = false;

      onPressed(data) {
        primary = !primary;
      }

      await widgetTester.pumpWidget(WidgetApp(
          child: DigitRowCard(
        list: languageList,
        onPressed: (data) => onPressed(data),
        width: 90,
      )));

      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.widgetWithText(Center, 'ENGLISH'));
      await widgetTester.pumpAndSettle();
      expect(primary, true);
    });
  });
}
