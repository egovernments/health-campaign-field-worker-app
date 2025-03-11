library i18;

const common = Common();
const login = Login();
const forgotPassword = ForgotPassword();
const home = Home();
const acknowledgementSuccess = AcknowledgementSuccess();
const adverseEvents = AdverseEvents();
const projectSelection = ProjectSelection();
const checklist = Checklist();
const complaints = Complaints();
const syncDialog = SyncDialog();
const homeShowcase = HomeShowcase();
const privacyPolicy = PrivacyPolicy();

const memberCard = MemberCard();
const attendance = Attendance();
const householdOverView = HouseholdOverView();
const deliverIntervention = DeliverIntervention();

const householdLocationShowcase = HouseholdLocationShowcase();
const householdLocation = HouseholdLocation();
const searchBeneficiary = SearchBeneficiary();
const individualDetails = IndividualDetails();
const beneficiaryDetails = BeneficiaryDetails();
const stockDetails = StockDetails();

const selectStockShowcase = SelectStockShowcase();
const warehouseDetailsShowcase = WarehouseDetailsShowcase();
const stockDetailsReceiptShowcase = StockDetailsReceiptShowcase();
const stockDetailsIssuedShowcase = StockDetailsIssuedShowcase();
const selectChecklistShowcase = SelectChecklistShowcase();
const stockDetailsReturnedShowcase = StockDetailsReturnedShowcase();
const stockReconciliationShowcase = StockReconciliationShowcase();
const inventoryReportDetails = InventoryReportDetails();

const checklistDataShowcase = ChecklistDataShowcase();
const checklistListShowcase = ChecklistListShowcase();
const complaintTypeShowcase = ComplaintTypeShowcase();
const complaintsDetailsShowcase = ComplaintsDetailsShowcase();
const complaintsDetailsViewShowcase = ComplaintsDetailsViewShowcase();
const complaintsInboxShowcase = ComplaintsInboxShowcase();

class MemberCard {
  const MemberCard();

  String get deliverDetailsUpdateLabel => "DELIVER_DETAILS_UPDATE_LABEL";
}

class Attendance {
  const Attendance();
  String get identityCardNumber => "IDENTITY_CARD_NUMBER";
  String get phoneNumber => "PHONE_NUMBER";
}

class HouseholdOverView {
  const HouseholdOverView();

  String get householdOverViewActionText => "HOUSEHOLD_OVER_VIEW_ACTION_TEXT";

  String get householdOverViewEditLabel => "HOUSEHOLD_OVERVIEW_EDIT_LABEL";

  String get householdOverViewEditIconText =>
      "HOUSEHOLD_OVERVIEW_EDIT_ICON_BUTTON";

  String get householdOverViewLabel => "HOUSEHOLD_OVER_VIEW_LABEL";

  String get householdOverViewHouseholdHeadNameLabel =>
      "HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_NAME_LABEL";

  String get householdOverViewActionCardTitle =>
      "HOUSEHOLD_OVERVIEW_PRIMARY_ACTION_CARD_TITLE";

  String get householdOverViewPrimaryActionLabel =>
      "HOUSEHOLD_OVERVIEW_PRIMARY_ACTION_LABEL";

  String get householdOverViewSecondaryActionLabel =>
      "HOUSEHOLD_OVERVIEW_SECONDARY_ACTION_LABEL";

  String get householdOverViewAddActionText =>
      "HOUSEHOLD_OVERVIEW_ADD_ACTION_TEXT";

  String get householdOverViewNotRegisteredIconLabel =>
      "HOUSEHOLD_OVER_VIEW_NOT_REGISTERED_ICON_LABEL";
}

class DeliverIntervention {
  const DeliverIntervention();

  String get scanningITNs => "DELIVER_INTERVENTION_SCANNING_ITNS";

  String get memberCountText => "MEMBER_COUNT_TEXT";
  String get bednetCountText => "BEDNET_COUNT_TEXT";

