import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter/material.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/localization.dart';
import '../../data/repositories/local/localization.dart';
import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  final LocalSqlDataStore sql;

  AppLocalizations(this.locale, this.sql);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final List<Localization> _localizedStrings = <Localization>[];

  // O(1) code → message lookup rebuilt on every load(). translate() used
  // to indexWhere across _localizedStrings which is O(N) per call — for a
  // screen rendering hundreds of translated widgets and a table of ~3k+
  // localization rows that's the dominant mount cost on heavy flows like
  // searchBeneficiary. Keep _localizedStrings around for existing external
  // reads (e.g. debugging), but the fast path routes through this map.
  static final Map<String, String> _messagesByCode = <String, String>{};

  static LocalizationsDelegate<AppLocalizations> getDelegate(
          AppConfiguration config, LocalSqlDataStore sql) =>
      AppLocalizationsDelegate(config, sql);

  Future<bool> load() async {
    final listOfLocalizations =
        await LocalizationLocalRepository().returnLocalizationFromSQL(sql);

    _localizedStrings
      ..clear()
      ..addAll(listOfLocalizations);

    _messagesByCode
      ..clear()
      ..addEntries(
        listOfLocalizations.map((l) => MapEntry(l.code, l.message)),
      );

    return _localizedStrings.isNotEmpty;
  }

  String translate(String localizedValues) {
    if (_messagesByCode.isEmpty) return localizedValues;
    return _messagesByCode[localizedValues] ?? localizedValues;
  }
}
