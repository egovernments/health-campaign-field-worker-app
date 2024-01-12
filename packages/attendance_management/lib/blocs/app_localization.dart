import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

abstract class AttendanceAppLocalizations {
  final Locale locale;

  AttendanceAppLocalizations(this.locale);

  static AttendanceAppLocalizations of(BuildContext context) {
    return Localizations.of<AttendanceAppLocalizations>(context, AttendanceAppLocalizations)!;
  }

  static final _localizedStrings = [];

  String attendanceTranslate(String localizedValues) {
    if (_localizedStrings.isEmpty) {
      return localizedValues;
    } else {
      final index = _localizedStrings.indexWhere(
        (medium) => medium.code == localizedValues,
      );

      AppLogger.instance.debug('Attendance index: $index', title: 'AttendanceAppLocalizations.translate');

      return index != -1 ? _localizedStrings[index].message : localizedValues;
    }
  }
}