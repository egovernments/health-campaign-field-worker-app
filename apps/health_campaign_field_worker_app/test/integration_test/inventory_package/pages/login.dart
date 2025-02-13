import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> testLoginPage(WidgetTester widgetTester) async {
  //let the app initialize
  await widgetTester.pumpAndSettle(
    const Duration(seconds: 5),
  );

  await widgetTester
      .tap(widgetSelector['continue']!); //tap on the continue button

  await widgetTester.pumpAndSettle(const Duration(
      milliseconds: 1000)); //wait for the app to load the login page

  await widgetTester.enterText(
    widgetSelector['username']!,
    testVariables['username']['inventory_management'],
  ); //enter the username to test

  await widgetTester.enterText(
    widgetSelector['password']!,
    testVariables['password'],
  ); //enter the password to test

  await widgetTester.tap(widgetSelector['login']!); //tap on the login button
  await widgetTester.pumpAndSettle(const Duration(seconds: 5));

  //choose a project
  await widgetTester.tap(find.byType(MenuCard).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 3));

  expect(
    find.byType(BoundarySelectionPage),
    findsOneWidget,
  ); //check if the boundary page is loaded
}
