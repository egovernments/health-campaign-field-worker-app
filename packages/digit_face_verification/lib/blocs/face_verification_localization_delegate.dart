import 'package:flutter/material.dart';

import 'app_localization.dart';

class FaceVerificationLocalizationDelegate
    extends LocalizationsDelegate<FaceVerificationLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const FaceVerificationLocalizationDelegate(
      this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<FaceVerificationLocalization> load(Locale locale) async {
    FaceVerificationLocalization localization =
        FaceVerificationLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<FaceVerificationLocalization> old) {
    return true;
  }
}
