import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> selectDate(WidgetTester widgetTester) async {
  // select Date
  await widgetTester.tap(find.byType(DigitDateFormPicker));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  expect(find.byType(DigitDateFormPicker), findsAny);

  await widgetTester.tap(find.text(testVariables['date']).last);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  await widgetTester.tap(find.text('Ok'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

  // select session
  await widgetTester.tap(find.text(testVariables['session']));

  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  // tap on the submit
  await widgetTester
      .tap(widgetSelector['markAttendance']!); //tap on the mark attendance
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  expect(
    find.byType(MarkAttendancePage),
    findsOneWidget,
  ); //check if we go to the next page
}
