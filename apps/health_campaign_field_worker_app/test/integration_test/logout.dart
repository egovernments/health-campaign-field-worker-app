import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> logout(WidgetTester widgetTester) async {
  await widgetTester.tap(find.byType(DrawerButtonIcon));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  await widgetTester.tap(find.text('Logout'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));
}
