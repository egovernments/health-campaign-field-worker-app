import 'package:flutter/material.dart';

import 'app_localization.dart';

class ChecklistLocalizationDelegate
    extends LocalizationsDelegate<ChecklistLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ChecklistLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ChecklistLocalization> load(Locale locale) async {
    ChecklistLocalization localization =
    ChecklistLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<ChecklistLocalization> old) {
    return true;
  }
}
