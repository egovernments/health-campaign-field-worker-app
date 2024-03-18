import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:mocktail/mocktail.dart';
import 'package:attendance_management/utils/i18_key_constants.dart' as i18;

import '../unit/localizationsMethodsTest.dart';

class MockAttendanceListeners extends Mock implements AttendanceListeners {}

void main() {
  group("Attendance Package", () {
    const locale = Locale('en', 'MZ');

    final mockLocalizedStrings = [
      Localization(
          locale: 'en_MZ',
          code: i18.attendance.campaignNameLabel,
          message: 'CAMPAIGN_NAME_LABEL'),
      Localization(
          locale: 'en_MZ',
          code: i18.attendance.eventTypeLabel,
          message: 'CAMPAIN'),
    ];

    final mockLanguages = [
      AttendanceLanguages()
        ..label = 'English'
        ..value = 'en_MZ',
      AttendanceLanguages()
        ..label = 'French'
        ..value = 'fr_FR',
    ];

    final localization = AttendanceLocalization(
        locale, Future.value(mockLocalizedStrings), mockLanguages);
    final mockAttendanceListeners = MockAttendanceListeners();

    setUpAll(() {
      for (final element in [
        i18.attendance.campaignNameLabel,
        i18.attendance.eventTypeLabel,
        i18.attendance.staffCountLabel,
        i18.attendance.startDateLabel,
        i18.attendance.endDateLabel,
        i18.attendance.statusLabel,
        i18.attendance.attendanceCompletionLabel,
        i18.common.coreCommonNA
      ]) {
        when(() => localization.translate(element)).thenReturn(element);
      }
    });

    testWidgets('Test Localization in manage Attendance Page',
        (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ManageAttendancePage(
            attendanceListeners: mockAttendanceListeners,
            projectId: '',
            userId: '',
            appVersion: '',
          ),
        ),
      ));

      expect(
        find.text(
          i18.attendance.campaignNameLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.eventTypeLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.staffCountLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.startDateLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.endDateLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.statusLabel,
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          i18.attendance.attendanceCompletionLabel,
        ),
        findsOneWidget,
      );
    });
  });
}
