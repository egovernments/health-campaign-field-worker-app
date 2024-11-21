const common = Common();
const complaints = Complaints();
const complaintTypeShowcase = ComplaintTypeShowcase();
const complaintsDetailsShowcase = ComplaintsDetailsShowcase();
const complaintsDetailsViewShowcase = ComplaintsDetailsViewShowcase();
const complaintsInboxShowcase = ComplaintsInboxShowcase();

const householdLocation = HouseholdLocation();

const searchBeneficiary = SearchBeneficiary();

const individualDetails = IndividualDetails();

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

  String get profileUpdateSuccess => 'PROFILE_UPDATE_SUCCESS';
}

class Complaints {
  const Complaints();

  String get complaintsTypeHeading => 'COMPLAINTS_TYPE_HEADING';

  String get complaintsTypeLabel => 'COMPLAINTS_TYPE_LABEL';

  String get actionLabel => 'HOUSEHOLD_LOCATION_ACTION_LABEL';

  String get complaintsLocationLabel => 'COMPLAINTS_LOCATION_LABEL';

  String get complaintsDetailsLabel => 'COMPLAINTS_DETAILS_LABEL';

  String get dateOfComplaint => 'COMPLAINTS_DATE';

  String get complainantTypeQuestion => 'COMPLAINTS_COMPLAINANT_TYPE_QUESTION';

  String get complainantName => 'COMPLAINTS_COMPLAINANT_NAME';

  String get complainantContactNumber =>
      'COMPLAINTS_COMPLAINANT_CONTACT_NUMBER';

  String get supervisorName => 'COMPLAINTS_SUPERVISOR_NAME';

  String get supervisorContactNumber => 'COMPLAINTS_SUPERVISOR_CONTACT_NUMBER';

  String get complaintDescription => 'COMPLAINTS_DESCRIPTION';

  String get dialogTitle => 'COMPLAINTS_DIALOG_TITLE';

  String get dialogContent => 'COMPLAINTS_DIALOG_MESSAGE';

  String get fileComplaintAction => 'COMPLAINTS_FILE_COMPLAINT_ACTION';

  String get inboxHeading => 'COMPLAINTS_INBOX_HEADING';

  String get searchCTA => 'COMPLAINTS_INBOX_SEARCH_CTA';

  String get filterCTA => 'COMPLAINTS_INBOX_FILTER_CTA';

  String get sortCTA => 'COMPLAINTS_INBOX_SORT_CTA';

  String get complaintInboxFilterHeading => 'COMPLAINTS_INBOX_FILTER_HEADING';

  String get complaintsFilterClearAll => 'COMPLAINTS_FILTER_CLEAR_ALL';

  String get complaintInboxSearchHeading => 'COMPLAINTS_INBOX_SEARCH_HEADING';

  String get complaintInboxSortHeading => 'COMPLAINTS_INBOX_SORT_HEADING';

  String get complaintsSortDateAsc => 'COMPLAINT_SORT_DATE_ASC';

  String get complaintsSortDateDesc => 'COMPLAINT_SORT_DATE_DESC';

  String get assignedToAll => 'COMPLAINTS_ASSIGNED_TO_ALL';

  String get assignedToSelf => 'COMPLAINTS_ASSIGNED_TO_SELF';

  String get noComplaintsExist => 'COMPLAINTS_NO_COMPLAINTS_EXIST';

  String get validationRequiredError => 'COMPLAINTS_VALIDATION_REQUIRED_ERROR';

  String get inboxDateLabel => 'COMPLAINTS_INBOX_DATE_LABEL';

  String get inboxNumberLabel => 'COMPLAINTS_INBOX_NUMBER_LABEL';

  String get inboxTypeLabel => 'COMPLAINTS_INBOX_TYPE_LABEL';

  String get inboxAreaLabel => 'COMPLAINTS_INBOX_AREA_LABEL';

  String get inboxStatusLabel => 'COMPLAINTS_INBOX_STATUS_LABEL';

  String get inboxNotGeneratedLabel => 'COMPLAINTS_INBOX_NOT_GENERATED_LABEL';

  String get inboxSyncRequiredLabel => 'COMPLAINTS_INBOX_SYNC_REQUIRED_LABEL';

  String get raisedForMyself => 'COMPLAINTS_RAISED_FOR_MYSELF';
  String get validationMinLengthError =>
      'COMPLAINTS_VALIDATION_MINLENGTH_ERROR';

