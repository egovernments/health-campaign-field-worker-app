import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> manageAttendance(WidgetTester widgetTester) async {
  await widgetTester.tap(
    widgetSelector['manageAttendance']!,
  ); //tap on the manage attendance
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));

  //check if we are on the manage attendance page
  expect(
    find.byType(ManageAttendancePage),
    findsOneWidget,
    reason: 'Manage Attendance Page not found',
  );

  //check for registers
  expect(find.byType(DigitElevatedButton), findsAtLeast(1));

  await widgetTester.scrollUntilVisible(
    widgetSelector['openRegister']!,
    1,
  );
  await widgetTester.pumpAndSettle(const Duration(seconds: 3));
  await widgetTester.tap(widgetSelector['openRegister']!);

  await widgetTester.pumpAndSettle(
    const Duration(seconds: 1),
  ); //wait for the app to go to the next page

  expect(
    find.byType(AttendanceDateSessionSelectionPage),
    findsOneWidget,
  ); //check if we go to the next page
  await widgetTester.pumpAndSettle(const Duration(seconds: 20));
}
