import 'package:flutter/material.dart';

import 'survey_form_localization_delegate.dart';

// Class responsible for handling survey_form localization
class SurveyFormLocalization {
  final Locale locale;
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  SurveyFormLocalization(this.locale, this.localizedStrings, this.languages);

  // Method to get the current localization instance from context
  static SurveyFormLocalization of(BuildContext context) {
    return Localizations.of<SurveyFormLocalization>(context, SurveyFormLocalization)!;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

  // O(1) code → message lookup rebuilt on every load(). translate() used to
  // indexWhere across _localizedStrings which is O(N) per call — for a
  // survey-form screen rendering hundreds of translated widgets against a
  // localization table of thousands of rows that's the dominant mount cost
  // and produced a visible 2–3s UI freeze on module open. Keep the list
  // around for existing external reads; the fast path is the map.
  static final Map<String, String> _messagesByCode = <String, String>{};

  // Method to get the delegate for localization
  static LocalizationsDelegate<SurveyFormLocalization> getDelegate(
      Future<dynamic> localizedStrings, List<dynamic> languages) {
      return SurveyFormLocalizationDelegate(localizedStrings, languages);
  }

  // Method to load localized strings
  Future<bool> load() async {
    // Collect new strings first, then replace atomically to avoid a window
    // where _localizedStrings is empty during the await (which causes
    // translate() to return raw keys instead of translated values).
    final newStrings = <dynamic>[];
    final newMessages = <String, String>{};
    for (var element in await localizedStrings) {
      if (element.locale == '${locale.languageCode}_${locale.countryCode}') {
        newStrings.add(element);
        newMessages[element.code] = element.message;
      }
    }
    _localizedStrings
      ..clear()
      ..addAll(newStrings);
    _messagesByCode
      ..clear()
      ..addAll(newMessages);

    return true;
  }

  // Method to translate a given localized value
  String translate(String localizedValues) {
    return _messagesByCode[localizedValues] ?? localizedValues;
  }
}
