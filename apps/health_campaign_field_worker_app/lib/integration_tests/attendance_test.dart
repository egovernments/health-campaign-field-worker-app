import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:attendance_management/widgets/circular_button.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';
import 'package:health_campaign_field_worker_app/pages/home.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';
import './test_variables.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final testVariables = getTestData();
  final widgetSelector = getWidgets();

  testWidgets('Get to the manage Attendance Page', (widgetTester) async {
    disableOverflowError();
    app.main();

    await widgetTester.pumpAndSettle(
      const Duration(seconds: 5),
    ); //wait for the app to load languages

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

    //select the boundaries
    List<String> boundaryNames = [
      'MOÇAMBIQUE',
      'NAMPULA',
      'MURRUPULA',
      'NIHESSIUE',
      'NIHESSIUE',
      'CAVINA1',
    ];
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    for (int i = 0; i < 6; i++) {
      await widgetTester
          .tap(find.byType(DigitReactiveSearchDropdown<BoundaryModel>).at(i));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
      await widgetTester.tap(find.text(boundaryNames[i]).last);
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
    }

    //submit
    await widgetTester.tap(widgetSelector['submit']!);

    //go to home page after boundary selection
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(HomePage), findsOneWidget);

    //tap on manage attendance
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
    // // tap on the submit
    await widgetTester
        .tap(widgetSelector['markAttendance']!); //tap on the mark attendance

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    expect(
      find.byType(MarkAttendancePage),
      findsOneWidget,
    ); //check if we go to the next page

    //wait for attendees to load
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    //mark attendance
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
    await widgetTester.tap(find.text('Proceed'));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    //confirm the submission
    expect(find.byType(AttendanceAcknowledgementPage), findsOneWidget);
  });
}
