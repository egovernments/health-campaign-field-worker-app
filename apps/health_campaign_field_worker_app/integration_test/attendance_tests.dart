import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:attendance_management/pages/session_select.dart';
import 'package:attendance_management/widgets/attendance_acknowledgement.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_outline_icon_button.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Manage Attendance Page', () {
    testWidgets('Fetch Registers', (widgetTester) async {
      app.main();
      expect(find.text('Open Register'), findsOneWidget);
    });

    testWidgets('Open register', (tester) async {
      app.main();
      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load registers
      await tester.tap(find.byKey(const Key('registerCard')));
      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to go to the next page
      expect(find.byType(MarkAttendancePage),
          findsOneWidget); //check if we go to the next page
    });
  });

  group('Mark attendance logic', () {
    testWidgets('Go to the session selection page on submitting',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      // tap on the submit button
      await widgetTester.tap(find.byType(DigitOutlineIconButton));

      // go to the attendance acknowledgement page
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(AttendanceDateSessionSelectionPage), findsOneWidget);

      // tap on the back button
      await widgetTester.tap(find.byType(DigitElevatedButton));
    });
  });

  group('Session selection page', () {
    testWidgets('Date selection menu opens', (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      // tap on the date selection button
      await widgetTester.tap(find.byType(DigitElevatedButton));

      // check if the date selection menu is open
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(DigitDateFormPicker), findsOneWidget);
    });

    testWidgets('Go to the attendance acknowledgement page on submitting',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      // tap on the date selection button
      await widgetTester.tap(find.byType(DigitElevatedButton));

      // tap on the submit button
      await widgetTester.tap(find.byType(DigitOutlineIconButton));

      // go to the attendance acknowledgement page
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(AttendanceAcknowledgementPage), findsOneWidget);

      // tap on the back button
      await widgetTester.tap(find.byType(DigitElevatedButton));
    });

    testWidgets('Go to the mark attendance page on back button tap',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      // tap on the date selection button
      await widgetTester.tap(find.byType(DigitElevatedButton));

      // tap on the back button
      await widgetTester.tap(find.byType(DigitElevatedButton));

      // go to the mark attendance page
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(MarkAttendancePage), findsOneWidget);
    });
  });
}
