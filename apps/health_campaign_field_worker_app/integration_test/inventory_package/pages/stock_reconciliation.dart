import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

const stockParams = [
  'StockIssued',
  'StockLost',
  'StockDamaged',
  'StockReceived',
  'StockOnHand',
  'StockReturned'
];

Map<String, double> stockParamValues = {};

Future<void> fetchStockDetails(WidgetTester widgetTester) async {
  for (final param in stockParams) {
    final widget = find.descendant(
        of: find.byKey(Key('stockRecon$param')),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Text && RegExp(r'\d+?').hasMatch(widget.data ?? ''),
        ));

    expect(widget, findsOneWidget);

    final valueText = (widgetTester.widget(widget) as Text).data;
    final numericValue = double.parse(valueText!);
    print('stockIssued: $numericValue');
    stockParamValues[param] = numericValue;
    print('stockParamValues: $stockParamValues');
  }
}

Future<void> testStockReconciliationPage(WidgetTester widgetTester) async {
  await widgetTester.tap(widgetSelector['stockReconciliation']!);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  await widgetTester.tap(find.byKey(const Key('stockReconFacilityId')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  await widgetTester.tap(find.byKey(const Key('stockReconSelectProduct')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('Bednet Grade 1')).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  await fetchStockDetails(widgetTester);

  double expectedStockOnHand = (stockParamValues['StockReceived']! +
          stockParamValues['StockReturned']!) -
      (stockParamValues['StockIssued']! +
          stockParamValues['StockLost']! +
          stockParamValues['StockDamaged']!);

  expect(expectedStockOnHand == stockParamValues['StockOnHand'], true);

  await widgetTester.enterText(find.byKey(const Key('stockManualCount')), '25');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  //TODO test scan bales
  await widgetTester.tap(find.descendant(
      of: find.byKey(const Key('submitDialog')),
      matching: find.byType(DigitElevatedButton).last));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Go Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
