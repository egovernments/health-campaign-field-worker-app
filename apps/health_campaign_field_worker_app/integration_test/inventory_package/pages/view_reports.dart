import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> testViewReportsPage(WidgetTester widgetTester) async {
  await widgetTester.tap(widgetSelector['viewReports']!);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  for (int i = 0; i < 6; i++) {
    await testOnePage(widgetTester);
  }
}

Future<void> testOnePage(WidgetTester widgetTester) async {
  await widgetTester.tap(find.byType(DigitListView).first);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 2000));

  await widgetTester.tap(find.byKey(const Key('viewReportsFacility')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(find.bySemanticsLabel(RegExp('FAC_F*')).first);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  await widgetTester.tap(find.byKey(const Key('viewReportSelectProduct')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(find.text('Bednet Grade 1'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  expect(
      find.text(
          '${DateTime.now().day} ${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}'),
      findsAtLeast(1));

  //come back to the home page
  await widgetTester
      .tap(find.widgetWithText(DigitElevatedButton, 'Back To Home'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
