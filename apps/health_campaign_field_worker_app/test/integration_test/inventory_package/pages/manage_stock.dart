import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:flutter/material.dart'; // Import Flutter Material library
import 'package:flutter_test/flutter_test.dart'; // Import Flutter test library
import 'package:inventory_management/pages/manage_stocks.dart'; // Import ManageStocksPage
import '../../test_variables.dart'; // Import test variables and widgets

final testVariables = getTestData(); // Get test data
final widgetSelector = getWidgets(); // Get widget selectors
final boundaryNames = getBoundaryName(); // Get boundary names

// Function to test ManageStocksPage
Future<void> testManageStockPage(WidgetTester widgetTester) async {
  await widgetTester.pumpAndSettle(); // Pump and settle the widget tree

  // Go to the manage stock page
  await widgetTester.tap(widgetSelector['manageStock']!);
  await widgetTester.pumpAndSettle();

  // Verify that ManageStocksPage is found
  expect(find.byType(ManageStocksPage), findsOne);

  // Iterate through 5 pages
  for (int i = 0; i < 5; i++) {
    await testOnePage(widgetTester, i); // Test each page
  }

  // Go back to the previous page
  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}

// Function to test each page
Future<void> testOnePage(WidgetTester widgetTester, int i) async {
  // Tap on the DigitListView at index i
  await widgetTester.tap(find.byType(LabelValueItem).at(i));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  // Tap on the warehouse field
  await widgetTester
      .tap(find.widgetWithText(DigitTextFormInput, 'Warehouse *'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  // Tap on a transaction reason
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  // Tap on the submit button
  await widgetTester.tap(find.byType(DigitButton).last);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  // Tap on the select product field
  await widgetTester.tap(find.byKey(const Key('productVariant')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  // Select a product
  await widgetTester.tap(find.text(testVariables['productName']));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  // Enter quantity
  await widgetTester.enterText(find.byKey(const Key('quantity')), '83');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  FocusManager.instance.primaryFocus?.unfocus();
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  // Enter waybill number
  await widgetTester.enterText(find.byKey(const Key('waybillNumber')), '47');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  FocusManager.instance.primaryFocus?.unfocus();
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  // Select transport type
  await widgetTester.tap(find.byKey(const Key('typeOfTransport')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  await widgetTester.tap(find.text('Bus'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

  // Tap on the submit button
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  // TODO: Test scan bales

  // Tap on the submit button in the dialog
  await widgetTester.tap(find.descendant(
    of: find.byKey(const Key('submitDialog')),
    matching: find.byType(DigitButton).last,
  ));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  // Go back to the home page
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Go Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
