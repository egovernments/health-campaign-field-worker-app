import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../data/localization.dart';
import 'attendance_localization_delegate.dart';

class AttendanceLocalization {
  final Locale locale;
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  AttendanceLocalization(this.locale, this.localizedStrings, this.languages);

  static AttendanceLocalization of(BuildContext context) {
    return Localizations.of<AttendanceLocalization>(
        context, AttendanceLocalization)!;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

  static LocalizationsDelegate<AttendanceLocalization> getDelegate(
          Future<dynamic> localizedStrings, List<dynamic> languages) =>
      AttendanceLocalizationDelegate(localizedStrings, languages);

  Future<bool> load() async {
    AppLogger.instance.info('attendance locale in delegate: ${locale.languageCode}_${locale.countryCode}');
    _localizedStrings.clear();
    final r =  await localizedStrings;
    print(r);
    for (var element in await localizedStrings) {
      if (element.locale == '${locale.languageCode}_${locale.countryCode}') {
        _localizedStrings.add(element);
      }
    }

    if (_localizedStrings.isEmpty) {
      _localizedStrings.addAll(await localizedStrings);
    }

    return true;
  }

  String translate(String localizedValues) {
    if (_localizedStrings.isEmpty) {
      return localizedValues;
    } else {
      final index = _localizedStrings.indexWhere(
        (medium) => medium.code == localizedValues,
      );

      return index != -1 ? _localizedStrings[index].message : localizedValues;
    }
  }
}

class AttendanceLanguages {
  late String label;
  late String value;
}
