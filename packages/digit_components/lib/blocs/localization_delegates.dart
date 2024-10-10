import 'package:flutter/material.dart';

import 'localization.dart';


class ComponentLocalizationDelegate
    extends LocalizationsDelegate<ComponentLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ComponentLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ComponentLocalization> load(Locale locale) async {
    ComponentLocalization localization =
    ComponentLocalization(locale, localizedStrings, languages);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<ComponentLocalization> old) {
    return true;
  }
}