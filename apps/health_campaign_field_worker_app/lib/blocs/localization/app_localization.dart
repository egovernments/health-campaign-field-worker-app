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

  // English fallbacks for the pre-login flow (language selection + login).
  // The DB fetch that populates _messagesByCode only runs after a locale is
  // picked, so without these the first paint shows raw i18 codes like
  // "CORE_COMMON_CONTINUE". Real localization always wins — this map is only
  // consulted when the code isn't in _messagesByCode.
  static const Map<String, String> _preLoginEnglishFallbacks = <String, String>{
    'CORE_COMMON_CHOOSE_LANGUAGE': 'Choose a language',
    'CORE_COMMON_CONTINUE': 'Continue',
    'CORE_COMMON_RETRY': 'Retry',
    'CORE_COMMON_CLOSE': 'Close',
    'CORE_COMMON_GO_BACK': 'Go Back',
    'CORE_COMMON_FAILED_TO_FETCH': 'Failed to fetch',
    'CORE_COMMON_LOW_RAM_WARNING_TITLE': 'Low Device Memory',
    'CORE_COMMON_LOW_RAM_WARNING_DESC':
        'Your device has less than the recommended RAM. The app may run slowly. Do you want to continue?',
    'LOGIN_LABEL_TEXT': 'Login',
    'LOGIN_ACTION_LABEL': 'Login',
    'USER_ID_PLACEHOLDER': 'User ID',
    'PASSWORD_PLACEHOLDER': 'Password',
    'USER_ID_PLACEHOLDER_IS_REQUIRED': 'User ID is required',
    'PASSWORD_PLACEHOLDER_IS_REQUIRED': 'Password is required',
    'UNABLE_TO_LOGIN': 'Unable to login. Please try again.',
    'FORGOT_PASSWORD_LABEL_TEXT': 'Forgot Password',
    'FORGOT_PASSWORD_CONTENT_TEXT':
        'Please contact your administrator to reset your password.',
    'FORGOT_PASSWORD_ACTION_LABEL': 'Forgot Password?',
    'PRIMARY_ACTION_LABEL': 'OK',
    'PRIVACY_POLICY_TEXT': 'I have read and agree to the ',
    'PRIVACY_POLICY_LINK_TEXT': 'Privacy Policy',
    'PRIVACY_POLICY_VALIDATION_TEXT':
        'Please accept the privacy policy to continue',
    'SWITCH_MOBILE_DIALOG_TITLE': 'Switch Device?',
    'SWITCH_MOBILE_DIALOG_CONTENT':
        'This account is already logged in on another device. Continuing will log out the other device.',
    'SWITCH_MOBILE_DIALOG_CONTINUE': 'Continue',
    'SWITCH_MOBILE_DIALOG_BACK': 'Back',
  };

  static LocalizationsDelegate<AppLocalizations> getDelegate(
          AppConfiguration config, LocalSqlDataStore sql) =>
      AppLocalizationsDelegate(config, sql);

  Future<bool> load() async {
    // Load every row for the ACTIVE LOCALE rather than only the modules
    // currently in LocalizationParams(). `_messagesByCode` is a single flat
    // code -> message map shared process-wide, and `load()` clears it before
    // repopulating. Sourcing it from `returnLocalizationFromSQL` (which
    // filters on LocalizationParams().module) meant that as soon as a flow
    // dispatched onLoadLocalization for its own campaign modules — e.g.
    // `hcm-permissionhandler-CMP-SL-SMC-001` — the module list was REPLACED
    // (see LocalizationBloc._onLoadLocalization -> setModule) and the base
    // modules (`hcm-common`, `hcm-beneficiary`, ...) dropped out of the
    // query. Every key that lives only in a base module then became a
    // permanent lookup miss and rendered as its raw code (e.g.
    // CORE_COMMON_PERMISSION_NOTIFICATION_DESC, CORE_COMMON_ALLOW_ACCESS on
    // the permission-handler page) while keys the campaign module happened to
    // redefine still resolved — producing a half-translated screen.
    // FlowBuilderLocalization already hydrates from fetchAllForLocale for
    // this exact reason; keep both caches on the same locale-wide source.
    final localeTag = '${locale.languageCode}_${locale.countryCode ?? ''}';
    final listOfLocalizations = await LocalizationLocalRepository()
        .fetchAllForLocale(sql: sql, locale: localeTag);

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
    final loaded = _messagesByCode[localizedValues];
    if (loaded != null) return loaded;
    final fallback = _preLoginEnglishFallbacks[localizedValues];
    if (fallback != null) return fallback;
    return localizedValues;
  }
}
