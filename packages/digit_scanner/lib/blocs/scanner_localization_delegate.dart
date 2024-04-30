import 'package:flutter/material.dart';

import 'app_localization.dart';

class ScannerLocalizationDelegate
    extends LocalizationsDelegate<ScannerLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ScannerLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ScannerLocalization> load(Locale locale) async {
    ScannerLocalization localization =
        ScannerLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<ScannerLocalization> old) {
    return true;
  }
}
