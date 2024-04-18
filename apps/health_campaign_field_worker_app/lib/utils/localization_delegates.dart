import 'package:digit_scanner/blocs/app_localization.dart'
    as scanner_localization;
import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'package:inventory_management/blocs/app_localization.dart'
    as inventory_localization;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils.dart';
import '../blocs/localization/app_localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import 'package:isar/isar.dart';

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
    inventory_localization.InventoryLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
    attendance_localization.AttendanceLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
    scanner_localization.ScannerLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
  ];
}