  String get doseGivenCareGiver => 'DELIVER_INTERVENTION_DOSE_GIVEN_CARE_GIVER';
  String get infoWrittenInChildCard =>
      'DELIVER_INTERVENTION_DOSE_INFO_IN_CHILD_CARD_ADDED';
  String get healthTalkGivenOnSPAQ =>
      'DELIVER_INTERVENTION_DOSE_HEALTH_TALK_GIVEN_SPAQ';
  String get wasTheDoseAdministered => 'WAS_THE_DOSE_ADMINISTERED_LABEL';
  String get bednetScanLessThanCount => 'NET_SCANNED_LESS_THAN_COUNT_LABEL';
  String get bednetScanMoreThanCount => 'NET_SCANNED_MORE_THAN_COUNT_LABEL';
  String get patternValidationFailed => 'PATTERN_VALIDATION_FAILED';
  String get couldNotParseTheCode => 'COULD_NOT_PARSE_CODE';
  String get informationBulletOne => 'INFORMATION_BULLET_ONE';
  String get informationBulletTwo => 'INFORMATION_BULLET_TWO';
  String get informationBulletThree => 'INFORMATION_BULLET_THREE';
  String get informationBulletFour => 'INFORMATION_BULLET_FOUR';
  String get scanValidResource => 'SCAN_VALID_RESOURCE';
  String get resourceAlreadyScanned => 'RESOURCES_ALREADY_SCANNED';
}

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
  String get min3CharsRequired => 'MIN_REQUIRED_3';

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
}

class HomeShowcase {
  const HomeShowcase();

  String get distributorProgressBar {
    return 'DISTRIBUTOR_HOME_SHOWCASE_PROGRESS_BAR';
  }

  String get distributorBeneficiaries {
    return 'DISTRIBUTOR_HOME_SHOWCASE_BENEFICIARIES';
  }

  String get distributorFileComplaint {
    return 'DISTRIBUTOR_HOME_SHOWCASE_FILE_COMPLAINT';
  }

  String get beneficiaryReferral {
    return 'HF_HOME_SHOWCASE_BENEFICIARY_LABEL';
  }

  String get manageAttendance {
    return 'HF_HOME_SHOWCASE_MANAGE_ATTENDANCE';
  }

  String get distributorSyncData {
    return 'DISTRIBUTOR_HOME_SHOWCASE_SYNC_DATA';
  }

  String get warehouseManagerManageStock {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_MANAGE_STOCK';
  }

  String get wareHouseManagerStockReconciliation {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_STOCK_RECONCILIATION';
  }

  String get warehouseManagerFileComplaint {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_FILE_COMPLAINT';
  }

  String get warehouseManagerSyncData {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_SYNC_DATA';
  }

  String get supervisorProgressBar {
    return 'SUPERVISOR_HOME_SHOWCASE_PROGRESS_BAR';
  }

  String get supervisorMyChecklist {
    return 'SUPERVISOR_HOME_SHOWCASE_MY_CHECKLIST';
  }

  String get supervisorMySurveyForm {
    return 'SUPERVISOR_HOME_SHOWCASE_MY_CHECKLIST';
  }

  String get supervisorComplaints {
    return 'SUPERVISOR_HOME_SHOWCASE_COMPLAINTS';
  }

  String get supervisorSyncData {
    return 'SUPERVISOR_HOME_SHOWCASE_SYNC_DATA';
  }

  String get wareHouseManagerChecklist {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_CHECKLIST';
  }

  String get inventoryReport {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_INVENTORY_REPORT';
  }

  String get deleteAll {
    return 'WAREHOUSE_MANAGER_HOME_SHOWCASE_DELETE_ALL';
  }

  String get clf {
    return "COMMUNAL_LIVING_FACILITY_SHOWCASE";
  }
}

class PrivacyPolicy {
  const PrivacyPolicy();

  String get acceptText {
    return 'PRIVACY_POLICY_ACCEPT_TEXT';
  }

  String get declineText {
    return 'PRIVACY_POLICY_DECLINE_TEXT';
  }

  String get privacyNoticeText => 'PRIVACY_POLICY_TEXT';
  String get privacyPolicyLinkText => 'PRIVACY_POLICY_LINK_TEXT';
  String get privacyPolicyValidationText => 'PRIVACY_POLICY_VALIDATION_TEXT';
}

class SelectStockShowcase {
  const SelectStockShowcase();

  String get recordStockReceipt {
    return 'SELECT_STOCK_SHOWCASE_RECORD_STOCK_RECEIPT';
  }

  String get recordStockIssued {
    return 'SELECT_STOCK_SHOWCASE_RECORD_STOCK_ISSUED';
  }

