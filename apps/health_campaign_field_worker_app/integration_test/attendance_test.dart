import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:attendance_management/widgets/circular_button.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:health_campaign_field_worker_app/models/entities/boundary.dart';
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';
import 'package:health_campaign_field_worker_app/pages/home.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:health_campaign_field_worker_app/widgets/home/home_item_card.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final _username = find.byKey(const Key('username'));
  final _password = find.byKey(const Key('password'));
  testWidgets('Get to the manage Attendance Page', (widgetTester) async {
    disableOverflowError();
    app.main();

    await widgetTester.pumpAndSettle(
      const Duration(seconds: 5),
    ); //wait for the app to load languages

    await widgetTester
        .tap(find.widgetWithText(DigitElevatedButton, 'Continue'));

    await widgetTester.pumpAndSettle(
      const Duration(milliseconds: 500),
    ); //wait for the app to load the login page

    expect(
      find.byType(LoginPage),
      findsOneWidget,
    ); //check if the login page is loaded

    await widgetTester.enterText(
      _username,
      'ATTD17',
    ); //enter the username to test
    await widgetTester.enterText(
      _password,
      'eGov@1234',
    ); //enter the password to test

    await widgetTester
        .tap(find.byKey(const Key('login'))); //tap on the login button
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
    await widgetTester.tap(find.widgetWithText(
      DigitElevatedButton,
      'Submit',
    ));

    //go to home page after boundary selection
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(HomePage), findsOneWidget);

    //tap on manage attendance
    await widgetTester
        .tap(find.widgetWithText(HomeItemCard, 'Manage Attendance'));

    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    //check if we are on the manage attendance page
    expect(
      find.byType(ManageAttendancePage),
      findsOneWidget,
      reason: 'Manage Attendance Page not found',
    );

    await widgetTester.scrollUntilVisible(
      find.text('Open Register').at(3),
      1,
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 3));
    await widgetTester.tap(find.text('Open Register').at(3));

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

    await widgetTester.tap(find.text('22').last);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
    await widgetTester.tap(find.text('Ok'));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

    // select session
    await widgetTester.tap(find.text('Evening session'));

    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
    // // tap on the submit
    await widgetTester.tap(find.text('Mark Attendance'));

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

    //try to use the input field
    await widgetTester.enterText(find.byType(DigitSearchBar), 'Ram');
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Ram'), findsAtLeastNWidgets(2));
    expect(find.text('Syed'), findsNothing);

    //Submit
    await widgetTester.tap(find.text('Submit'));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  });
}
