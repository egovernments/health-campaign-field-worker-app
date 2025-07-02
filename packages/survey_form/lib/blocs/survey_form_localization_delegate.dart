import 'package:flutter/material.dart';

import 'app_localization.dart';

class SurveyFormLocalizationDelegate
    extends LocalizationsDelegate<SurveyFormLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const SurveyFormLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<SurveyFormLocalization> load(Locale locale) async {
    SurveyFormLocalization localization =
    SurveyFormLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<SurveyFormLocalization> old) {
    return true;
  }
}
