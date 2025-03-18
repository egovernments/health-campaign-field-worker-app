import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

class MaterialLocalizationDelegateKi
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.countryCode == "BI" && locale.languageCode == "rn";
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    intl.DateFormat fullYearFormat;
    intl.DateFormat compactDateFormat;
    intl.DateFormat shortDateFormat;
    intl.DateFormat mediumDateFormat;
    intl.DateFormat longDateFormat;
    intl.DateFormat yearMonthFormat;
    intl.DateFormat shortMonthDayFormat;

    fullYearFormat = intl.DateFormat.y();
    compactDateFormat = intl.DateFormat.yMd();
    shortDateFormat = intl.DateFormat.yMMMd();
    mediumDateFormat = intl.DateFormat.MMMEd();
    longDateFormat = intl.DateFormat.yMMMMEEEEd();
    yearMonthFormat = intl.DateFormat.yMMMM();
    shortMonthDayFormat = intl.DateFormat.MMMd();

    intl.NumberFormat decimalFormat;
    intl.NumberFormat twoDigitZeroPaddedFormat;

    decimalFormat = intl.NumberFormat.decimalPattern();
    twoDigitZeroPaddedFormat = intl.NumberFormat('00');

    return MaterialLocalizationKiBI(
        fullYearFormat: fullYearFormat,
        compactDateFormat: compactDateFormat,
        shortDateFormat: shortDateFormat,
        mediumDateFormat: mediumDateFormat,
        longDateFormat: longDateFormat,
        yearMonthFormat: yearMonthFormat,
        shortMonthDayFormat: shortMonthDayFormat,
        decimalFormat: decimalFormat,
        twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat);
  }

  @override
  bool shouldReload(old) {
    return false;
  }
}

