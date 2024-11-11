const referralReconciliation = ReferralReconciliation();
const acknowledgementSuccess = AcknowledgementSuccess();
const common = Common();
const checklist = Checklist();

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

  String get coreCommonSyncInProgress => 'CORE_COMMON_SYNC_IN_PROGRESS';

  String get facilitySearchHeaderLabel => 'FACILITY_SEARCH_HEADER_LABEL';
  String get projectFacilitySearchHeaderLabel =>
      'PROJECT_FACILITY_SEARCH_HEADER_LABEL';

  String get coreCommonDownload => 'CORE_COMMON_DOWNLOAD';

  String get coreCommonDownloadFailed => 'CORE_COMMON_DOWNLOAD_FAILED';

  String get noMatchFound => 'CORE_COMMON_NO_MATCH_FOUND';

  String get scanBales => 'CORE_COMMON_SCAN_BALES';
  String get ageInMonths => 'AGE_IN_MONTHS_LABEL';

  String get inactive => 'INACTIVE';
  String get genderLabelText => 'GENDER_LABEL_TEXT';
}

class Checklist {
  const Checklist();

  String get checklist => 'CHECKLIST';

  String get checklistlabel => 'CHECKLIST_LABEL';

  String get checklistCreateActionLabel => 'CHECKLIST_CREATE_ACTION_LABEL';

  String get checklistViewActionLabel => 'CHECKLIST_VIEW_ACTION_LABEL';

  String get checklistDetailLabel => 'CHECKLIST_DETAILS_LABEL';

  String get checklistDialogLabel => 'CHECKLIST_DIALOG_LABEL';

  String get checklistDialogDescription => 'CHECKLIST_DIALOG_DESCRITPTION';

  String get checklistDialogPrimaryAction => 'CHECKLIST_DIALOG_PRIMARY_ACTION';

  String get checklistDialogSecondaryAction =>
      'CHECKLIST_DIALOG_SECONDARY_ACTION';

  String get checklistdate => 'CHECKLIST_DATE';

  String get checklistReasonRequiredError => 'CHECKLIST_REASON_REQUIRED_ERROR';

  String get notSelectedKey => 'NOT_SELECTED';

  String get checklistBackDialogLabel => 'CHECKLIST_BACK_DIALOG_LABEL';

  String get checklistBackDialogDescription =>
      'CHECKLIST_BACK_DIALOG_DESCRITPTION';

  String get checklistBackDialogPrimaryAction =>
      'CHECKLIST_BACK_DIALOG_PRIMARY_ACTION';

  String get checklistBackDialogSecondaryAction =>
      'CHECKLIST_BACK_DIALOG_SECONDARY_ACTION';
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

class ReferralReconciliation {
  const ReferralReconciliation();

  String get dateOfReferralLabel => 'REFER_BENEFICIARY_DATE_OF_REFERRAL_LABEL';
  String get dateOfEvaluationLabel =>
      'REFER_BENEFICIARY_DATE_OF_EVALUATION_LABEL';
  String get administrationUnitFormLabel => 'ADMINISTRATION_UNIT_FORM_LABEL';
  String get referredByLabel => 'REFERRED_BY_FORM_LABEL';
  String get referredToLabel => 'REFERRED_TO_FORM_LABEL';
  String get reasonForReferral => 'REASON_FOR_REFERRAL';
  String get referralComments => 'REFERRAL_COMMENTS';
  String get referralDetails => 'REFERRAL_DETAILS_HEADER';
  String get facilityValidationMessage => 'PLEASE_ENTER_VALID_FACILITY';
  String get facilityDetails => 'FACILITY_DETAILS_HEADER';
  String get evaluationFacilityLabel => 'EVALUATION_FACILITY_LABEL';
  String get nameOfHealthFacilityCoordinatorLabel =>
      'NAME_OF_HEALTH_FACILITY_COORDINATOR';
  String get healthFacilityCoordinatorLabel => 'NAME_OF_HF_COORDINATOR_LABEL';
  String get nameOfTheChildLabel => 'REFERRAL_NAME_OF_CHILD_LABEL';
  String get beneficiaryIdLabel => 'REFERRAL_BENEFICIARY_ID_LABEL';
  String get referralCodeLabel => 'REFERRAL_CODE_LABEL';
  String get reasonForReferralHeader => 'REASON_FOR_REFERRAL_HEADER';
  String get searchReferralsHeader => 'SEARCH_REFERRALS_HEADER';
  String get referredByTeamCodeLabel => 'REFERRED_BY_TEAM_CODE_LABEL';
  String get selectCycle => 'REFERRAL_SELECT_CYCLE';
  String get createReferralLabel => 'CREATE_REFERRAL_LABEL';
  String get noChecklistFound => 'NO_CHECKLISTS_FOUND';
  String get cycle => 'CYCLE';
  String get noCyclesFound => 'NO_CYCLES_FOUND';
  String get iconLabel => 'ICON_LABEL';
  String get referralSearchHintText => 'REFERRAL_SEARCH_HINT_TEXT';
  String get referralInfoDescription => 'REFERRAL_INFO_DESCRIPTION';
  String get beneficiaryInfoTitle => 'BENEFICIARY_INFO_TITLE';
  String get scannerLabel => 'SCANNER_LABEL';
  String get noFacilitiesAssigned => 'NO_FACILITIES_ASSIGNED';
  String get facilityIsMandatory => 'FACILITY_IS_MANDATORY';
}
