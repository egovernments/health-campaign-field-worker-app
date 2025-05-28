import 'package:flutter/material.dart';

import 'app_localization.dart';

class DeliveryLocalizationDelegate
    extends LocalizationsDelegate<DeliveryLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const DeliveryLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<DeliveryLocalization> load(Locale locale) async {
    DeliveryLocalization localization =
        DeliveryLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DeliveryLocalization> old) {
    return true;
  }
}
