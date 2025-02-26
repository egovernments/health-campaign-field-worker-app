import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MaterialLocalizationDelegateKi
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.countryCode == "BI" && locale.languageCode == "rn";
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return MaterialLocalizationKi();
  }

  @override
  bool shouldReload(old) {
    return false;
  }
}

class MaterialLocalizationKi extends MaterialLocalizations {
  @override
  String aboutListTileTitle(String applicationName) {
    return applicationName;
  }

  @override
  // TODO: implement alertDialogLabel
  String get alertDialogLabel => "";

  @override
  // TODO: implement anteMeridiemAbbreviation
  String get anteMeridiemAbbreviation => "";

  @override
  // TODO: implement backButtonTooltip
  String get backButtonTooltip => "";

  @override
  // TODO: implement bottomSheetLabel
  String get bottomSheetLabel => "";

  @override
  // TODO: implement calendarModeButtonLabel
  String get calendarModeButtonLabel => "";

  @override
  // TODO: implement cancelButtonLabel
  String get cancelButtonLabel => "";

  @override
  // TODO: implement clearButtonTooltip
  String get clearButtonTooltip => "";

  @override
  // TODO: implement closeButtonLabel
  String get closeButtonLabel => "";

  @override
  // TODO: implement closeButtonTooltip
  String get closeButtonTooltip => "";

  @override
  // TODO: implement continueButtonLabel
  String get continueButtonLabel => "";

  @override
  // TODO: implement copyButtonLabel
  String get copyButtonLabel => "";

  @override
  // TODO: implement currentDateLabel
  String get currentDateLabel => "";

  @override
  // TODO: implement cutButtonLabel
  String get cutButtonLabel => "";

  @override
  // TODO: implement dateHelpText
  String get dateHelpText => "";

  @override
  // TODO: implement dateInputLabel
  String get dateInputLabel => "";

  @override
  // TODO: implement dateOutOfRangeLabel
  String get dateOutOfRangeLabel => "";

