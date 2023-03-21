library i18;

const common = Common();
const login = Login();
const forgotPassword = ForgotPassword();
const home = Home();
const searchBeneficiary = SearchBeneficiary();
const householdLocation = HouseholdLocation();
const acknowledgementSuccess = AcknowledgementSuccess();
const householdDetails = HouseholdDetails();
const individualDetails = IndividualDetails();
const householdOverView = HouseholdOverView();
const memberCard = MemberCard();
const deliverIntervention = DeliverIntervention();
const projectSelection = ProjectSelection();
const warehouseDetails = WarehouseDetails();
const stockDetails = StockDetails();
const checklist = Checklist();
const stockReconciliationDetails = StockReconciliationDetails();

class Common {
  const Common();

  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';

  String get coreCommonAge => 'CORE_COMMON_AGE';

  String get coreCommonGender => 'CORE_COMMON_GENDER';

  String get coreCommonMobileNumber => 'CORE_COMMON_MOBILE_NUMBER';

  String get coreCommonSubmit => 'CORE_COMMON_SUBMIT';

  String get coreCommonSave => 'CORE_COMMON_SAVE';

  String get coreCommonCancel => 'CORE_COMMON_CANCEL';

  String get corecommonRequired => 'CORE_COMMON_REQUIRED';

  String get corecommonclose => 'CORE_COMMON_CLOSE';

  String get coreCommonOk => 'CORE_COMMON_OK';

  String get coreCommonLogout => 'CORE_COMMON_LOGOUT';
}

class Login {
  const Login();

  String get labelText => 'LOGIN_LABEL_TEXT';

  String get userIdPlaceholder => 'USER_ID_PLACEHOLDER';

  String get passwordPlaceholder => 'PASSWORD_PLACEHOLDER';

  String get actionLabel => 'LOGIN_ACTION_LABEL';
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

  String get beneficiaryLabel => 'HOME_BENEFICIARY_LABEL';

  String get manageStockLabel => 'HOME_MANAGE_STOCK_LABEL';

  String get stockReconciliationLabel => 'HOME_STOCK_RECONCILIATION_LABEL';

  String get viewReportsLabel => 'HOME_VIEW_REPORTS_LABEL';

  String get syncDataLabel => 'HOME_SYNC_DATA_LABEL';

  String get callbackLabel => 'HOME_CALL_BACK_LABEL';

  String get fileComplaint => 'HOME_FILE_COMPLAINT';

  String get progressIndicatorTitle => 'PROGRESS_INDICATOR_TITLE';

  String get progressIndicatorPrefixLabel => 'PROGRESS_INDICATOR_PREFIX_LABEL';

  String get dataSyncInfoLabel => 'DATA_SYNC_INFO_LABEL';

  String get dataSyncInfoContent => 'DATA_SYNC_INFO_CONTENT';

  String get myCheckList => 'MY_CHECK_LIST_LABEL';
}

class SearchBeneficiary {
  const SearchBeneficiary();

  String get statisticsLabelText => 'BENEFICIARY_STATISTICS_LABEL_TEXT';

  String get noOfHouseholdsRegistered => 'NO_OF_HOUSEHOLDS_REGISTERED';

  String get noOfResourcesDelivered => 'NO_OF_RESOURCES_DELIVERED';

  String get beneficiarySearchHintText => 'BENEFICIARY_SEARCH_HINT_TEXT';

  String get beneficiaryInfoDescription => 'BENEFICIARY_INFO_DESCRIPTION';

  String get beneficiaryInfoTitle => 'BENEFICIARY_INFO_TITLE';

  String get beneficiaryAddActionLabel => 'BENEFICIARY_ADD_ACTION_LABEL';

  String get iconLabel => 'ICON_LABEL';
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

  String get mobileNumberLabelText => 'MOBILE_NUMBER_LABEL_TEXT';

  String get submitButtonLabelText => 'INDIVIDUAL_DETAILS_SUBMIT';

  String get mobileNumberInvalidFormatValidationMessage =>
      'INDIVIDUAL_DETAILS_INVALID_MOBILE_NUMBER';
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

class AcknowledgementSuccess {
  const AcknowledgementSuccess();

  String get actionLabelText => 'ACKNOWLEDGEMENT_SUCCESS_ACTION_LABEL_TEXT';

  String get acknowledgementDescriptionText =>
      'ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT';

  String get acknowledgementLabelText => 'ACKNOWLEDGEMENT_SUCCESS_LABEL_TEXT';
}

class HouseholdDetails {
  const HouseholdDetails();

  String get householdDetailsLabel => 'HOUSEHOLD_DETAILS_LABEL';

  String get actionLabel => 'HOUSEHOLD_ACTION_LABEL';

