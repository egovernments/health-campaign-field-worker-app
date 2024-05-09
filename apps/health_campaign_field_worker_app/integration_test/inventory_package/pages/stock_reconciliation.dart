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

  expect(
      find.descendant(
          of: find.byKey(const Key('stockReconStockReceived')),
          matching: find.text('83')),
      findsOne);

  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  //TODO test scan bales
  await widgetTester.tap(find.descendant(
      of: find.byKey(const Key('submitDialog')),
      matching: find.byType(DigitElevatedButton).last));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Go Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
