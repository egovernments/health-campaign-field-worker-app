import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'package:digit_scanner/blocs/app_localization.dart'
    as scanner_localization;
import 'package:flutter_localizations/flutter_localizations.dart';
import '../data/repositories/local/localization.dart';
import 'package:inventory_management/blocs/app_localization.dart'
    as inventory_localization;
import 'package:registration_delivery/blocs/app_localization.dart'
    as registration_delivery_localization;
import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_components/blocs/localization.dart'
    as component_localization;
import 'package:closed_household/blocs/app_localization.dart'
    as closed_household_localization;
import '../blocs/localization/app_localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';

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
    scanner_localization.ScannerLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    registration_delivery_localization.RegistrationDeliveryLocalization
        .getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    inventory_localization.InventoryLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    attendance_localization.AttendanceLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    attendance_localization.AttendanceLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    component_localization.ComponentLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    ),
    closed_household_localization.ClosedHouseholdLocalization.getDelegate(
      LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
      appConfig.languages!,
    )
  ];
}