  String get dateOfRegistrationLabel =>
      'HOUSEHOLD_DETAILS_DATE_OF_REGISTRATION_LABEL';

  String get noOfMembersCountLabel => 'NO_OF_MEMBERS_COUNT_LABEL';
}

class HouseholdOverView {
  const HouseholdOverView();

  String get householdOverViewLabel => 'HOUSEHOLD_OVER_VIEW_LABEL';

  String get householdOverViewEditLabel =>
      'HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL';

  String get householdOverViewDeleteLabel =>
      'HOUSEHOLD_OVER_VIEW_DELETE_ICON_LABEL';

  String get householdOverViewEditIconText =>
      'HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL_TEXT';

  String get householdOverViewActionCardTitle =>
      'HOUSEHOLD_OVER_VIEW_ACTION_CARD_TITLE';

  String get householdOverViewPrimaryActionLabel =>
      'HOUSEHOLD_OVER_VIEW_PRIMARY_ACTION_LABEL';

  String get householdOverViewSecondaryActionLabel =>
      'HOUSEHOLD_OVER_VIEW_SECONDARY_ACTION_LABEL';

  String get householdOverViewDeliveredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_DELIVERED_ICON_LABEL';

  String get householdOverViewNotDeliveredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_NOT_DELIVERED_ICON_LABEL';

  String get householdOverViewHouseholdHeadLabel =>
      'HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_LABEL';

  String get householdOverViewHouseholdHeadNameLabel =>
      'HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_NAME_LABEL';

  String get householdOverViewActionText => 'HOUSEHOLD_OVER_VIEW_ACTION_TEXT';

  String get householdOverViewAddActionText =>
      'HOUSEHOLD_OVER_VIEW__ADD_ACTION_TEXT';
}

class MemberCard {
  const MemberCard();

  String get assignAsHouseholdhead => 'MEMBER_CARD_ASSIGN_AS_HEAD';

  String get editIndividualDetails => 'MEMBER_CARD_EDIT_INDIVIDUAL_DETAILS';

  String get deleteIndividualActionText =>
      'MEMBER_CARD_DELETE_INDIVIDUAL_ACTION_TEXT';

  String get deliverInterventionSubmitLabel =>
      'MEMBER_CARD_DELIVER_INTERVENTION_SUBMIT_LABEL';

  String get deliverDetailsUpdateLabel =>
      'MEMBER_CARD_DELIVER_DETAILS_UPDATE_LABEL';

  String get deliverDetailsYearText => 'MEMBER_CARD_DELIVER_DETAILS_YEAR_TEXT';

  String get editDetails => 'MEMBER_CARD_EDIT_DETAILS';
}

class DeliverIntervention {
  const DeliverIntervention();

  String get deliverInterventionLabel => 'DELIVER_INTERVENTION_LABEL';

  String get dateOfRegistrationLabel =>
      'DELIVER_INTERVENTION_DATE_OF_REGISTRATION_LABEL';

  String get resourceDeliveredLabel =>
      'DELIVER_INTERVENTION_RESOURCE_DELIVERED_LABEL';

  String get quantityDistributedLabel =>
      'DELIVER_INTERVENTION_QUANTITY_DISTRIBUTED_LABEL';

  String get deliveryCommentLabel =>
      'DELIVER_INTERVENTION_DELIVERY_COMMENT_LABEL';

  String get idTypeText => 'DELIVER_INTERVENTION_ID_TYPE_TEXT';

  String get idNumberText => 'DELIVER_INTERVENTION_ID_NUMBER_TEXT';

  String get memberCountText => 'DELIVER_INTERVENTION_MEMBER_COUNT_TEXT';

  String get noOfResourcesForDelivery =>
      'DELIVER_INTERVENTION_NO_OF_RESOURCES_FOR_DELIVERY';

  String get dialogTitle => 'DELIVER_INTERVENTION_DIALOG_TITLE';

  String get dialogContent => 'DELIVER_INTERVENTION_DIALOG_CONTENT';
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
}

class WarehouseDetails {
  const WarehouseDetails();

  String get warehouseDetailsLabel => 'WAREHOUSE_DETAILS_LABEL';

  String get dateOfReceipt => 'WAREHOUSE_DETAILS_DATE_OF_RECEIPT';

  String get administrativeUnit => 'WAREHOUSE_DETAILS_ADMINISTRATIVE_UNIT';

  String get warehouseNameId => 'WAREHOSUE_DETAILS_WAREHOUSE_NAME_ID';
}

class StockDetails {
  const StockDetails();

  /// Page Title Keys
  String get receivedPageTitle => 'RECEIVED_STOCK_DETAILS';

