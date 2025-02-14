import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/utils/utils.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> selectDate(WidgetTester widgetTester) async {
  // select Date
  await widgetTester.tap(find.byType(DigitDateFormInput));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 200));
  expect(find.byType(DigitDateFormInput), findsAny);

  await widgetTester.tap(find.byTooltip('Previous month'));
  await widgetTester.pumpAndSettle(Durations.short2);
  await widgetTester.tap(find.byTooltip('Switch to input'));
  await widgetTester.pumpAndSettle(Durations.short2);

  await widgetTester.enterText(find.byType(TextFormField),
      DateTime.now().getFormattedDate('MM/dd/yyyy').toString());
  await widgetTester.pumpAndSettle(Durations.short2);

  await widgetTester.tap(find.text('Ok'));
  await widgetTester.pumpAndSettle(Durations.short2);

  // select session
  await widgetTester.tap(find.text(testVariables['session']));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 200));

  // tap on the submit
  await widgetTester
      .tap(widgetSelector['markAttendance']!); //tap on the mark attendance
  await widgetTester.pumpAndSettle(
      const Duration(milliseconds: 500)); // Increased duration to 500ms

  expect(
    find.byType(MarkAttendancePage),
    findsOneWidget,
  ); //check if we go to the next page
}
