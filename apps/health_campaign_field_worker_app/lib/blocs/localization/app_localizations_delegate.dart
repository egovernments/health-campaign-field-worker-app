import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../models/app_config/app_config_model.dart';
import 'app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final AppConfig _appConfig;

  const AppLocalizationsDelegate(this._appConfig);

  @override
  bool isSupported(Locale locale) {
    return _appConfig.languages
        .map((e) {
          final results = e.value.split('_');
          if (results.isNotEmpty) return results.first;

          return null;
        })
        .whereNotNull()
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(
    Locale locale,
  ) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();

    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
