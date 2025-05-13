import 'package:flutter/material.dart';

import 'app_localization.dart';

class RegistrationDeliveryLocalizationDelegate
    extends LocalizationsDelegate<RegistrationDeliveryLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const RegistrationDeliveryLocalizationDelegate(
      this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<RegistrationDeliveryLocalization> load(Locale locale) async {
    RegistrationDeliveryLocalization localization =
        RegistrationDeliveryLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<RegistrationDeliveryLocalization> old) {
    return true;
  }
}
