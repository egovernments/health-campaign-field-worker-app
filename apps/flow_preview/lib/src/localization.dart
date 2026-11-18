import 'package:digit_flow_builder/blocs/app_localization.dart' as flow_l10n;
import 'package:digit_forms_engine/blocs/app_localization.dart' as forms_l10n;
import 'package:digit_scanner/blocs/app_localization.dart' as scanner_l10n;
import 'package:digit_ui_components/services/AppLocalization.dart' as ui_l10n;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// One localisation message, shaped like the rows the field worker app reads
/// from its database (the engines read `.code`, `.message` and `.locale`).
class PreviewMessage {
  final String code;
  final String message;
  final String locale;

  const PreviewMessage(this.code, this.message, [this.locale = 'en_IN']);

  /// Accepts the shape returned by the DIGIT localisation API
  /// (`{"code", "message", "locale", "module"}`).
  factory PreviewMessage.fromJson(Map<String, dynamic> json) => PreviewMessage(
        json['code'] as String,
        json['message'] as String,
        (json['locale'] as String?) ?? 'en_IN',
      );
}

/// A language entry; the engines read `.value` ("en_IN") and `.label`.
class PreviewLanguage {
  final String value;
  final String label;

  const PreviewLanguage(this.value, this.label);
}

const previewLocale = Locale('en', 'IN');
const previewLocaleCode = 'en_IN';
const previewLanguages = [PreviewLanguage('en_IN', 'English')];

/// Messages the preview supplies itself. Every other key is shown as the key,
/// which helps reviewers spot missing translations. Users can load their own
/// messages from the home page.
const List<PreviewMessage> builtInMessages = [
  PreviewMessage('CORE_COMMON_SUBMIT', 'Submit'),
  PreviewMessage('CORE_COMMON_CANCEL', 'Cancel'),
  PreviewMessage('CORE_COMMON_OK', 'OK'),
  PreviewMessage('CORE_COMMON_YES', 'Yes'),
  PreviewMessage('CORE_COMMON_NO', 'No'),
  PreviewMessage('CORE_COMMON_INFO', 'Info'),
  PreviewMessage('CORE_COMMON_METERS', 'm'),
  PreviewMessage('CORE_COMMON_VALIDATION_ERROR', 'Please check:'),
  PreviewMessage('HCM_COMMON_NEXT_BUTTON', 'Next'),
];

/// Holds the current messages. Replacing them rebuilds the app so every
/// engine reloads its translations.
class PreviewMessages extends ValueNotifier<List<PreviewMessage>> {
  PreviewMessages() : super(builtInMessages);

  void replaceWith(List<PreviewMessage> messages) {
    final byCode = {for (final m in builtInMessages) m.code: m};
    for (final m in messages) {
      byCode[m.code] = m;
    }
    value = byCode.values.toList();
  }

  /// Adds [messages] to the ones already loaded (later ones win), like the
  /// app adding a module's messages when the module opens.
  void addAll(List<PreviewMessage> messages) {
    if (messages.isEmpty) return;
    final byCode = {for (final m in value) m.code: m};
    for (final m in messages) {
      byCode[m.code] = m;
    }
    value = byCode.values.toList();
  }

  /// Message for [code], or [code] itself when there is none (as the app).
  String translate(String code) {
    if (_cacheFor != value) {
      _cache = {for (final m in value) m.code: m.message};
      _cacheFor = value;
    }
    return _cache[code] ?? code;
  }

  List<PreviewMessage>? _cacheFor;
  Map<String, String> _cache = const {};
}

List<LocalizationsDelegate<dynamic>> previewLocalizationDelegates(
    List<PreviewMessage> messages) {
  final strings = Future<dynamic>.value(messages);
  return [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ui_l10n.ComponentLocalization.getDelegate(strings, previewLanguages),
    scanner_l10n.ScannerLocalization.getDelegate(strings, previewLanguages),
    forms_l10n.FormLocalization.getDelegate(strings, previewLanguages),
    flow_l10n.FlowBuilderLocalization.getDelegate(strings, previewLanguages),
  ];
}