  String get recordStockReturned {
    return 'SELECT_STOCK_SHOWCASE_RECORD_STOCK_RETURNED';
  }
}

class WarehouseDetailsShowcase {
  const WarehouseDetailsShowcase();

  String get dateOfReceipt {
    return 'WAREHOUSE_DETAILS_SHOWCASE_DATE_OF_RECEIPT';
  }

  String get administrativeUnit {
    return 'WAREHOUSE_DETAILS_SHOWCASE_ADMINISTRATIVE_UNIT';
  }

  String get warehouseName {
    return 'WAREHOUSE_DETAILS_SHOWCASE_WAREHOUSE_NAME';
  }
}

class StockDetailsReceiptShowcase {
  const StockDetailsReceiptShowcase();

  String get receivedFrom {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_RECEIVED_FROM';
  }

  String get numberOfBednetsReceived {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_NUMBER_OF_BEDNETS_RECEIVED';
  }

  String get packingSlipId {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_PACKING_SLIP_ID';
  }

  String get numberOfNetsIndicatedOnPackingSlip {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_NUMBER_OF_NETS_INDICATED_ON_PACKING_SLIP';
  }

  String get typeOfTransport {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_TYPE_OF_TRANSPORT';
  }

  String get vehicleNumber {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_VEHICLE_NUMBER';
  }

  String get driverName {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_DRIVER_NAME';
  }

  String get comments {
    return 'STOCK_DETAILS_RECEIPT_SHOWCASE_COMMENTS';
  }
}

class StockDetailsIssuedShowcase {
  const StockDetailsIssuedShowcase();

  String get issuedTo {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_ISSUED_TO';
  }

  String get numberOfBednetsIssued {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_NUMBER_OF_BEDNETS_ISSUED';
  }

  String get packingSlipId {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_PACKING_SLIP_ID';
  }

  String get numberOfNetsIndicatedOnPackingSlip {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_NUMBER_OF_NETS_INDICATED_ON_PACKING_SLIP';
  }

  String get typeOfTransport {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_TYPE_OF_TRANSPORT';
  }

  String get vehicleNumber {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_VEHICLE_NUMBER';
  }

  String get driverName {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_DRIVER_NAME';
  }

  String get comments {
    return 'STOCK_DETAILS_ISSUED_SHOWCASE_COMMENTS';
  }

  String get facilitySearchHeaderLabel => 'FACILITY_SEARCH_HEADER_LABEL';

  String get coreCommonDownload => 'CORE_COMMON_DOWNLOAD';
  String get coreCommonDownloadFailed => 'CORE_COMMON_DOWNLOAD_FAILED';
}

class AdverseEvents {
  const AdverseEvents();

  String get adverseEventsLabel => 'ADVERSE_EVENTS_LABEL';

  String get sideEffectsLabel => 'SIDE_EFFECTS_LABEL';

  String get selectSymptomsLabel => 'SELECT_SYMPTOMS_LABEL';

  String get resourceHeaderLabel => 'RESOURCE_HEADER_LABEL';

  String get resourceCountHeaderLabel => 'RESOURCE_COUNT_HEADER_LABEL';

  String get resourcesAdministeredLabel => 'RESOURCES_ADMINISTERED_LABEL';

  String get didYouReAdministerLabel => 'DID_YOU_RE_ADMINISTER';

  String get noOfTimesReAdministered => 'NO_OF_TIMES_RE_ADMINISTERED';
}

class Login {
  const Login();

  String get labelText => 'LOGIN_LABEL_TEXT';

  String get userIdPlaceholder => 'USER_ID_PLACEHOLDER';

  String get passwordPlaceholder => 'PASSWORD_PLACEHOLDER';

  String get actionLabel => 'LOGIN_ACTION_LABEL';
}

class SelectChecklistShowcase {
  const SelectChecklistShowcase();

  String get selectChecklist {
    return 'SELECT_CHECKLIST_SHOWCASE_SELECT_CHECKLIST';
  }
}

class ChecklistDataShowcase {
  const ChecklistDataShowcase();

  String get date {
    return 'CHECKLIST_DATA_SHOWCASE_DATE';
  }

