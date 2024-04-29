import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/widgets/home/home_item_card.dart';

Map<String, dynamic> getTestData() {
  return {
    'session': 'Evening session',
    'date': '25',
    'username': 'ATTD17',
    'password': 'eGov@1234',
    'attendees': [
      'Ram',
      'Syed',
    ],
  };
}

// if the names of the following buttons change in the app, you can change them here
Map<String, Finder> getWidgets() {
  final username = find.byKey(const Key('username'));
  final password = find.byKey(const Key('password'));
  final continueButton = find.widgetWithText(DigitElevatedButton, 'Continue');
  final login = find.byKey(const Key('login'));
  final submit = find.widgetWithText(
    DigitElevatedButton,
    'Submit',
  );
  final markAttendanceButton =
      find.widgetWithText(DigitElevatedButton, 'Mark Attendance');
  final manageAttendanceButton =
      find.widgetWithText(HomeItemCard, 'Manage Attendance');
  final openRegister = find.text('Open Register').at(3);

  return {
    'username': username,
    'password': password,
    'continue': continueButton,
    'login': login,
    'submit': submit,
    'manageAttendance': manageAttendanceButton,
    'markAttendance': markAttendanceButton,
    'openRegister': openRegister,
  };
}
