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

  /// Null-safe variant of [of]: returns null when the host app has not
  /// registered the delegate (e.g. standalone/test usage).
  static FaceVerificationLocalization? maybeOf(BuildContext context) {
    return Localizations.of<FaceVerificationLocalization>(
        context, FaceVerificationLocalization);
  }

  /// Translates [code] if the delegate is available, otherwise returns
  /// [fallback] (or the code itself). Lets package widgets localize without
  /// hard-depending on the host registering the delegate.
  static String localized(BuildContext context, String code,
      [String? fallback]) {
    final l = maybeOf(context);
    if (l == null) return fallback ?? code;
    final translated = l.translate(code);
    // translate() echoes the code when no row is loaded — prefer the
    // provided English fallback over showing a raw code to the user.
    if (translated == code && fallback != null) return fallback;
    return translated;
  }

  static final List<dynamic> _localizedStrings = <dynamic>[];

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

  /// Translates a localization code; falls back to the code itself when no
  /// translation is loaded (same convention as the rest of the app).
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