  String get administrativeUnit {
    return 'CHECKLIST_DATA_SHOWCASE_ADMINISTRATIVE_UNIT';
  }
}

class ChecklistListShowcase {
  const ChecklistListShowcase();

  String get open {
    return 'CHECKLIST_LIST_SHOWCASE_OPEN';
  }
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

  String get noChecklistFound => 'NO_CHECKLISTS_FOUND';
}

class ForgotPassword {
  const ForgotPassword();

  String get labelText => 'FORGOT_PASSWORD_LABEL_TEXT';

  String get contentText => 'FORGOT_PASSWORD_CONTENT_TEXT';

  String get primaryActionLabel => 'PRIMARY_ACTION_LABEL';

  String get actionLabel => 'FORGOT_PASSWORD_ACTION_LABEL';
}

class Home {
  const Home();

  String get closedHouseHoldLabel => 'HOME_CLOSE_HOUSEHOLD_LABEL';
  String get beneficiaryLabel => 'HOME_BENEFICIARY_LABEL';

  String get manageStockLabel => 'HOME_MANAGE_STOCK_LABEL';

  String get stockReconciliationLabel => 'HOME_STOCK_RECONCILIATION_LABEL';

  String get viewReportsLabel => 'HOME_VIEW_REPORTS_LABEL';

  String get syncDataLabel => 'HOME_SYNC_DATA_LABEL';

  String get callbackLabel => 'HOME_CALL_BACK_LABEL';

  String get fileComplaint => 'HOME_FILE_COMPLAINT';

  String get progressIndicatorTitle => 'PROGRESS_INDICATOR_TITLE';

  String get progressIndicatorHelp => 'PROGRESS_INDICATOR_HELP';

  String get progressIndicatorPrefixLabel => 'PROGRESS_INDICATOR_PREFIX_LABEL';

  String get dataSyncInfoLabel => 'DATA_SYNC_INFO_LABEL';

  String get dataSyncInfoContent => 'DATA_SYNC_INFO_CONTENT';

  String get myCheckList => 'MY_CHECK_LIST_LABEL';

  String get warehouseManagerCheckList => 'WAREHOUSE_MANAGER_CHECK_LIST_LABEL';

  String get deleteAllLabel => 'HOME_DELETE_ALL_LABEL';
  String get db => 'HOME_DB_LABEL';
  String get beneficiaryReferralLabel => 'HOME_BENEFICIARY_REFERRAL_LABEL';
  String get manageAttendanceLabel => 'HOME_MANAGE_ATTENDANCE_LABEL';
  String get viewSummaryReportsLabel => 'VIEW_SUMMARY_REPORTS_LABEL';

  String get mySurveyForm => 'MY_CHECK_LIST_LABEL';

  String get clfLabel => "HOME_COMMUNAL_LIVING_FACILITIES_LABEL";
  String get beneficiaryDistributionLabel =>
      'HOME_BENEFICIARY_DISTRIBUTION_LABEL';
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

class ProjectSelection {
  const ProjectSelection();

  String get projectDetailsLabelText => 'PROJECT_DETAILS_LABEL';

  String get syncInProgressTitleText => 'SYNC_IN_PROGRESS';

  String get syncCompleteTitleText => 'SYNC_COMPLETE';

  String get syncCompleteButtonText => 'CLOSE';

  String get syncFailedTitleText => 'SYNC_FAILED';

  String get retryButtonText => 'RETRY';

  String get dismissButtonText => 'DISMISS';

  String get noProjectsAssigned => 'NO_PROJECTS_ASSIGNED';

  String get contactSysAdmin => 'CONTACT_SYS_ADMIN';

  String get onProjectMapped => 'NO_PROJECT_MAPPED';
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

  String get supervisorContactNumberMinLength =>
      'COMPLAINTS_SUPERVISOR_NUMBER_MIN_LENGTH';
}

class SyncDialog {
  const SyncDialog();

  String get syncFailedTitle => 'SYNC_DIALOG_SYNC_FAILED_TITLE';

  String get downSyncFailedTitle => 'SYNC_DIALOG_DOWN_SYNC_FAILED_TITLE';

  String get upSyncFailedTitle => 'SYNC_DIALOG_UP_SYNC_FAILED_TITLE';

  String get syncInProgressTitle => 'SYNC_DIALOG_SYNC_IN_PROGRESS_TITLE';