  String get raisedForAnotherUser => 'COMPLAINTS_RAISED_FOR_ANOTHER_USER';

  String get locality => 'COMPLAINTS_LOCALITY';

  String get backToInbox => 'COMPLAINTS_BACK_TO_INBOX';

  String get acknowledgementAction => 'COMPLAINTS_ACKNOWLEDGEMENT_ACTION';

  String get acknowledgementDescription =>
      'COMPLAINTS_ACKNOWLEDGEMENT_DESCRIPTION';

  String get acknowledgementLabel => 'COMPLAINTS_ACKNOWLEDGEMENT_LABEL';

  String get acknowledgementSubLabelMain =>
      'COMPLAINTS_ACKNOWLEDGEMENT_SUB_LABEL_MAIN';

  String get acknowledgementSubLabelSub =>
      'COMPLAINTS_ACKNOWLEDGEMENT_SUB_LABEL_SUB';

  String get complaintsError => 'COMPLAINTS_VALIDATION_REQUIRED_ERROR';

  String get validationRadioRequiredError =>
      'COMPLAINTS_VALIDATION_RADIO_REQUIRED_ERROR';
}

class ComplaintTypeShowcase {
  const ComplaintTypeShowcase();

  String get complaintType {
    return 'COMPLAINT_TYPE_SHOWCASE_COMPLAINT_TYPE';
  }

  String get complaintTypeNext {
    return 'COMPLAINT_TYPE_SHOWCASE_COMPLAINT_TYPE_NEXT';
  }
}

class ComplaintsDetailsShowcase {
  const ComplaintsDetailsShowcase();

  String get complaintDate {
    return 'COMPLAINT_DETAILS_SHOWCASE_DATE';
  }

  String get complaintOrganizationUnit {
    return 'COMPLAINT_DETAILS_SHOWCASE_ORGANIZATION_UNIT';
  }

  String get complaintSelfOrOther {
    return 'COMPLAINT_DETAILS_SHOWCASE_SELF_OR_OTHER';
  }

  String get complaintName {
    return 'COMPLAINT_DETAILS_SHOWCASE_NAME';
  }

  String get complaintContact {
    return 'COMPLAINT_DETAILS_SHOWCASE_CONTACT';
  }

  String get complaintSupervisorName {
    return 'COMPLAINT_DETAILS_SHOWCASE_SUPERVISOR_NAME';
  }

  String get complaintSupervisorContact {
    return 'COMPLAINT_DETAILS_SHOWCASE_SUPERVISOR_CONTACT';
  }

  String get complaintDescription {
    return 'COMPLAINT_DETAILS_SHOWCASE_DESCRIPTION';
  }

  String get complaintSubmit {
    return 'COMPLAINT_DETAILS_SHOWCASE_SUBMIT';
  }
}

class ComplaintsDetailsViewShowcase {
  const ComplaintsDetailsViewShowcase();

  String get complaintNumber {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_NUMBER';
  }

  String get complaintType {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_TYPE';
  }

  String get complaintDate {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_DATE';
  }

  String get complaintName {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_NAME';
  }

  String get complaintArea {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_AREA';
  }

  String get complaintContact {
    return 'COMPLAINT_DETAILS_VIEW_CONTACT';
  }

  String get complaintStatus {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_STATUS';
  }

  String get complaintDescription {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_DESCRIPTION';
  }

  String get complaintClose {
    return 'COMPLAINT_DETAILS_VIEW_SHOWCASE_CLOSE';
  }
}

class ComplaintsInboxShowcase {
  const ComplaintsInboxShowcase();

  String get complaintSearch {
    return 'COMPLAINT_INBOX_SHOWCASE_SEARCH';
  }

  String get complaintFilter {
    return 'COMPLAINT_INBOX_SHOWCASE_FILTER';
  }

  String get complaintSort {
    return 'COMPLAINT_INBOX_SHOWCASE_SORT';
  }

  String get complaintNumber {
    return 'COMPLAINT_INBOX_SHOWCASE_NUMBER';
  }

  String get complaintType {
    return 'COMPLAINT_INBOX_SHOWCASE_TYPE';
  }

  String get complaintDate {
    return 'COMPLAINT_INBOX_SHOWCASE_DATE';
  }

  String get complaintArea {
    return 'COMPLAINT_INBOX_SHOWCASE_AREA';
  }

  String get complaintStatus {
    return 'COMPLAINT_INBOX_SHOWCASE_STATUS';
  }

