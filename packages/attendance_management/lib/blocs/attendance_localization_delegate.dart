import 'package:flutter/material.dart';

import 'app_localization.dart';

class AttendanceLocalizationDelegate
    extends LocalizationsDelegate<AttendanceLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const AttendanceLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<AttendanceLocalization> load(Locale locale) async {
    AttendanceLocalization localization =
        AttendanceLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<AttendanceLocalization> old) {
    return true;
  }
}
