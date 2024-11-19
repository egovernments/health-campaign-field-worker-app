import 'package:flutter/material.dart';

import 'app_localization.dart';

class InstitutionCampaignLocalizationDelegate
    extends LocalizationsDelegate<InstitutionCampaignLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const InstitutionCampaignLocalizationDelegate(
      this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<InstitutionCampaignLocalization> load(Locale locale) async {
    InstitutionCampaignLocalization localization =
        InstitutionCampaignLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<InstitutionCampaignLocalization> old) {
    return true;
  }
}
