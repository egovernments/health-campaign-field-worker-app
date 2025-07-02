import 'package:flutter/material.dart';
import 'app_localization.dart';

class ClosedHouseholdLocalizationDelegate
    extends LocalizationsDelegate<ClosedHouseholdLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ClosedHouseholdLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ClosedHouseholdLocalization> load(Locale locale) async {
    ClosedHouseholdLocalization localization =
    ClosedHouseholdLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<ClosedHouseholdLocalization> old) {
    return true;
  }
}
