import 'package:complaints/blocs/localization/app_localization.dart'
    as complaints_localization;
import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';

import '../blocs/localization/app_localization.dart';
import '../data/local/localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import 'utils.dart';

getAppLocalizationDelegates({
  // required Isar isar,
  required LocalSqlDataStore sql,
  required AppConfiguration appConfig,
  required String selectedLocale,
}) {
  return [
    AppLocalizations.getDelegate(
      appConfig,
      // isar,
      sql,
    ),
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    complaints_localization.ComplaintsLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
  ];
}
