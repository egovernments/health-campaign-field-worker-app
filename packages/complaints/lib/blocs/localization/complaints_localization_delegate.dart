import 'package:flutter/material.dart';

import 'app_localization.dart';

class ComplaintsLocalizationDelegate
    extends LocalizationsDelegate<ComplaintsLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ComplaintsLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ComplaintsLocalization> load(Locale locale) async {
    ComplaintsLocalization localization =
    ComplaintsLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<ComplaintsLocalization> old) {
    return true;
  }
}