class MaterialLocalizationKi extends GlobalMaterialLocalizations {
  /// Create an instance of the translation bundle for English.
  ///
  /// For details on the meaning of the arguments, see [GlobalMaterialLocalizations].
  const MaterialLocalizationKi({
    super.localeName = 'en',
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  @override
  String get aboutListTileTitleRaw => r'About $applicationName';

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Back';

  @override
  String get bottomSheetLabel => 'Bottom Sheet';

  @override
  String get calendarModeButtonLabel => 'Switch to calendar';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get clearButtonTooltip => 'Clear text';

  @override
  String get closeButtonLabel => 'Close';

  @override
  String get closeButtonTooltip => 'Close';

  @override
  String get collapsedHint => 'Expanded';

  @override
  String get collapsedIconTapHint => 'Expand';

  @override
  String get continueButtonLabel => 'Continue';

  @override
  String get copyButtonLabel => 'Copy';

  @override
  String get currentDateLabel => 'Today';

  @override
  String get cutButtonLabel => 'Cut';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'Enter Date';

  @override
  String get dateOutOfRangeLabel => 'Out of range.';

  @override
  String get datePickerHelpText => 'Hitamo itariki';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'End date $fullDate';

  @override
  String get dateRangeEndLabel => 'End Date';

  @override
  String get dateRangePickerHelpText => 'Select range';

  @override
  String get dateRangeStartDateSemanticLabelRaw => r'Start date $fullDate';

  @override
  String get dateRangeStartLabel => 'Start Date';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'Delete';

  @override
  String get dialModeButtonLabel => 'Switch to dial picker mode';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Navigation menu';

  @override
  String get expandedHint => 'Collapsed';

  @override
  String get expandedIconTapHint => 'Collapse';

  @override
  String get expansionTileCollapsedHint => 'double tap to expand';

  @override
  String get expansionTileCollapsedTapHint => 'Expand for more details';

  @override
  String get expansionTileExpandedHint => 'double tap to collapse';

  @override
  String get expansionTileExpandedTapHint => 'Collapse';

  @override
  String get firstPageTooltip => 'First page';

  @override
  String get hideAccountsLabel => 'Hide accounts';

  @override
  String get inputDateModeButtonLabel => 'Switch to input';

  @override
  String get inputTimeModeButtonLabel => 'Switch to text input mode';

  @override
  String get invalidDateFormatLabel => 'Invalid format.';

  @override
  String get invalidDateRangeLabel => 'Invalid range.';

  @override
  String get invalidTimeLabel => 'Enter a valid time';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get lastPageTooltip => 'Last page';

  @override
  String? get licensesPackageDetailTextFew => null;

  @override
  String? get licensesPackageDetailTextMany => null;

  @override
  String? get licensesPackageDetailTextOne => '1 license';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount licenses';

  @override
  String? get licensesPackageDetailTextTwo => null;

  @override
  String? get licensesPackageDetailTextZero => 'No licenses';

  @override
  String get licensesPageTitle => 'Licenses';

  @override
  String get lookUpButtonLabel => 'Look Up';

  @override
  String get menuBarMenuLabel => 'Menu bar menu';

  @override
  String get menuDismissLabel => 'Dismiss menu';

  @override
  String get modalBarrierDismissLabel => 'Dismiss';

  @override
  String get moreButtonTooltip => 'More';

  @override
  String get nextMonthTooltip => 'Next month';

  @override
  String get nextPageTooltip => 'Next page';

  @override
  String get okButtonLabel => 'Nibyo';

  @override
  String get openAppDrawerTooltip => 'Open navigation menu';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow of about $rowCount';

  @override
  String get pasteButtonLabel => 'Shyira';

  @override
  String get popupMenuLabel => 'Popup menu';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Previous month';

  @override
  String get previousPageTooltip => 'Previous page';

  @override
  String get refreshIndicatorSemanticLabel => 'Refresh';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String? get remainingTextFieldCharacterCountOne => '1 character remaining';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount characters remaining';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String? get remainingTextFieldCharacterCountZero => 'No characters remaining';

  @override
  String get reorderItemDown => 'Move down';

  @override
  String get reorderItemLeft => 'Move left';

  @override
  String get reorderItemRight => 'Move right';

  @override
  String get reorderItemToEnd => 'Move to the end';

  @override
  String get reorderItemToStart => 'Move to the start';

  @override
  String get reorderItemUp => 'Move up';

  @override
  String get rowsPerPageTitle => 'Rows per page:';

  @override
  String get saveButtonLabel => 'Save';

  @override
  String get scanTextButtonLabel => 'Scan text';

  @override
  String get scrimLabel => 'Scrim';

  @override
  String get scrimOnTapHintRaw => r'Close $modalRouteContentName';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Search';

  @override
  String get searchWebButtonLabel => 'Search Web';

  @override
  String get selectAllButtonLabel => 'Select all';

  @override
  String get selectYearSemanticsLabel => 'Select year';

  @override
  String get selectedDateLabel => 'Selected';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String? get selectedRowCountTitleOne => '1 item selected';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount items selected';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String? get selectedRowCountTitleZero => 'No items selected';

  @override
  String get shareButtonLabel => 'Share';

  @override
  String get showAccountsLabel => 'Show accounts';

  @override
  String get showMenuTooltip => 'Show menu';

  @override
  String get signedInLabel => 'Signed in';

  @override
  String get tabLabelRaw => r'Tab $tabIndex of $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerDialHelpText => 'Select time';

  @override
  String get timePickerHourLabel => 'Hour';

  @override
  String get timePickerHourModeAnnouncement => 'Select hours';

  @override
  String get timePickerInputHelpText => 'Enter time';

  @override
  String get timePickerMinuteLabel => 'Minute';

  @override
  String get timePickerMinuteModeAnnouncement => 'Select minutes';

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date Range';

  @override
  String get viewLicensesButtonLabel => 'View licenses';
}

/// The translations for English, as used in India (`en_IN`).
class MaterialLocalizationKiBI extends MaterialLocalizationKi {
  /// Create an instance of the translation bundle for English, as used in India.
  ///
  /// For details on the meaning of the arguments, see [GlobalMaterialLocalizations].
  const MaterialLocalizationKiBI({
    super.localeName = 'en_IN',
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  @override
  String get shareButtonLabel => 'Share...';

  @override
  String get lookUpButtonLabel => 'Look up';

  @override
  String get expansionTileExpandedHint => 'double-tap to collapse';

  @override
  String get expansionTileCollapsedHint => 'double-tap to expand';

  @override
  String get bottomSheetLabel => 'Bottom sheet';

  @override
  String get keyboardKeyCapsLock => 'Caps lock';

  @override
  String get keyboardKeyChannelUp => 'Channel up';

  @override
  String get keyboardKeyChannelDown => 'Channel down';

  @override
  String get keyboardKeyNumLock => 'Num lock';

  @override
  String get keyboardKeyScrollLock => 'Scroll lock';

  @override
  String get keyboardKeyPrintScreen => 'Print screen';

  @override
  String get keyboardKeyPowerOff => 'Power off';

  @override
  String get keyboardKeyNumpadEnter => 'Num enter';

  @override
  String get dateInputLabel => 'Enter date';

  @override
  String get dateRangeEndLabel => 'End date';

  @override
  String get dateRangeStartLabel => 'Start date';

  @override
  String get unspecifiedDateRange => 'Date range';

  @override
  String get dateHelpText => 'dd/mm/yyyy';

  @override
  String get licensesPageTitle => 'Licences';

  @override
  String? get licensesPackageDetailTextZero => 'No licences';

  @override
  String? get licensesPackageDetailTextOne => '1 licence';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount licences';

  @override
  String get viewLicensesButtonLabel => 'View licences';

  @override
  String get popupMenuLabel => 'Pop-up menu';

  @override
  String get dialogLabel => 'Dialogue';

  @override
  String get reorderItemLeft => 'Move to the left';

  @override
  String get reorderItemRight => 'Move to the right';
}
