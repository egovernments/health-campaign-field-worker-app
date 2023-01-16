import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import 'app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final AppConfiguration _appConfig;
  final Isar isar;

  const AppLocalizationsDelegate(this._appConfig, this.isar);

  @override
  bool isSupported(Locale locale) {
    return (_appConfig.languages ?? [])
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
    AppLocalizations appLocalizations = AppLocalizations(locale, isar);
    await appLocalizations.load();

    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

mixin AppLocalizationMixin<T extends StatefulWidget> on State<T> {
  AppLocalizations get localizations => AppLocalizations.of(context);
}