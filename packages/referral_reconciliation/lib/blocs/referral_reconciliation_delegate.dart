import 'package:flutter/material.dart';

import 'app_localization.dart';

class ReferralReconLocalizationDelegate
    extends LocalizationsDelegate<ReferralReconLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const ReferralReconLocalizationDelegate(
      this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<ReferralReconLocalization> load(Locale locale) async {
    ReferralReconLocalization localization =
        ReferralReconLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<ReferralReconLocalization> old) {
    return true;
  }
}
