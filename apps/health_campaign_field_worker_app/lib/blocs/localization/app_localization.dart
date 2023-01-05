import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/localization.dart';
import '../../utils/constants.dart';
import 'app_localizations_delegate.dart';
import 'localization.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final List<Localization> _localizedStrings = <Localization>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
    AppConiguration config,
  ) =>
      AppLocalizationsDelegate(config);

  Future<bool> load() async {
    _localizedStrings.clear();
    if (scaffoldMessengerKey.currentContext != null) {
      _localizedStrings.addAll(BlocProvider.of<LocalizationBloc>(
        scaffoldMessengerKey.currentContext!,
      ).state.locaization);

      return true;
    }

    return false;
  }

  String translate(
    String localizedValues,
  ) {
    var index = _localizedStrings
        .indexWhere((medium) => medium.code == localizedValues);

    return index != -1 ? _localizedStrings[index].message : localizedValues;
  }
}
