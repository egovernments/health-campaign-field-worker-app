import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:attendance_management/widgets/circular_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();

String getMonth(int currentMonthIndex) {
  return DateFormat('MMM').format(DateTime(0, currentMonthIndex)).toString();
}

Future<void> markAttendance(WidgetTester widgetTester) async {
  //mark attendance
  //if the attendance is for a date other than today, there shouldn't be a submit option
  if (find
      .text(
          '${DateTime.now().day} ${getMonth(DateTime.now().month)} ${DateTime.now().year} - ${testVariables['session']}')
      .evaluate()
      .isNotEmpty) {
    expect(find.text('Submit'), findsOne);
  } else {
    expect(find.text('Submit'), findsNothing);
  }

  //mark attendance
  for (int i = 0; i < find.byType(CircularButton).evaluate().length; i++) {
    await widgetTester.tap(find.byType(CircularButton).at(i));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  //keep a record of how many we have marked present
  final numberPresent =
      find.widgetWithText(CircularButton, 'Present').evaluate().length;

  //save and mark later option
  await widgetTester.tap(find.text('Save and mark later'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

  //go back to check if records are saved
  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  await widgetTester.tap(find.text('Evening session'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  await widgetTester.tap(find.text('Mark Attendance'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //check if the marking status was same as before
  expect(find.text('Present').evaluate().length == numberPresent, true);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //try to use the input field
  await widgetTester.enterText(
      find.byType(DigitSearchBar), testVariables['attendees'][0]);
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  expect(find.text(testVariables['attendees'][0]), findsAtLeastNWidgets(2));
  expect(find.text(testVariables['attendees'][1]), findsNothing);

  //reset the text field to empty
  await widgetTester.enterText(find.byType(DigitSearchBar), '');
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
  await widgetTester.testTextInput.receiveAction(TextInputAction.done);

  //submit
  await widgetTester.tap(find.text('Submit'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //tap on Proceed
  await widgetTester.tap(find.widgetWithText(DigitButton, 'Proceed'));
  await widgetTester.pumpAndSettle(const Duration(milliseconds: 1000));

  //confirm the submission
  expect(find.byType(AttendanceAcknowledgementPage), findsOneWidget);
}
