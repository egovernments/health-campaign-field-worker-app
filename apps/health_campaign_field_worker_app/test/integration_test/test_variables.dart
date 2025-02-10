import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/widgets/home/home_item_card.dart';

Map<String, dynamic> getTestData() {
  return {
    'session': 'Evening session',
    'date': '8',
    'username': {
      'attendance_management': 'ATTD17',
      'inventory_management': 'Reg-2'
    },
    'password': 'eGov@1234',
    'attendees': [
      'Ram',
      'Syed',
    ],
    'productName': 'Bednet Grade 1'
  };
}

// if the names of the following buttons change in the app, you can change them here
Map<String, Finder> getWidgets() {
  //login
  final username = find.byType(DigitTextFormInput).first;
  final password = find.byType(DigitTextFormInput).last;
  final continueButton = find.widgetWithText(DigitButton, 'Continue');
  final login = find.byType(DigitButton);
  final submit = find.widgetWithText(
    DigitButton,
    'Submit',
  );

  //attendance
  final markAttendanceButton =
      find.widgetWithText(DigitButton, 'Mark Attendance');
  final manageAttendanceButton =
      find.widgetWithText(HomeItemCard, 'Manage Attendance');
  final openRegister = find.text('Open Register').at(3);

  //inventory
  final manageStock = find.widgetWithText(HomeItemCard, 'Manage Stock');
  final stockReconciliation =
      find.widgetWithText(HomeItemCard, 'Stock Reconciliation');
  final viewReports = find.widgetWithText(HomeItemCard, 'View Reports');

  return {
    'username': username,
    'password': password,
    'continue': continueButton,
    'login': login,
    'submit': submit,
    'manageAttendance': manageAttendanceButton,
    'markAttendance': markAttendanceButton,
    'openRegister': openRegister,
    'manageStock': manageStock,
    'stockReconciliation': stockReconciliation,
    'viewReports': viewReports
  };
}

Map<String, String> getBoundaryName() {
  return {
    'Country': 'MOÇAMBIQUE',
    'Provincia': 'NAMPULA',
    'Distrito': 'MURRUPULA',
    'Posto Administrativo': 'NIHESSIUE',
    'Localidade': 'NIHESSIUE',
    'Aldeia': 'CAVINA1',
  };
}
