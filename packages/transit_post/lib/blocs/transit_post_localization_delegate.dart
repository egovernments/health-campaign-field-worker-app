import 'package:flutter/material.dart';

import 'app_localization.dart';

class TransitPostLocalizationDelegate
    extends LocalizationsDelegate<TransitPostLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const TransitPostLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<TransitPostLocalization> load(Locale locale) async {
    TransitPostLocalization localization =
        TransitPostLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<TransitPostLocalization> old) {
    return true;
  }
}
