import 'package:flutter/material.dart';

import 'app_localization.dart';

class RegistrationLocalizationDelegate
    extends LocalizationsDelegate<RegistrationLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const RegistrationLocalizationDelegate(
      this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<RegistrationLocalization> load(Locale locale) async {
    RegistrationLocalization localization =
        RegistrationLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<RegistrationLocalization> old) {
    return true;
  }
}
