import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

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
  final List list = json.decode(_target);
  List<DigitRowCardModel> languageList =
      list.map((e) => DigitRowCardModel.fromJson(e)).toList();
  group('Digit Language Card ', () {
    testWidgets('Widget is created without errors', (widgetTester) async {
      await widgetTester.pumpWidget(WidgetApp(
          child: DigitLanguageCard(
        list: languageList,
        actionlabel: 'Continue',
        onPressedButton: () {},
        onPressedicon: () {},
      )));

      expect(
        find.widgetWithText(DigitLanguageCard, 'Continue'),
        findsOneWidget,
      );
    });
  });
}
