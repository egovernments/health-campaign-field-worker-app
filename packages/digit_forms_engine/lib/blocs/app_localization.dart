import 'package:flutter/material.dart';

import 'localization_delegates.dart';


// Class responsible for handling attendance localization
class FormLocalization {
  final Locale locale;
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  FormLocalization(this.locale, this.localizedStrings, this.languages);

  // Method to get the current localization instance from context
  static FormLocalization of(BuildContext context) {
    return Localizations.of<FormLocalization>(context, FormLocalization)!;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

  // O(1) code → message lookup rebuilt on every load(). translate() used to
  // indexWhere across _localizedStrings which is O(N) per call — for a
  // form-heavy screen rendering hundreds of translated widgets against a
  // localization table of thousands of rows that's the dominant mount cost
  // and produced a visible 2–3s UI freeze on module open. Keep the list
  // around for existing external reads; the fast path is the map.
  static final Map<String, String> _messagesByCode = <String, String>{};

  // Method to get the delegate for localization
  static LocalizationsDelegate<FormLocalization> getDelegate(
      Future<dynamic> localizedStrings, List<dynamic> languages) =>
      FormLocalizationDelegate(localizedStrings, languages);

  // Method to load localized strings
  Future<bool> load() async {
    _localizedStrings.clear();
    _messagesByCode.clear();
    // Iterate over localized strings and filter based on locale
    for (var element in await localizedStrings) {
      if (element.locale == '${locale.languageCode}_${locale.countryCode}') {
        _localizedStrings.add(element);
        _messagesByCode[element.code] = element.message;
      }
    }

    return true;
  }

  // Method to translate a given localized value
  String translate(String localizedValues) {
    return _messagesByCode[localizedValues] ?? localizedValues;
  }
}