  String get dataSyncedTitle => 'SYNC_DIALOG_DATA_SYNCED_TITLE';

  String get closeButtonLabel => 'SYNC_DIALOG_CLOSE_BUTTON_LABEL';

  String get retryButtonLabel => 'SYNC_DIALOG_RETRY_BUTTON_LABEL';
  String get pendingSyncLabel => 'PENDING_SYNC_LABEL';
  String get pendingSyncContent => 'PENDING_SYNC_CONTENT';
}

class StockReconciliationShowcase {
  const StockReconciliationShowcase();

  String get warehouseName {
    return 'STOCK_RECONCILIATION_SHOWCASE_WAREHOUSE_NAME';
  }

  String get dateOfReconciliation {
    return 'STOCK_RECONCILIATION_SHOWCASE_DATE_OF_RECONCILIATION';
  }

  String get stockReceived {
    return 'STOCK_RECONCILIATION_SHOWCASE_STOCK_RECEIVED';
  }

  String get stockIssued {
    return 'STOCK_RECONCILIATION_SHOWCASE_STOCK_ISSUED';
  }

  String get stockReturned {
    return 'STOCK_RECONCILIATION_SHOWCASE_STOCK_RETURNED';
  }

  String get stockOnHand {
    return 'STOCK_RECONCILIATION_SHOWCASE_STOCK_ON_HAND';
  }

  String get manualStockCount {
    return 'STOCK_RECONCILIATION_SHOWCASE_MANUAL_STOCK_COUNT';
  }

  String get comments {
    return 'STOCK_RECONCILIATION_SHOWCASE_COMMENTS';
  }
}

class InventoryReportDetails {
  const InventoryReportDetails();

  String get dateLabel {
    return 'INVENTORY_REPORT_DETAILS_DATE_LABEL';
  }

  String get householdRegisteredLabel {
    return 'ENUMERATION_SUMMARY_HOUSEHOLD_REGISTERED_LABEL';
  }

  String get projectBeneficiaryRegisteredLabel {
    return 'ENUMERATION_SUMMARY_PROJECT_BENEFICIARY_REGISTERED_LABEL';
  }

  String get closedHouseholdRegisteredLabel {
    return 'ENUMERATION_SUMMARY_CLOSED_HOUSEHOLD_REGISTERED_LABEL';
  }

  String get closedHouseholdRegisteredAbsentLabel {
    return 'ENUMERATION_SUMMARY_CLOSED_HOUSEHOLD_REGISTERED_ABSENT_LABEL';
  }

  String get closedHouseholdRegisteredRefusedLabel {
    return 'ENUMERATION_SUMMARY_CLOSED_HOUSEHOLD_REGISTERED_REFUSED_LABEL';
  }

  String get householdDistributedLabel {
    return 'DISTRIBUTION_SUMMARY_HOUSEHOLD_DISTRIBUTED_LABEL';
  }

  String get projectBeneficiaryImpactedLabel {
    return 'DISTRIBUTION_SUMMARY_PROJECT_BENEFICIARY_IMPACTED_LABEL';
  }

  String get bednetDistributedLabel {
    return 'DISTRIBUTION_SUMMARY_BEDNET_DISTRIBUTED_LABEL';
  }
}

class StockDetailsReturnedShowcase {
  const StockDetailsReturnedShowcase();

  String get returnedFrom {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_RETURNED_FROM';
  }

  String get numberOfBednetsReturned {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_NUMBER_OF_BEDNETS_RETURNED';
  }

  String get packingSlipId {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_PACKING_SLIP_ID';
  }

  String get numberOfNetsIndicatedOnPackingSlip {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_NUMBER_OF_NETS_INDICATED_ON_PACKING_SLIP';
  }

  String get typeOfTransport {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_TYPE_OF_TRANSPORT';
  }

  String get vehicleNumber {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_VEHICLE_NUMBER';
  }

  String get driverName {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_DRIVER_NAME';
  }

  String get comments {
    return 'STOCK_DETAILS_RETURNED_SHOWCASE_COMMENT';
  }
}

class HouseholdLocationShowcase {
  const HouseholdLocationShowcase();

  String get administrativeArea {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_ADMINISTRATIVE_AREA';
  }

  String get landmark {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_LANDMARK';
  }

