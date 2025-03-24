import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart'; // Import Flutter Material library
import 'package:flutter_test/flutter_test.dart'; // Import Flutter test library

import '../../test_variables.dart'; // Import test variables and widgets

final testVariables = getTestData(); // Get test data
final widgetSelector = getWidgets(); // Get widget selectors
final boundaryNames = getBoundaryName(); // Get boundary names

// Define stock parameters
const stockParams = [
  'StockIssued',
  'StockLost',
  'StockDamaged',
  'StockReceived',
  'StockOnHand',
  'StockReturned'
];

// Map to store stock parameter values
Map<String, double> stockParamValues = {};

// Function to fetch stock details
Future<void> fetchStockDetails(WidgetTester widgetTester) async {
  // Loop through stock parameters
  for (final param in stockParams) {
    // Find widget corresponding to stock parameter
    final widget = find.descendant(
        of: find.byKey(Key('stockRecon$param')),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Text && RegExp(r'\d+?').hasMatch(widget.data ?? ''),
        ));

    // Verify that widget is found
    expect(widget, findsOneWidget);

    // Get value text from widget
    final valueText = (widgetTester.widget(widget) as Text).data;
    final numericValue = double.parse(valueText!); // Parse numeric value
    stockParamValues[param] = numericValue; // Store numeric value in map
  }
}

// Function to test stock reconciliation page
Future<void> testStockReconciliationPage(WidgetTester widgetTester) async {
  // Tap on stock reconciliation button
  await widgetTester.tap(widgetSelector['stockReconciliation']!);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  // Select facility ID
  await widgetTester.tap(find.byKey(const Key('facility')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  // Select product
  await widgetTester.tap(find.byKey(const Key('productVariant')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
  await widgetTester
      .tap(find.bySemanticsLabel(RegExp(testVariables['productName'])).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  // Fetch stock details
  await fetchStockDetails(widgetTester);

  // Calculate expected stock on hand
  double expectedStockOnHand = (stockParamValues['StockReceived']! +
          stockParamValues['StockReturned']!) -
      (stockParamValues['StockIssued']! +
          stockParamValues['StockLost']! +
          stockParamValues['StockDamaged']!);

  // Verify expected stock on hand
  expect(expectedStockOnHand == stockParamValues['StockOnHand'], true);

  // Enter manual count
  await widgetTester.enterText(find.byKey(const Key('manualCountKey')), '25');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  // Submit the form
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

  // TODO: Test scan bales

  // Tap on the submit button in the dialog
  await widgetTester.tap(find.descendant(
      of: find.byKey(const Key('submitDialog')),
      matching: find.byType(DigitButton).last));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  // Go back to the home page
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Go Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