  String get complaintOpen {
    return 'COMPLAINT_INBOX_SHOWCASE_OPEN';
  }

  String get complaintCreate {
    return 'COMPLAINT_INBOX_SHOWCASE_CREATE';
  }
}

class HouseholdLocation {
  const HouseholdLocation();

  String get householdLocationLabelText => 'HOUSEHOLD_LOCATION_LABEL_TEXT';

  String get administrationAreaFormLabel => 'ADMINISTRATION_AREA_FORM_LABEL';

  String get administrationAreaRequiredValidation =>
      'HOUSEHOLD_LOCATION_ADMINISTRATION_AREA_REQUIRED_VALIDATION';

  String get householdAddressLine1LabelText =>
      'HOUSEHOLD_ADDRESS_LINE_1_FORM_LABEL';

  String get landmarkFormLabel => 'LANDMARK_FORM_LABEL';

  String get householdAddressLine2LabelText =>
      'HOUSEHOLD_ADDRESS_LINE_2_FORM_LABEL';

  String get postalCodeFormLabel => 'POSTAL_CODE_FORM_LABEL';

  String get actionLabel => 'HOUSEHOLD_LOCATION_ACTION_LABEL';
}

class IndividualDetails {
  const IndividualDetails();

  String get individualsDetailsLabelText => 'INDIVIDUAL_LABEL_TEXT';

  String get nameLabelText => 'INDIVIDUAL_NAME_LABEL_TEXT';

  String get checkboxLabelText => 'HEAD_OF_HOUSEHOLD_LABEL_TEXT';

  String get idTypeLabelText => 'ID_TYPE_LABEL_TEXT';

  String get idNumberLabelText => 'ID_NUMBER_LABEL_TEXT';

  String get idNumberSuggestionText => 'ID_NUMBER_SUGGESTION_TEXT';

  String get dobLabelText => 'DOB_LABEL_TEXT';

  String get ageLabelText => 'AGE_LABEL_TEXT';

  String get separatorLabelText => 'SEPARATOR_LABEL_TEXT';

  String get genderLabelText => 'GENDER_LABEL_TEXT';

  String get dobErrorText => 'DOB_ERROR_MESSAGE';

  String get mobileNumberLabelText => 'MOBILE_NUMBER_LABEL_TEXT';

  String get heightLabelText => 'HEIGHT_LABEL_TEXT';

  String get submitButtonLabelText => 'INDIVIDUAL_DETAILS_SUBMIT';

  String get mobileNumberInvalidFormatValidationMessage =>
      'INDIVIDUAL_DETAILS_INVALID_MOBILE_NUMBER';

  String get yearsHintText => 'YEARS_HINT_TEXT';
  String get monthsHintText => 'MONTHS_HINT_TEXT';

  String get yearsErrorText => 'ERR_YEARS';

  String get monthsErrorText => 'ERR_MONTHS';

  String get yearsAndMonthsErrorText => 'ERR_YEARS_AND_MONTHS';

  String get linkVoucherToIndividual => 'LINK_VOUCHER_TO_INDIVIDUAL';
}

class SearchBeneficiary {
  const SearchBeneficiary();

  String get statisticsLabelText => 'BENEFICIARY_STATISTICS_LABEL_TEXT';

  String get searchIndividualLabelText =>
      'BENEFICIARY_STATISTICS_SEARCH_INDIVIDUAL_LABEL';

  String get noOfHouseholdsRegistered => 'NO_OF_HOUSEHOLDS_REGISTERED';

  String get noOfResourcesDelivered => 'NO_OF_RESOURCES_DELIVERED';

  String get beneficiarySearchHintText => 'BENEFICIARY_SEARCH_HINT_TEXT';

  String get beneficiaryIndividualSearchHintText =>
      'BENEFICIARY_INDIVIDUAL_SEARCH_HINT_TEXT';

  String get beneficiaryInfoDescription => 'BENEFICIARY_INFO_DESCRIPTION';

  String get beneficiaryInfoTitle => 'BENEFICIARY_INFO_TITLE';

  String get beneficiaryAddActionLabel => 'BENEFICIARY_ADD_ACTION_LABEL';

  String get iconLabel => 'ICON_LABEL';

  String get yearsAbbr => 'YEARS_ABBR';

  String get monthsAbbr => 'MONTHS_ABBR';

  String get proximityLabel => 'PROXIMITY_LABEL';
}

