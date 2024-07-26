import 'package:closed_household/blocs/app_localization.dart'
    as closed_household_localization;
import 'package:closed_household/utils/i18_key_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:attendance_management/blocs/app_localization.dart'
    as attendance_localization;
import 'package:digit_scanner/blocs/app_localization.dart'
    as scanner_localization;
import 'package:referral_reconciliation/blocs/app_localization.dart'
    as referral_reconciliation_localization;
import 'package:inventory_management/blocs/app_localization.dart'
    as inventory_localization;
import 'package:registration_delivery/blocs/app_localization.dart'
    as registration_delivery_localization;

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
    referral_reconciliation_localization.ReferralReconLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
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
    registration_delivery_localization.RegistrationDeliveryLocalization
        .getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
    closed_household_localization.ClosedHouseholdLocalization.getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
  ];
}
