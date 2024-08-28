const common = Common();
const acknowledgementSuccess = AcknowledgementSuccess();
const closeHousehold = CloseHousehold();
const closedHouseholdDetailsShowcase = ClosedHouseholdDetailsShowcase();

class Common {
  const Common();

  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';

  String get coreCommonAge => 'CORE_COMMON_AGE';

  String get coreCommonName => 'CORE_COMMON_NAME';

  String get coreCommonEmailId => 'CORE_COMMON_EMAIL_ID';

  String get coreCommonGender => 'CORE_COMMON_GENDER';

  String get coreCommonMobileNumber => 'CORE_COMMON_MOBILE_NUMBER';

  String get coreCommonSubmit => 'CORE_COMMON_SUBMIT';

  String get coreCommonSave => 'CORE_COMMON_SAVE';

  String get coreCommonCancel => 'CORE_COMMON_CANCEL';

  String get corecommonRequired => 'CORE_COMMON_REQUIRED';

  String get searchByName => 'CORE_COMMON_SEARCH_BY_NAME';

  String get coreCommonReasonRequired => 'CORE_COMMON_REASON_REQUIRED';

  String get corecommonclose => 'CORE_COMMON_CLOSE';

  String get coreCommonOk => 'CORE_COMMON_OK';

  String get coreCommonNA => 'CORE_COMMON_NA';

  String get coreCommonProfile => 'CORE_COMMON_PROFILE';

  String get coreCommonLogout => 'CORE_COMMON_LOGOUT';

  String get coreCommonBack => 'CORE_COMMON_BACK';

  String get coreCommonHelp => 'CORE_COMMON_HELP';

  String get coreCommonHome => 'CORE_COMMON_HOME';

  String get coreCommonViewDownloadedData => 'CORE_COMMON_VIEW_DOWNLOADED_DATA';

  String get coreCommonlanguage => 'CORE_COMMON_LANGUAGE';

  String get coreCommonSyncProgress => 'CORE_COMMON_SYNC_PROGRESS';

  String get coreCommonDataSynced => 'CORE_COMMON_DATA_SYNCED';

  String get coreCommonDataSyncFailed => 'CORE_COMMON_DATA_SYNC_FAILED';

  String get coreCommonDataSyncRetry => 'CORE_COMMON_DATA_SYNC_RETRY';

  String get connectionLabel => 'CORE_COMMON_CONNECTION_LABEL';

  String get connectionContent => 'CORE_COMMON_CONNECTION_CONTENT';

  String get coreCommonSkip => 'CORE_COMMON_SKIP';

  String get coreCommonNext => 'CORE_COMMON_NEXT';

  String get coreCommonYes => 'CORE_COMMON_YES';

  String get coreCommonNo => 'CORE_COMMON_NO';
  String get coreCommonGoback => 'CORE_COMMON_GO_BACK';

  String get coreCommonRequiredItems => 'CORE_COMMON_REQUIRED_ITEMS';

  String get min2CharsRequired => 'MIN_2_CHARS_REQUIRED';

  String get maxCharsRequired => 'MAX_CHARS_ALLOWED';

  String get maxValue => 'MAX_VALUE_ALLOWED';
  String get minValue => 'MIN_VALUE_ALLOWED';

  String get noResultsFound => 'NO_RESULTS_FOUND';

  String get noProjectSelected => 'NO_PROJECT_SELECTED';

  String get coreCommonSyncInProgress => 'CORE_COMMON_SYNC_IN_PROGRESS';

  String get facilitySearchHeaderLabel => 'FACILITY_SEARCH_HEADER_LABEL';
  String get projectFacilitySearchHeaderLabel =>
      'PROJECT_FACILITY_SEARCH_HEADER_LABEL';

  String get coreCommonDownload => 'CORE_COMMON_DOWNLOAD';

  String get coreCommonDownloadFailed => 'CORE_COMMON_DOWNLOAD_FAILED';

  String get noMatchFound => 'CORE_COMMON_NO_MATCH_FOUND';

  String get scanBales => 'CORE_COMMON_SCAN_BALES';
  String get ageInMonths => 'AGE_IN_MONTHS_LABEL';
  String get locationCapturing => 'CAPTURING_LOCATION';
  String get coreCommonMeters => 'CORE_COMMON_METERS';
}


class AcknowledgementSuccess {
  const AcknowledgementSuccess();

  String get actionLabelText => 'ACKNOWLEDGEMENT_SUCCESS_ACTION_LABEL_TEXT';

  String get acknowledgementDescriptionText =>
      'ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT';

  String get acknowledgementLabelText => 'ACKNOWLEDGEMENT_SUCCESS_LABEL_TEXT';

  String get goToHome => 'GO_TO_HOME_SCREEN';
  String get downloadmoredata => 'DOWNLOAD_MORE_DATA';
  String get dataDownloadedSuccessLabel => 'DATA_DOWNLOADED_SUCCESS_LABEL';
}

class CloseHousehold {
  const CloseHousehold();

  String get closeHouseHoldDetailLabel => 'CLOSE_HOUSEHOLD_DETAIL_LABEL';

  String get closeHouseHoldDetailDescLabel => 'CLOSE_HOUSEHOLD_DETAIL_DESC_LABEL';

  String get villageName => 'CLOSE_HOUSEHOLD_VILLAGE_NAME_LABEL';

  String get accuracyLabel => 'CLOSE_HOUSEHOLD_GPS_ACCURACY_LABEL';

  String get headNameLabel => 'CLOSE_HOUSEHOLD_HEAD_NAME_LABEL';

  String get closeHouseholdDate => 'CLOSE_HOUSEHOLD_SUMMARY_DATE_LABEL';

  String get closeHouseholdVillageName => 'CLOSE_HOUSEHOLD_SUMMARY_VILLAGE_NAME_LABEL';

  String get closeHouseholdHeadName => 'CLOSE_HOUSEHOLD_SUMMARY_HEAD_NAME_LABEL';

  String get closeHouseholdGpsAccuracyLabel => 'CLOSE_HOUSEHOLD_SUMMARY_GPS_ACCURACY_LABEL';

  String get closeHouseholdSummaryLabel => 'CLOSE_HOUSEHOLD_SUMMARY_LABEL';

  String get closeHouseholdVoucherSummaryLabel => 'CLOSE_HOUSEHOLD_SUMMARY_VOUCHERS_LABEL';

  String get closeHouseholdVoucherCodeLabel => 'CLOSE_HOUSEHOLD_SUMMARY_VOUCHER_CODE_LABEL';

  String get closeHouseholdVoucherScannerLabel => 'CLOSE_HOUSEHOLD_VOUCHER_SCANNER_LABEL';
}


class ClosedHouseholdDetailsShowcase {
  const ClosedHouseholdDetailsShowcase();

  String get villageName {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_VILLAGE_NAME';
  }

  String get gpsAccuracy {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_GPS_ACCURACY';
  }

  String get householdHeadName {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_HEAD_NAME';
  }

}


