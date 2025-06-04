const attendance = Attendance();
const acknowledgementSuccess = AcknowledgementSuccess();
const common = Common();

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

  String get searchByNameOrID => 'CORE_COMMON_SEARCH_BY_NAME_OR_ID';

  String get coreCommonReasonRequired => 'CORE_COMMON_REASON_REQUIRED';

  String get corecommonclose => 'CORE_COMMON_CLOSE';

  String get coreCommonOk => 'CORE_COMMON_OK';

  String get coreCommonOr => 'CORE_COMMON_OR';

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

  String get commentKey => 'COMMENT_KEY';

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

  String get locationCapturing => 'CAPTURING_LOCATION';
  String get locationCaptured => 'LOCATION_CAPTURED';
  String get ctaProceed => 'PROCEED';
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

class Attendance {
  const Attendance();

  String get viewAttendanceLabel => 'HOME_VIEW_ATTENDANCE_LABEL';

  String get campaignNameLabel => 'CAMPAIGN_NAME_LABEL';

  String get eventTypeLabel => 'EVENT_TYPE_LABEL';

  String get staffCountLabel => 'STAFF_COUNT_LABEL';

  String get startDateLabel => 'START_DATE_LABEL';

  String get endDateLabel => 'END_DATE_LABEL';

  String get statusLabel => 'STATUS_LABEL';

  String get attendanceCompletionLabel => 'ATTENDANCE_COMPLETION_LABEL';

  String get noAttendeesEnrolledMessage =>
      'NO_ATTENDEES_ENROLLED_TO_THE_REGISTER';

  String get registerNotStarted => 'REGISTER_NOT_STARTED_MSG';

  String get saveAndMarkLaterLabel => 'SAVE_AND_MARK_LATER_LABEL';

  String get pleaseMarkAttForIndividuals =>
      'PLZ_MARK_ATTENDANCE_FOR_INDIVIDUALS';

  String get draftSavedMessage => 'DRAFT_SAVED_MESSAGE';

  String get attendanceSubmittedSuccessMsg =>
      'ATTENDANCE_SUBMITTED_SUCCESS_MSG';

  String get selectSession => 'SESSION_SELECTION_HEADER';

  String get sessionRadioLabel => 'SESSION_SELECT_RADIO_LABEL';

  String get dateOfSession => 'SESSION_DATE_OF_SESSION';

  String get sessionDescForRadio => 'SESSION_RADIO_INFO';

  String get missedAttendanceInfo => 'MISSED_ATTENDANCE_INFO';

  String get missedAttendanceDesc => 'MISSED_ATTENDANCE_DESC';

  String get viewAttendance => 'VIEW_ATTENDANCE';

  String get openRegister => 'ATTENDANCE_OPEN_REGISTER';

  String get markAttendance => 'BUTTON_MARK_ATTENDANCE';

  String get name => 'TABLE_HEADER_NAME';

  String get tableHeaderAttendance => 'TABLE_HEADER_ATTENDANCE';

  String get userId => 'TABLE_HEADER_USERID';

  String get markAttendanceLabel => "LABEL_MARK_ATTENDANCE";

  String get markedAsPresent => "MARKED_AS_PRESENT";

  String get distributorLabel => "DISTRIBUTOR_LABEL";

  String get attendanceNotMarked => "";

  String get markedAsAbsent => "MARKED_AS_ABSENT";

  String get closeButton => "CLOSE_BUTTON";

  String get retryButton => "RETRY_BUTTON";

  String get proceed => "PROCEED_BUTTON";

  String get confirmationLabel => "CONFIRMATION_LABEL";

  String get confirmationDesc => "CONFIRMATION_DESCRIPTION";

  String get confirmationDescNote => "CONFIRMATION_DESCRIPTION_NOTE";

  String get goBackButton => "GO_BACK_BUTTON";

  String get goHome => "GO_TO_HOME_SCREEN";

  String get morningSession => "MORNING_SESSION";

  String get eveningSession => "EVENING_SESSION";

  String get goToAttendanceRegisters => "GO_TO_ATTENDANCE_REGISTERS";

  String get plzSelectSession => "PLZ_SELECT_THE_SESSION";

  String get checkAttendanceMark => "CHECK_ATTENDANCE_MARK";

  String get backToAttendanceManager => "BACK_TO_ATTENDANCE_MANAGER";

  String get attendanceRegistarLabel => "ATTENDANCE_REGISTAR_LABEL";

  String get somethingWentWrong => "SOMETHING_WENT_WRONG";

  String get pleaseTryAgain => "PLEASE_TRY_AGAIN";

  String get retry => "CORE_COMMON_NULL";

  String get missedAttendanceHeader => "MISSED_ATTENDANCE_HEADER";

  String get missedAttendanceDescription => "MISSED_ATTENDANCE_DESCRIPTION";

  String get halfDay => 'HALF_DAY';
  String get present => 'PRESENT';
  String get absent => 'ABSENT';
  String get ctaDateChangeProceed => 'DATE_CHANGE_PROCEED';
  String get actionRequired => "ACTION_REQUIRED";

  String get scannerNotAvailableTitle => 'SCANNER_NOT_AVAILABLE_TITLE';

  String get scannerNotAvailableDescription =>
      'SCANNER_NOT_AVAILABLE_DESCRIPTION';

  String get enterUniqueCode => 'ENTER_UNIQUE_CODE';

  String get uniqueCodeLabel => 'UNIQUE_CODE_LABEL';

  String get markAttendanceManually => 'MARK_ATTENDANCE_MANUALLY';
}

