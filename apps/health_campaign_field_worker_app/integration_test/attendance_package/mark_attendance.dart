import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:attendance_management/widgets/circular_button.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
Future<void> markAttendance(WidgetTester widgetTester) async {
  //mark attendance
  //if the attendance is marked already then submit button should not work
  if (find.text('Present').evaluate().isNotEmpty) {
    expect(find.text('Submit'), findsNothing);
  }
  //check if present word is displayed
  await widgetTester.tap(find.byType(CircularButton).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.text('Present'), findsOneWidget);

  //check if absent word is displayed
  await widgetTester.tap(find.byType(CircularButton).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.text('Absent'), findsOneWidget);

  //when the user taps on absent, the status must change back to present
  await widgetTester.tap(find.byType(CircularButton).first);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.text('Present'), findsOneWidget);
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));

  //save and mark later option
  await widgetTester.tap(find.text('Save and mark later'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));

  //check if records are saved when we go back
  await widgetTester.tap(find.text('Back'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));
  await widgetTester.tap(find.text('Evening session'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));
  await widgetTester.tap(find.text('Mark Attendance'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.text('Present'), findsOneWidget);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  //try to use the input field
  await widgetTester.enterText(
      find.byType(DigitSearchBar), testVariables['attendees'][0]);
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));
  expect(find.text(testVariables['attendees'][0]), findsAtLeastNWidgets(2));
  expect(find.text(testVariables['attendees'][1]), findsNothing);

  //Submit
  await widgetTester.tap(find.text('Submit'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  //since only one user is marked, do not confirm
  expect(find.text('Please mark attendance for the staffs'), findsOneWidget);
  expect(find.byType(AttendanceAcknowledgementPage), findsNothing);

  //reset the text field to empty
  await widgetTester.enterText(find.byType(DigitSearchBar), '');
  await widgetTester.pumpAndSettle(const Duration(seconds: 1));
  await widgetTester.testTextInput.receiveAction(TextInputAction.done);

  //mark attendance for all attendees and submit
  for (int i = 0; i < testVariables['attendees'].length; i++) {
    await widgetTester.tap(find.byType(CircularButton).at(i));
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
  }

  await widgetTester.tap(find.text('Submit'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  //tap on Proceed
  await widgetTester.tap(find.widgetWithText(DigitElevatedButton, 'Proceed'));
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  //confirm the submission
  expect(find.byType(AttendanceAcknowledgementPage), findsOneWidget);
}
