import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../data/local/localization.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/localization.dart';
import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  // final Isar isar;
  final LocalSqlDataStore sql;

  // AppLocalizations(this.locale, this.isar);
  AppLocalizations(this.locale, this.sql);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final List<Localization> _localizedStrings = <Localization>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
    AppConfiguration config,
    // Isar isar,
      LocalSqlDataStore sql,
  ) =>
      AppLocalizationsDelegate(config, sql);

  Future<bool> load() async {
    _localizedStrings.clear();
    // final List<LocalizationWrapper> localizationList = await isar
    //     .localizationWrappers
    //     .filter()
    //     .localeEqualTo('${locale.languageCode}_${locale.countryCode}')
    //     .findAll();
    //
    // if (localizationList.isNotEmpty) {
    //   _localizedStrings.addAll(localizationList.first.localization!);
    // }
    final listofLocalizations = await LocalizationLocalRepository().returnLocalizationFromSQL(sql);

    _localizedStrings.addAll(listofLocalizations);
    return true;
  }

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
