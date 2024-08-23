import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../blocs/localization/app_localization.dart';
import '../data/local/localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import 'utils.dart';

getAppLocalizationDelegates({
  required LocalSqlDataStore sql,
  required AppConfiguration appConfig,
  required String selectedLocale,
}) {
  return [
    AppLocalizations.getDelegate(
      appConfig,
      sql,
    ),
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ];
}
