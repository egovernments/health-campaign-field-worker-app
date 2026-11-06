import 'package:flutter/material.dart';

import 'app_localization.dart';

class FlowBuilderLocalizationDelegate
    extends LocalizationsDelegate<FlowBuilderLocalization> {
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  const FlowBuilderLocalizationDelegate(this.localizedStrings, this.languages);

  @override
  bool isSupported(Locale locale) {
    return languages.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
    }).contains(locale.languageCode);
  }

  @override
  Future<FlowBuilderLocalization> load(Locale locale) async {
    FlowBuilderLocalization localization =
        FlowBuilderLocalization(locale, localizedStrings, languages);
    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<FlowBuilderLocalization> old) {
    return true;
  }
}
