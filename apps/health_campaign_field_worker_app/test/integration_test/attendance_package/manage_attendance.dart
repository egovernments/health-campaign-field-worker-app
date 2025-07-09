import 'package:attendance_management/attendance_management.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> manageAttendance(WidgetTester widgetTester) async {
  await widgetTester.tap(
    widgetSelector['manageAttendance']!,
  ); //tap on the manage attendance
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

  //check if we are on the manage attendance page
  expect(
    find.byType(ManageAttendancePage),
    findsOneWidget,
    reason: 'Manage Attendance Page not found',
  );

  //check for registers
  expect(find.byType(DigitButton), findsAtLeast(1));

  await widgetTester.scrollUntilVisible(
    widgetSelector['openRegister']!,
    1,
  );
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
  await widgetTester.tap(widgetSelector['openRegister']!);

  await widgetTester.pumpAndSettle(
    const Duration(milliseconds: 500),
  ); //wait for the app to go to the next page

  expect(
    find.byType(MarkAttendancePage),
    findsOneWidget,
  ); //check if we go to the next page
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));
}
