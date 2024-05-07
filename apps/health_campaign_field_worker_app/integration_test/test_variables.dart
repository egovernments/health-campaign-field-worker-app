import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/widgets/home/home_item_card.dart';

Map<String, dynamic> getTestData() {
  return {
    'session': 'Evening session',
    'date': '25',
    'username': 'Reg-2',
    'password': 'eGov@1234',
    'attendees': [
      'Ram',
      'Syed',
    ],
  };
}

// if the names of the following buttons change in the app, you can change them here
Map<String, Finder> getWidgets() {
  //login
  final username = find.byType(DigitTextFormField).first;
  final password = find.byType(DigitTextFormField).last;
  final continueButton = find.widgetWithText(DigitElevatedButton, 'Continue');
  final login = find.byType(DigitElevatedButton);
  final submit = find.widgetWithText(
    DigitElevatedButton,
    'Submit',
  );

  //attendance
  final markAttendanceButton =
      find.widgetWithText(DigitElevatedButton, 'Mark Attendance');
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
