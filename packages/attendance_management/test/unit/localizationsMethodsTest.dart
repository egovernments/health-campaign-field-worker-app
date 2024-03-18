import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart';

void main() {
  test('AttendanceLocalization translation test', () async {
    final mockLocalizedStrings = [
      Localization(locale: 'en_MZ', code: 'CORE_COMMON_NAME', message: 'Name'),
      Localization(locale: 'fr_FR', code: 'CORE_COMMON_NAME', message: 'Nom'),
    ];

    final mockLanguages = [
      AttendanceLanguages()
        ..label = 'English'
        ..value = 'en_MZ',
      AttendanceLanguages()
        ..label = 'French'
        ..value = 'fr_FR',
    ];

    const testLocale = Locale('en', 'MZ');

    final attendanceLocalization = AttendanceLocalization(
      testLocale,
      Future.value(mockLocalizedStrings),
      mockLanguages,
    );

    await attendanceLocalization.load();

    //testing if the translate function is working well, given the strings and mock languages
    expect(attendanceLocalization.translate('CORE_COMMON_NAME'), 'Name');
  });
}

class Localization {
  late String code;
  late String message;
  late String module;
  late String locale;

  Localization(
      {required this.locale, required this.code, required this.message});
}
