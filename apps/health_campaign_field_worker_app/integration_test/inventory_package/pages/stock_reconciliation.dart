import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

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

  // expect(
  //     find.descendant(
  //         of: find.byKey(const Key('stockReconStockReceived')),
  //         matching: find.text('83')),
  //     findsOne);

  // expect(find.byKey(const Key('stockReconStockIssued')), findsOneWidget);

  // final stockIssued = find.descendant(
  //     of: find.byKey(const Key('stockReconStockIssued')),
  //     matching: find.bySemanticsLabel(RegExp(r'\d+')));

  // expect(stockIssued, findsOneWidget);

  // final valueText = (widgetTester.widget(stockIssued) as Text).data;
  // final numericValue = double.parse(valueText!);
  // print('stockIssued: $numericValue');
  // final stockLost =
  //     find.byKey(const Key('stockReconStockLost')).evaluate().first as int;
  // final stockDamaged =
  //     find.byKey(const Key('stockReconStockDamaged')).evaluate().first as int;
  // final stockReceived =
  //     find.byKey(const Key('stockReconStockReceived')).evaluate().first as int;
  // final stockReturned =
  //     find.byKey(const Key('stockReconStockReturned')).evaluate().first as int;
  // final stockOnHand =
  //     find.byKey(const Key('stockReconStockOnHand')).evaluate().first as int;

  // final expectedStockOnHand = (stockReceived + stockReturned) -
  //     (stockIssued + stockLost + stockDamaged);

  // expect(expectedStockOnHand == stockOnHand, true);

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
