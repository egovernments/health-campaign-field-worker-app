import 'package:flutter/cupertino.dart';

class CupertinoLocalizationDelegateKi
    extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.countryCode == "BI" && locale.languageCode == "rn";
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return CupertinoLocalizationKi();
  }

  @override
  bool shouldReload(old) {
    return false;
  }
}

class CupertinoLocalizationKi extends CupertinoLocalizations {
  @override
  // TODO: implement alertDialogLabel
  String get alertDialogLabel => throw UnimplementedError();

  @override
  // TODO: implement anteMeridiemAbbreviation
  String get anteMeridiemAbbreviation => throw UnimplementedError();

  @override
  // TODO: implement clearButtonLabel
  String get clearButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement copyButtonLabel
  String get copyButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement cutButtonLabel
  String get cutButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement datePickerDateOrder
  DatePickerDateOrder get datePickerDateOrder => throw UnimplementedError();

  @override
  // TODO: implement datePickerDateTimeOrder
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      throw UnimplementedError();

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    // TODO: implement datePickerDayOfMonth
    throw UnimplementedError();
  }

  @override
  String datePickerHour(int hour) {
    // TODO: implement datePickerHour
    throw UnimplementedError();
  }

  @override
  String? datePickerHourSemanticsLabel(int hour) {
    // TODO: implement datePickerHourSemanticsLabel
    throw UnimplementedError();
  }

  @override
  String datePickerMediumDate(DateTime date) {
    // TODO: implement datePickerMediumDate
    throw UnimplementedError();
  }

  @override
  String datePickerMinute(int minute) {
    // TODO: implement datePickerMinute
    throw UnimplementedError();
  }

  @override
  String? datePickerMinuteSemanticsLabel(int minute) {
    // TODO: implement datePickerMinuteSemanticsLabel
    throw UnimplementedError();
  }

  @override
  String datePickerMonth(int monthIndex) {
    // TODO: implement datePickerMonth
    throw UnimplementedError();
  }

  @override
  String datePickerStandaloneMonth(int monthIndex) {
    // TODO: implement datePickerStandaloneMonth
    throw UnimplementedError();
  }

  @override
  String datePickerYear(int yearIndex) {
    // TODO: implement datePickerYear
    throw UnimplementedError();
  }

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement modalBarrierDismissLabel
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement noSpellCheckReplacementsLabel
  String get noSpellCheckReplacementsLabel => throw UnimplementedError();

  @override
  // TODO: implement pasteButtonLabel
  String get pasteButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement postMeridiemAbbreviation
  String get postMeridiemAbbreviation => throw UnimplementedError();

  @override
  // TODO: implement searchTextFieldPlaceholderLabel
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement selectAllButtonLabel
  String get selectAllButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => throw UnimplementedError();

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    // TODO: implement tabSemanticsLabel
    throw UnimplementedError();
  }

  @override
  String timerPickerHour(int hour) {
    // TODO: implement timerPickerHour
    throw UnimplementedError();
  }

  @override
  String? timerPickerHourLabel(int hour) {
    // TODO: implement timerPickerHourLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerPickerHourLabels
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  String timerPickerMinute(int minute) {
    // TODO: implement timerPickerMinute
    throw UnimplementedError();
  }

  @override
  String? timerPickerMinuteLabel(int minute) {
    // TODO: implement timerPickerMinuteLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerPickerMinuteLabels
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  String timerPickerSecond(int second) {
    // TODO: implement timerPickerSecond
    throw UnimplementedError();
  }

  @override
  String? timerPickerSecondLabel(int second) {
    // TODO: implement timerPickerSecondLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerPickerSecondLabels
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  // TODO: implement todayLabel
  String get todayLabel => throw UnimplementedError();
}