  String get address {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_ADDRESS';
  }

  String get postalCode {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_POSTAL_CODE';
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

  String get refugeeCampLabel => 'REFUGEE_CAMP_LABEL';
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

class IndividualDetails {
  const IndividualDetails();

  String get individualsDetailsLabelText => 'INDIVIDUAL_LABEL_TEXT';

  String get nationalIdCardNumberLabelText =>
      'NATIONAL_ID_CARD_NUMBER_LABEL_TEXT';

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
  String get scanVoucherAndLinkToIndividual =>
      'SCAN_AND_LINK_VOUCHER_TO_INDIVIDUAL';

  String get individualNameValidation => "VALID_INDIVIDUAL_NAME";

  String get voucherCodeScanMoreThanLimit =>
      "VOUCHER_CODE_SCAN_MORE_THAN_LIMIT";
  String get headAgeValidError => 'HEAD_VALID_AGE_ERROR_MESSAGE';
}

class StockDetails {
  const StockDetails();

  /// Quantity sent/received/lost/damaged label
  String get quantityReceivedLabel => 'STOCK_DETAILS_QUANTITY_RECEIVED';

  String get quantitySentLabel => 'STOCK_DETAILS_QUANTITY_SENT';

  String get quantityReturnedLabel => 'STOCK_DETAILS_QUANTITY_RETURNED';

  String get quantityLostLabel => 'STOCK_DETAILS_QUANTITY_LOST';

  String get quantityGainedLabel => 'STOCK_DETAILS_QUANTITY_GAINED';

  String get quantityDamagedLabel => 'STOCK_DETAILS_QUANTITY_DAMAGED';

  String get balesReceivedCountLabel => 'STOCK_DETAILS_BALES_RECEIVED';

  String get balesSentCountLabel => 'STOCK_DETAILS_BALES_SENT';

  String get balesReturnedCountLabel => 'STOCK_DETAILS_BALES_RETURNED';

  String get balesLostCountLabel => 'STOCK_DETAILS_BALES_LOST';

  String get balesGainedCountLabel => 'STOCK_DETAILS_BALES_GAINED';

  String get balesDamagedCountLabel => 'STOCK_DETAILS_BALES_DAMAGED';
  String get balesQuantityRequiredError => 'BALES_QUANTITY_REQUIRED_ERROR';
  String get looseQuantityLabel => 'STOCK_DETAILS_LOOSE_QUANTITY_LABEL';

  // comments
  String get manualScanCommentsLabel =>
      'STOCK_DETAILS_MANUAL_SCAN_COMMENTS_LABEL';

  String get baleMismatchCommentsLabel =>
      'STOCK_DETAILS_BALE_MISMATCH_COMMENTS_LABEL';

  String get baleMismatchCommentRequired => 'BALE_MISMATCH_COMMENT_REQUIRED';

  String get manualScanCommentRequired => 'MANUAL_SCAN_COMMENT_REQUIRED';

  String get reconciliationCommentRequired => 'RECONCILIATION_COMMENT_REQUIRED';

  String get countDialogTitle => 'STOCK_DETAILS_COUNT_DIALOG_TITLE';
  String get countContent => 'STOCK_DETAILS_COUNT_DIALOG_CONTENT';
  String get countDialogSuccess =>
      'STOCK_DETAILS_COUNT_DIALOG_SUCCESS_ACTION_LABEL';

  String get countDialogCancel =>
      'STOCK_DETAILS_COUNT_DIALOG_CANCEL_ACTION_LABEL';
}

class BeneficiaryDetails {
  const BeneficiaryDetails();

  String get numberOfNets => 'NUMBER_OF_NETS';
  String get dustributionSiteName => 'DISTRIBUTION_SITE_NAME';

  String get beneficiarysDetailsLabelText => 'BENEFICIARY_DETAILS_LABEL_TEXT';
  String get beneficiarysDetailsEditIconLabelText =>
      'BENEFICIARY_DETAILS_EDIT_ICON_LABEL_TEXT';
  String get beneficiarysDetailsEditIconLabel =>
      'BENEFICIARY_DETAILS_EDIT_ICON_LABEL';
  String get beneficiarysDetailsDeleteIconLabel =>
      'BENEFICIARY_DETAILS_DELETE_ICON_LABEL';
  String get resourcesTobeDelivered => 'RESOURCES_TO_BE_DELIVERED';
  String get resourcesTobeProvided => 'RESOURCES_TO_BE_PROVIDED';

  String get beneficiaryAge => 'BENEFICIARY_AGE';
  String get ctaProceed => 'PROCEED';
  String get beneficiaryDoseNo => 'BENEFICIARY_DETAILS_DOSE_NO';
  String get beneficiaryDose => 'BENEFICIARY_DETAILS_DOSE';
  String get beneficiaryStatus => 'BENEFICIARY_DETAILS_STATUS';
  String get beneficiaryResources => 'BENEFICIARY_DETAILS_RESOURCES';
  String get beneficiaryQuantity => 'BENEFICIARY_DETAILS_QUANTITY';
  String get beneficiaryCompletedOn => 'BENEFICIARY_DETAILS_COMPLETED_ON';
  String get beneficiaryDeliveryStrategy =>
      'BENEFICIARY_DETAILS_DELIVERY_STRATEGY';
  String get beneficiaryCycle => 'BENEFICIARY_DETAILS_CYCLE';
  String get currentCycleLabel => 'BENEFICIARY_DETAILS_CURRENT_CYCLE_LABEL';
  String get fromCurrentLocation => 'FROM_CURRENT_LOCATION';
  String get unableToScan => 'UNABLE_TO_SCAN';

  String get scanValidResource => 'SCAN_VALID_RESOURCE';

  String get scannedResourceCountMisMatch => 'SCANNED_RESOURCE_COUNT_MISMATCH';

  String get resourceAlreadyScanned => 'RESOURCE_ALREADY_SCANNED';

  String get scannerLabel => 'SCANNER_LABEL';

  String get noOfResourceScanned => 'NO_OF_RESOURCE_SCANNED';

  String get resourcesScanned => 'RESOURCES_SCANNED';

  String get saveScannedResource => 'SAVE_SCANNED_RESOURCE';

  String get flashOn => 'FLASH_ON';

  String get flashOff => 'FLASH_OFF';

  String get scannerDialogTitle => 'SCANNER_DIALOG_TITLE';

  String get scannerDialogContent => 'SCANNER_DIALOG_CONTENT';

  String get scannerDialogPrimaryAction => 'SCANNER_DIALOG_PRIMARY_ACTION';

  String get scannerDialogSecondaryAction => 'SCANNER_DIALOG_SECONDARY_ACTION';
  String get beneficiaryHeader => 'BENEFICIARY_HEADER';
  String get deliveryHeader => 'DELIVERY_TABLE_HEADER';

  String get proceedWithoutDownloading => 'PROCEED_WITHOUT_DOWNLOADING';
  String get unableToCheckDataInServer => 'FAILED_TO_CHECK_DATA_IN_SERVER';
  String get dataFound => 'DATA_FOUND';
  String get noDataFound => 'NO_DATA_FOUND';
  String get dataFoundContent => 'DATA_FOUND_CONTENT';
  String get noDataFoundContent => 'NO_DATA_FOUND_CONTENT';
  String get dataDownloadInProgress => 'DATA_DOWNLOAD_IN_PROGRESS';
  String get insufficientStorage => 'INSUFFICIENT_STORAGE_WARNING';
  String get downloadreport => 'DOWNLOAD_REPORT';
  String get boundary => 'BOUNDARY';
  String get status => 'STATUS';
  String get downloadedon => 'DOWNLOADED_ON';
  String get recordsdownload => 'RECORDS_DOWNLOAD';
  String get downloadcompleted => 'DOWNLOAD_COMPLETED';
  String get datadownloadreport => 'DATA_DOWNLOAD_REPORT';
  String get download => 'DOWNLOAD';
  String get partialdownloaded => 'PARTIAL_DOWNLOAD';
  String get downloadtime => 'DOWNLOAD_TIME';
  String get totalrecorddownload => 'TOTAL_RECORD_DOWNLOAD';
  String get insufficientStorageContent =>
      'INSUFFICIENT_STORAGE_WARNING_CONTENT';
  String get recordCycle => 'BENEFICIARY_DETAILS_RECORD_CYCLE';
  String get reasonLabelText => 'REASON_LABEL_TEXT';
}
