import 'package:flutter/material.dart';

import 'face_verification_localization_delegate.dart';

/// Localization for the digit_face_verification package, mirroring the
/// pattern used by the other DIGIT packages (attendance_management, etc.).
/// The host app registers [getDelegate] with the localization rows loaded
/// from its SQL store; widgets resolve it via
/// `FaceVerificationLocalization.of(context)`.
class FaceVerificationLocalization {
  final Locale locale;
  final Future<dynamic> localizedStrings;
  final List<dynamic> languages;

  FaceVerificationLocalization(
      this.locale, this.localizedStrings, this.languages);

  static FaceVerificationLocalization of(BuildContext context) {
    return Localizations.of<FaceVerificationLocalization>(
        context, FaceVerificationLocalization)!;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

  /// App-level resolver consulted when this package's own rows don't
  /// contain a code. The host app points this at its main
  /// AppLocalizations.translate so these screens resolve codes the same
  /// way as the rest of the app (login, home, etc.).
  static String Function(String code)? appTranslate;

  static LocalizationsDelegate<FaceVerificationLocalization> getDelegate(
          Future<dynamic> localizedStrings, List<dynamic> languages) =>
      FaceVerificationLocalizationDelegate(localizedStrings, languages);

  Future<bool> load() async {
    _localizedStrings.clear();
    for (var element in await localizedStrings) {
      if (element.locale == '${locale.languageCode}_${locale.countryCode}') {
        _localizedStrings.add(element);
      }
    }

    return true;
  }

  /// Translates a localization code. Resolves from this package's own rows
  /// first, then through the host app's resolver ([appTranslate] — the same
  /// translate the login screen uses), and finally falls back to the code
  /// itself (same convention as the rest of the app).
  String translate(String localizedValues) {
    final index = _localizedStrings.indexWhere(
      (medium) => medium.code == localizedValues,
    );
    if (index != -1) return _localizedStrings[index].message;

    return appTranslate?.call(localizedValues) ?? localizedValues;
  }
}