  @override
  // TODO: implement datePickerHelpText
  String get datePickerHelpText => "";

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) {
    return formattedDate;
  }

  @override
  // TODO: implement dateRangeEndLabel
  String get dateRangeEndLabel => "";

  @override
  // TODO: implement dateRangePickerHelpText
  String get dateRangePickerHelpText => "";

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) {
    // TODO: implement dateRangeStartDateSemanticLabel
    return formattedDate;
  }

  @override
  // TODO: implement dateRangeStartLabel
  String get dateRangeStartLabel => "";

  @override
  // TODO: implement dateSeparator
  String get dateSeparator => "";

  @override
  // TODO: implement deleteButtonTooltip
  String get deleteButtonTooltip => "";

  @override
  // TODO: implement dialModeButtonLabel
  String get dialModeButtonLabel => "";

  @override
  // TODO: implement dialogLabel
  String get dialogLabel => "";

  @override
  // TODO: implement drawerLabel
  String get drawerLabel => "";

  @override
  // TODO: implement firstDayOfWeekIndex
  int get firstDayOfWeekIndex =>
      (intl.DateFormat().dateSymbols.FIRSTDAYOFWEEK + 1) % 7;

  @override
  // TODO: implement firstPageTooltip
  String get firstPageTooltip => "";

  @override
  String formatCompactDate(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatDecimal(int number) {
    // TODO: implement formatDecimal
    return intl.NumberFormat.decimalPattern().format(number);
  }

  @override
  String formatFullDate(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return timeOfDay.hour.toString();
  }

  @override
  String formatMediumDate(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    return timeOfDay.minute.toString();
  }

  @override
  String formatMonthYear(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatShortDate(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay,
      {bool alwaysUse24HourFormat = false}) {
    return timeOfDay.period.name;
  }

  @override
  String formatYear(DateTime date) {
    return intl.DateFormat().format(date);
  }

  @override
  // TODO: implement hideAccountsLabel
  String get hideAccountsLabel => "";

  @override
  // TODO: implement inputDateModeButtonLabel
  String get inputDateModeButtonLabel => "";

  @override
  // TODO: implement inputTimeModeButtonLabel
  String get inputTimeModeButtonLabel => "";

  @override
  // TODO: implement invalidDateFormatLabel
  String get invalidDateFormatLabel => "";

  @override
  // TODO: implement invalidDateRangeLabel
  String get invalidDateRangeLabel => "";

  @override
  // TODO: implement invalidTimeLabel
  String get invalidTimeLabel => "";

  @override
  // TODO: implement keyboardKeyAlt
  String get keyboardKeyAlt => "";

  @override
  // TODO: implement keyboardKeyAltGraph
  String get keyboardKeyAltGraph => "";

  @override
  // TODO: implement keyboardKeyBackspace
  String get keyboardKeyBackspace => "";

  @override
  // TODO: implement keyboardKeyCapsLock
  String get keyboardKeyCapsLock => "";

  @override
  // TODO: implement keyboardKeyChannelDown
  String get keyboardKeyChannelDown => "";

  @override
  // TODO: implement keyboardKeyChannelUp
  String get keyboardKeyChannelUp => "";

  @override
  // TODO: implement keyboardKeyControl
  String get keyboardKeyControl => "";

  @override
  // TODO: implement keyboardKeyDelete
  String get keyboardKeyDelete => "";

  @override
  // TODO: implement keyboardKeyEject
  String get keyboardKeyEject => "";

  @override
  // TODO: implement keyboardKeyEnd
  String get keyboardKeyEnd => "";

  @override
  // TODO: implement keyboardKeyEscape
  String get keyboardKeyEscape => "";

  @override
  // TODO: implement keyboardKeyFn
  String get keyboardKeyFn => "";

  @override
  // TODO: implement keyboardKeyHome
  String get keyboardKeyHome => "";

  @override
  // TODO: implement keyboardKeyInsert
  String get keyboardKeyInsert => "";

  @override
  // TODO: implement keyboardKeyMeta
  String get keyboardKeyMeta => "";

  @override
  // TODO: implement keyboardKeyMetaMacOs
  String get keyboardKeyMetaMacOs => "";

  @override
  // TODO: implement keyboardKeyMetaWindows
  String get keyboardKeyMetaWindows => "";

  @override
  // TODO: implement keyboardKeyNumLock
  String get keyboardKeyNumLock => "";

  @override
  // TODO: implement keyboardKeyNumpad0
  String get keyboardKeyNumpad0 => "";

  @override
  // TODO: implement keyboardKeyNumpad1
  String get keyboardKeyNumpad1 => "";

  @override
  // TODO: implement keyboardKeyNumpad2
  String get keyboardKeyNumpad2 => "";

  @override
  // TODO: implement keyboardKeyNumpad3
  String get keyboardKeyNumpad3 => "";

  @override
  // TODO: implement keyboardKeyNumpad4
  String get keyboardKeyNumpad4 => "";

  @override
  // TODO: implement keyboardKeyNumpad5
  String get keyboardKeyNumpad5 => "";

  @override
  // TODO: implement keyboardKeyNumpad6
  String get keyboardKeyNumpad6 => "";

  @override
  // TODO: implement keyboardKeyNumpad7
  String get keyboardKeyNumpad7 => "";

  @override
  // TODO: implement keyboardKeyNumpad8
  String get keyboardKeyNumpad8 => "";

  @override
  // TODO: implement keyboardKeyNumpad9
  String get keyboardKeyNumpad9 => "";

  @override
  // TODO: implement keyboardKeyNumpadAdd
  String get keyboardKeyNumpadAdd => "";

  @override
  // TODO: implement keyboardKeyNumpadComma
  String get keyboardKeyNumpadComma => "";

  @override
  // TODO: implement keyboardKeyNumpadDecimal
  String get keyboardKeyNumpadDecimal => "";

  @override
  // TODO: implement keyboardKeyNumpadDivide
  String get keyboardKeyNumpadDivide => "";

  @override
  // TODO: implement keyboardKeyNumpadEnter
  String get keyboardKeyNumpadEnter => "";

  @override
  // TODO: implement keyboardKeyNumpadEqual
  String get keyboardKeyNumpadEqual => "";

  @override
  // TODO: implement keyboardKeyNumpadMultiply
  String get keyboardKeyNumpadMultiply => "";

  @override
  // TODO: implement keyboardKeyNumpadParenLeft
  String get keyboardKeyNumpadParenLeft => "";

  @override
  // TODO: implement keyboardKeyNumpadParenRight
  String get keyboardKeyNumpadParenRight => "";

  @override
  // TODO: implement keyboardKeyNumpadSubtract
  String get keyboardKeyNumpadSubtract => "";

  @override
  // TODO: implement keyboardKeyPageDown
  String get keyboardKeyPageDown => "";

  @override
  // TODO: implement keyboardKeyPageUp
  String get keyboardKeyPageUp => "";

  @override
  // TODO: implement keyboardKeyPower
  String get keyboardKeyPower => "";

  @override
  // TODO: implement keyboardKeyPowerOff
  String get keyboardKeyPowerOff => "";

  @override
  // TODO: implement keyboardKeyPrintScreen
  String get keyboardKeyPrintScreen => "";

  @override
  // TODO: implement keyboardKeyScrollLock
  String get keyboardKeyScrollLock => "";

  @override
  // TODO: implement keyboardKeySelect
  String get keyboardKeySelect => "";

  @override
  // TODO: implement keyboardKeyShift
  String get keyboardKeyShift => "";

  @override
  // TODO: implement keyboardKeySpace
  String get keyboardKeySpace => "";

  @override
  // TODO: implement lastPageTooltip
  String get lastPageTooltip => "";

  @override
  String licensesPackageDetailText(int licenseCount) {
    return licenseCount.toString();
  }

  @override
  // TODO: implement licensesPageTitle
  String get licensesPageTitle => "";

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => "";

  @override
  // TODO: implement menuBarMenuLabel
  String get menuBarMenuLabel => "";

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => "";

  @override
  // TODO: implement modalBarrierDismissLabel
  String get modalBarrierDismissLabel => "";

  @override
  // TODO: implement moreButtonTooltip
  String get moreButtonTooltip => "";

  @override
  // TODO: implement narrowWeekdays
  List<String> get narrowWeekdays =>
      intl.DateFormat().dateSymbols.NARROWWEEKDAYS;

  @override
  // TODO: implement nextMonthTooltip
  String get nextMonthTooltip => "";

  @override
  // TODO: implement nextPageTooltip
  String get nextPageTooltip => "";

  @override
  // TODO: implement okButtonLabel
  String get okButtonLabel => "";

  @override
  // TODO: implement openAppDrawerTooltip
  String get openAppDrawerTooltip => "";

  @override
  String pageRowsInfoTitle(
      int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return "$firstRow-$lastRow-$rowCount-$rowCountIsApproximate";
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    return inputString == null ? null : DateTime.parse(inputString);
  }

  @override
  // TODO: implement pasteButtonLabel
  String get pasteButtonLabel => "";

  @override
  // TODO: implement popupMenuLabel
  String get popupMenuLabel => "";

  @override
  // TODO: implement postMeridiemAbbreviation
  String get postMeridiemAbbreviation => "";

  @override
  // TODO: implement previousMonthTooltip
  String get previousMonthTooltip => "";

  @override
  // TODO: implement previousPageTooltip
  String get previousPageTooltip => "";

  @override
  // TODO: implement refreshIndicatorSemanticLabel
  String get refreshIndicatorSemanticLabel => "";

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return remaining.toString();
  }

  @override
  // TODO: implement reorderItemDown
  String get reorderItemDown => "";

  @override
  // TODO: implement reorderItemLeft
  String get reorderItemLeft => "";

  @override
  // TODO: implement reorderItemRight
  String get reorderItemRight => "";

  @override
  // TODO: implement reorderItemToEnd
  String get reorderItemToEnd => "";

  @override
  // TODO: implement reorderItemToStart
  String get reorderItemToStart => "";

  @override
  // TODO: implement reorderItemUp
  String get reorderItemUp => "";

  @override
  // TODO: implement rowsPerPageTitle
  String get rowsPerPageTitle => "";

  @override
  // TODO: implement saveButtonLabel
  String get saveButtonLabel => "";

  @override
  // TODO: implement scanTextButtonLabel
  String get scanTextButtonLabel => "";

  @override
  // TODO: implement scrimLabel
  String get scrimLabel => "";

  @override
  String scrimOnTapHint(String modalRouteContentName) {
    return modalRouteContentName;
  }

  @override
  // TODO: implement scriptCategory
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "";

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => "";

  @override
  // TODO: implement selectAllButtonLabel
  String get selectAllButtonLabel => "";

  @override
  // TODO: implement selectYearSemanticsLabel
  String get selectYearSemanticsLabel => "";

  @override
  // TODO: implement selectedDateLabel
  String get selectedDateLabel => "";

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    return selectedRowCount.toString();
  }

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => "";

  @override
  // TODO: implement showAccountsLabel
  String get showAccountsLabel => "";

  @override
  // TODO: implement showMenuTooltip
  String get showMenuTooltip => "";

  @override
  // TODO: implement signedInLabel
  String get signedInLabel => "";

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    return "$tabIndex-$tabCount";
  }

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return TimeOfDayFormat.HH_colon_mm;
  }

  @override
  // TODO: implement timePickerDialHelpText
  String get timePickerDialHelpText => "";

  @override
  // TODO: implement timePickerHourLabel
  String get timePickerHourLabel => "";

  @override
  // TODO: implement timePickerHourModeAnnouncement
  String get timePickerHourModeAnnouncement => "";

  @override
  // TODO: implement timePickerInputHelpText
  String get timePickerInputHelpText => "";

  @override
  // TODO: implement timePickerMinuteLabel
  String get timePickerMinuteLabel => "";

  @override
  // TODO: implement timePickerMinuteModeAnnouncement
  String get timePickerMinuteModeAnnouncement => "";

  @override
  // TODO: implement unspecifiedDate
  String get unspecifiedDate => "";

  @override
  // TODO: implement unspecifiedDateRange
  String get unspecifiedDateRange => "";

  @override
  // TODO: implement viewLicensesButtonLabel
  String get viewLicensesButtonLabel => "";
}
