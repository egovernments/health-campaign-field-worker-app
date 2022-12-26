import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/localization/localization_model.dart';
import '../../utils/constants.dart';
import 'app_localizations_delegate.dart';
import 'localization.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations(this.locale);
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  List<LocalizationMessageModel> _localizedStrings =
      <LocalizationMessageModel>[];
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future<bool> load() async {
    // Make API call to local DB and fetch the stored Localizations. and assign the values to _localizedStrings
    if (scaffoldMessengerKey.currentContext != null) {
      _localizedStrings = (BlocProvider.of<LocalizationBloc>(
                scaffoldMessengerKey.currentContext!,
              ).state.locaization !=
              null
          ? BlocProvider.of<LocalizationBloc>(
              scaffoldMessengerKey.currentContext!,
            ).state.locaization?.messages
          : [])!;

      return false;
    }

    return true;
  }

  String translate(
    String localizedValues,
  ) {
    var index = _localizedStrings
        .indexWhere((medium) => medium.code == localizedValues);

    return index != -1 ? _localizedStrings[index].message : localizedValues;
  }
}
