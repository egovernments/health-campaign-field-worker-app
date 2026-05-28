import 'package:flutter/material.dart';

import 'localization_delegates.dart';

// Class responsible for handling attendance localization
class FlowBuilderLocalization {
  final Locale locale;
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  FlowBuilderLocalization(this.locale, this.localizedStrings, this.languages);

  // Method to get the current localization instance from context
  static FlowBuilderLocalization of(BuildContext context) {
    return Localizations.of<FlowBuilderLocalization>(
        context, FlowBuilderLocalization)!;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

  // Method to get the delegate for localization
  static LocalizationsDelegate<FlowBuilderLocalization> getDelegate(
          Future<dynamic> localizedStrings, List<dynamic> languages) =>
      FlowBuilderLocalizationDelegate(localizedStrings, languages);

  // Method to load localized strings
  Future<bool> load() async {
    // Collect new strings first, then replace atomically to avoid a window
    // where _localizedStrings is empty during the await (which causes
    // translate() to return raw keys instead of translated values).
    final newStrings = <dynamic>[];
    for (var element in await localizedStrings) {
      if (element.locale == '${locale.languageCode}_${locale.countryCode}') {
        newStrings.add(element);
      }
    }
    _localizedStrings.clear();
    _localizedStrings.addAll(newStrings);

    return true;
  }

  // Method to translate a given localized value
  String translate(String localizedValues) {
    if (_localizedStrings.isEmpty) {
      return localizedValues;
    } else {
      final index = _localizedStrings.indexWhere(
        (medium) => medium.code == localizedValues,
      );

      return index != -1 ? _localizedStrings[index].message : localizedValues;
    }
  }
}
