import 'package:flutter/material.dart';
import 'app_localization.dart';

class FormLocalizationDelegate
    extends LocalizationsDelegate<FormLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const FormLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<FormLocalization> load(Locale locale) async {
    FormLocalization localization =
    FormLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<FormLocalization> old) {
    return true;
  }
}
