import 'package:flutter/material.dart';

import 'app_localization.dart';

class DashboardLocalizationDelegate
    extends LocalizationsDelegate<DashboardLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const DashboardLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<DashboardLocalization> load(Locale locale) async {
    DashboardLocalization localization =
        DashboardLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<DashboardLocalization> old) {
    return true;
  }
}
