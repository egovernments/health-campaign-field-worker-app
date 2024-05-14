import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> login(WidgetTester widgetTester) async {
  await widgetTester
      .tap(widgetSelector['continue']!); //tap on the continue button

  await widgetTester.pumpAndSettle(
    const Duration(milliseconds: 500),
  ); //wait for the app to load the login page

  expect(
    find.byType(LoginPage),
    findsOneWidget,
  ); //check if the login page is loaded

  await widgetTester.enterText(
    widgetSelector['username']!,
    testVariables['username'],
  ); //enter the username to test
  await widgetTester.enterText(
    widgetSelector['password']!,
    testVariables['password'],
  ); //enter the password to test

  await widgetTester.tap(widgetSelector['login']!); //tap on the login button
  await widgetTester.pumpAndSettle(const Duration(seconds: 5));

  expect(
    find.byType(BoundarySelectionPage),
    findsOneWidget,
  ); //check if the boundary page is loaded
}
