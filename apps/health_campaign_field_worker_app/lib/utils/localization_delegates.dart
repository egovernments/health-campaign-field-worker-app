import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';

import '../blocs/localization/app_localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import 'utils.dart';

getAppLocalizationDelegates({
  required Isar isar,
  required AppConfiguration appConfig,
  required String selectedLocale,
}) {
  return [
    AppLocalizations.getDelegate(
      appConfig,
      isar,
    ),
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    attendance_localization.AttendanceLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
  ];
}
