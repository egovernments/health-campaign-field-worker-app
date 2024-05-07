import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> testViewReportsPage(WidgetTester widgetTester) async {
  await widgetTester.tap(widgetSelector['viewReports']!);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  await widgetTester.tap(find.byType(DigitListView).first);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  await widgetTester.tap(find.byKey(const Key('viewReportSelectProduct')));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  await widgetTester.tap(find.text('Bednet Grade 1'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
}
