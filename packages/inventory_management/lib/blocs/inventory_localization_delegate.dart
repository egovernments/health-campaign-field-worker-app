import 'package:flutter/material.dart';

import 'app_localization.dart';

class InventoryLocalizationDelegate
    extends LocalizationsDelegate<InventoryLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const InventoryLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<InventoryLocalization> load(Locale locale) async {
    InventoryLocalization localization =
        InventoryLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<InventoryLocalization> old) {
    return true;
  }
}
