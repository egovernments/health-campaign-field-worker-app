import 'package:flutter/material.dart'; // Import necessary packages for testing.
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart'; // Import your package for testing.

void main() {
  // Test for AttendanceLocalization translation.
  test('AttendanceLocalization translation test', () async {
    // Define mock localized strings for testing.
    final mockLocalizedStrings = [
      Localization(locale: 'en_MZ', code: 'CORE_COMMON_NAME', message: 'Name'),
      Localization(locale: 'fr_FR', code: 'CORE_COMMON_NAME', message: 'Nom'),
    ];

    // Define mock languages for testing.
    final mockLanguages = [
      AttendanceLanguages()
        ..label = 'English'
        ..value = 'en_MZ',
      AttendanceLanguages()
        ..label = 'French'
        ..value = 'fr_FR',
    ];

    // Define the test locale.
    const testLocale = Locale('en', 'MZ');

    // Initialize AttendanceLocalization with mock data.
    final attendanceLocalization = AttendanceLocalization(
      testLocale,
      Future.value(mockLocalizedStrings),
      mockLanguages,
    );

    await attendanceLocalization.load(); // Load the localization data.

    // Test if the translate function is working well, given the mock strings and languages.
    expect(attendanceLocalization.translate('CORE_COMMON_NAME'), 'Name');
  });
}

// Define a class for localization data.
class Localization {
  late String code;
  late String message;
  late String module;
  late String locale;

  // Constructor for localization data.
  Localization(
      {required this.locale, required this.code, required this.message});
}
