import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management/pages/manage_stocks.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> testManageStockPage(WidgetTester widgetTester) async {
  await widgetTester.pumpAndSettle();
  //go to the manage stock page
  await widgetTester.tap(widgetSelector['manageStock']!);
  await widgetTester.pumpAndSettle();
  expect(find.byType(ManageStocksPage), findsOne);

  for (int i = 0; i < 1; i++) {
    await testOnePage(widgetTester, i);
  }
  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}

Future<void> testOnePage(WidgetTester widgetTester, int i) async {
  await widgetTester.tap(find.byType(DigitListView).at(i));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  await widgetTester
      .tap(find.widgetWithText(DigitTextFormField, 'Warehouse *'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  await widgetTester.tap(find.byType(DigitElevatedButton).last);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  //stock details page
  await widgetTester.tap(find.byKey(const Key('selectProduct')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  await widgetTester.tap(find.text('Bednet Grade 1'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  Finder transactionReasonFinder = find.byKey(const Key('transactionReason'));
  if (transactionReasonFinder.evaluate().isNotEmpty) {
    await widgetTester.tap(transactionReasonFinder);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
    await widgetTester
        .tap(find.bySemanticsLabel(RegExp(r'\bIn Storage\b')).last);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  }

  await widgetTester.tap(find.byKey(const Key('secondParty')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  await widgetTester.enterText(find.byKey(const Key('quantity')), '83');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  FocusManager.instance.primaryFocus?.unfocus();
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  await widgetTester.enterText(find.byKey(const Key('waybillNumber')), '47');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  FocusManager.instance.primaryFocus?.unfocus();
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  await widgetTester.tap(find.byKey(const Key('transportTypes')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  await widgetTester.tap(find.text('Bus'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //TODO test scan bales
  await widgetTester.tap(find.descendant(
      of: find.byKey(const Key('submitDialog')),
      matching: find.byType(DigitElevatedButton).last));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //come back to the home page
  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Go Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