  String get issuedPageTitle => 'ISSUED_STOCK_DETAILS';

  String get returnedPageTitle => 'RETURNED_STOCK_DETAILS';

  String get lostPageTitle => 'LOST_STOCK_DETAILS';

  String get damagedPageTitle => 'DAMAGED_STOCK_DETAILS';

  /// Select Product label
  String get selectProductLabel => 'STOCK_DETAILS_SELECT_PRODUCT';

  /// Select Transacting party label
  String get selectTransactingPartyReceived => 'STOCK_DETAILS_RECEIVED_FROM';

  String get selectTransactingPartyIssued => 'STOCK_DETAILS_ISSUED_TO';

  String get selectTransactingPartyReturned => 'STOCK_DETAILS_RETURNED_TO';

  String get selectTransactingPartyReceivedFromDamaged {
    return 'STOCK_DETAILS_RECEIVED_FROM_DAMAGED';
  }

  String get selectTransactingPartyReceivedFromLost {
    return 'STOCK_DETAILS_RECEIVED_FROM_LOST';
  }

  /// Quantity sent/received/lost/damaged label
  String get quantityReceivedLabel => 'STOCK_DETAILS_QUANTITY_RECEIVED';

  String get quantitySentLabel => 'STOCK_DETAILS_QUANTITY_SENT';

  String get quantityReturnedLabel => 'STOCK_DETAILS_QUANTITY_RETURNED';

  String get quantityLostLabel => 'STOCK_DETAILS_QUANTITY_LOST';

  String get quantityDamagedLabel => 'STOCK_DETAILS_QUANTITY_DAMAGED';

  /// Waybill number label
  String get waybillNumberLabel => 'STOCK_DETAILS_WAYBILL_NUMBER';

  /// Number of product indicated on waybill title
  String get quantityOfProductIndicatedOnWaybillLabel {
    return 'STOCK_DETAILS_WAYBILL_QUANTITY';
  }

  /// Lost/Damaged during label
  String get transactionReasonLost => 'STOCK_DETAILS_LOST_DURING';

  String get transactionReasonDamaged => 'STOCK_DETAILS_DAMAGED_DURING';

  String get vehicleNumberLabel => 'STOCK_DETAILS_VEHICLE_NUMBER';

  String get commentsLabel => 'STOCK_DETAILS_COMMENTS_LABEL';

  String get dialogTitle => 'STOCK_DETAILS_DIALOG_TITLE';

  String get dialogContent => 'STOCK_DETAILS_DIALOG_CONTENT';

  String get transportTypeLabel => 'STOCK_DETAILS_TRANSPORT_TYPE';
}

class StockReconciliationDetails {
  const StockReconciliationDetails();

  String get reconciliationPageTitle => 'STOCK_RECONCILIATION_PAGE_TITLE';

  String get facilityLabel => 'STOCK_RECONCILIATION_FACILITY_LABEL';

  String get productLabel => 'STOCK_RECONCILIATION_PRODUCT_LABEL';

  String get dateOfReconciliation => 'STOCK_RECONCILIATION_DATE';

  String get stockReceived => 'STOCK_RECONCILIATION_STOCK_RECEIVED';

  String get stockIssued => 'STOCK_RECONCILIATION_STOCK_ISSUED';

  String get stockReturned => 'STOCK_RECONCILIATION_STOCK_RETURNED';

  String get stockLost => 'STOCK_RECONCILIATION_STOCK_LOST';

  String get stockDamaged => 'STOCK_RECONCILIATION_STOCK_DAMAGED';

  String get stockOnHand => 'STOCK_RECONCILIATION_STOCK_ON_HAND';

  String get manualCountLabel =>
      'STOCK_RECONCILIATION_MANUAL_STOCK_COUNT_LABEL';

  String get commentsLabel => 'STOCK_RECONCILIATION_COMMENTS_LABEL';

  String get infoCardTitle => 'STOCK_RECONCILIATION_INFO_CARD_TITLE';

  String get infoCardContent => 'STOCK_RECONCILIATION_INFO_CARD_CONTENT';

  String get dialogTitle => 'STOCK_RECONCILIATION_DIALOG_TITLE';

  String get dialogContent => 'STOCK_RECONCILIATION_DIALOG_CONTENT';

  String get manualCountRequiredError =>
      'STOCK_RECONCILIATION_COUNT_IS_REQUIRED';

  String get manualCountInvalidType =>
      'STOCK_RECONCILIATION_COUNT_EXPECTS_NUMBER';

  String get manualCountMinError => 'STOCK_RECONCILIATION_COUNT_BELOW_MIN';

  String get manualCountMaxError => 'STOCK_RECONCILIATION_COUNT_EXCEEDED_MAX';
}
