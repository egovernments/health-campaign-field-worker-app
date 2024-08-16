import 'package:flutter/material.dart'; // Import necessary packages for testing.
import 'package:flutter_test/flutter_test.dart';
import 'package:checklist/checklist.dart'; // Import your package for testing.

void main() {
  // Test for ChecklistLocalization translation.
  test('ChecklistLocalization translation test', () async {
    // Define mock localized strings for testing.
    final mockLocalizedStrings = [
      Localization(locale: 'en_MZ', code: 'CORE_COMMON_NAME', message: 'Name'),
      Localization(locale: 'fr_FR', code: 'CORE_COMMON_NAME', message: 'Nom'),
    ];

    // Define mock languages for testing.
    final mockLanguages = [
      ChecklistLanguages()
        ..label = 'English'
        ..value = 'en_MZ',
      ChecklistLanguages()
        ..label = 'French'
        ..value = 'fr_FR',
    ];

    // Define the test locale.
    const testLocale = Locale('en', 'MZ');

    // Initialize ChecklistLocalization with mock data.
    final checklistLocalization = ChecklistLocalization(
      testLocale,
      Future.value(mockLocalizedStrings),
      mockLanguages,
    );

    await checklistLocalization.load(); // Load the localization data.

    // Test if the translate function is working well, given the mock strings and languages.
    expect(checklistLocalization.translate('CORE_COMMON_NAME'), 'Name');
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

// Class representing supported languages for checklist localization
class ChecklistLanguages {
  late String label;
  late String value;
}
