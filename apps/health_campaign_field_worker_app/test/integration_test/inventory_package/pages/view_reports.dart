import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:flutter/material.dart'; // Import Flutter Material library
import 'package:flutter_test/flutter_test.dart'; // Import Flutter test library
import 'package:intl/intl.dart'; // Import intl library for date formatting

import '../../test_variables.dart'; // Import test variables and widgets

final testVariables = getTestData(); // Get test data
final widgetSelector = getWidgets(); // Get widget selectors
final boundaryNames = getBoundaryName(); // Get boundary names

// Function to test view reports page
Future<void> testViewReportsPage(WidgetTester widgetTester) async {
  // Iterate through the pages
  for (int i = 0; i < 6; i++) {
    // Go back to view reports page
    await widgetTester.tap(widgetSelector['viewReports']!);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
    await testOnePage(widgetTester, i); // Test each page
  }

  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}

// Function to test each page
Future<void> testOnePage(WidgetTester widgetTester, int i) async {
  // Tap on the DigitListView at index i
  await widgetTester.tap(find.byType(LabelValueItem).at(i));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 2000));

  // Tap on facility
  await widgetTester.tap(find.byKey(const Key('facilityKey')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  // Tap on select product
  await widgetTester.tap(find.byKey(const Key('productVariant')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(find.text(testVariables['productName']));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  // Verify date text
  expect(
      find.text(
          '${DateTime.now().day} ${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}'),
      findsAtLeast(1));

  // Go back to the home page
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Back To Home'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
