const warehouseDetails = WarehouseDetails();
const stockDetails = StockDetails();
const stockReconciliationDetails = StockReconciliationDetails();
const manageStock = ManageStock();
const reasonForDeletion = ReasonForDeletion();
const inventoryReportSelection = InventoryReportSelection();
const inventoryReportDetails = InventoryReportDetails();
const individualDetails = IndividualDetails();
const householdDetails = HouseHoldDetails();
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

  String get tableHeaderName => 'TABLE_HEADER_NAME';

  String get tableHeaderAttendance => 'TABLE_HEADER_ATTENDANCE';

  String get tableHeaderUserId => 'TABLE_HEADER_USERID';

  String get markAttendanceLabel => "LABEL_MARK_ATTENDANCE";

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

  String get transactionDetailsLabel => 'TRANSACTION_DETAILS_LABEL';

  /// Select Product label
  String get selectProductLabel => 'STOCK_DETAILS_SELECT_PRODUCT';

  /// Select Transacting party label
  String get selectTransactingPartyReceived => 'STOCK_DETAILS_RECEIVED_FROM';

  String get selectTransactingPartyIssued => 'STOCK_DETAILS_ISSUED_TO';

  String get selectTransactingPartyReturned => 'STOCK_DETAILS_RETURNED_TO';

  String get teamCodeRequired => 'STOCK_DETAILS_TEAM_CODE_IS_REQUIRED';

  String get facilityRequired => 'STOCK_DETAILS_FACILITY_IS_REQUIRED';

  String get selectTransactingPartyReceivedFromDamaged {
    return 'STOCK_DETAILS_RECEIVED_FROM_DAMAGED';
  }

  String get senderReceiverValidation =>
      'STOCK_DETAILS_SENDER_RECEIVER_ID_VALIDATION';

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

  String get stockLabel => 'STOCK_LABEL';

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

  String get noProjectSelected => 'NO_PROJECT_SELECTED';

  String get fieldRequired => 'STOCK_RECONCILIATION_FILED_REQUIRED';

  String get teamCodeLabel => 'STOCK_TEAM_CODE_LABEL';
}

class ManageStock {
  const ManageStock();

  String get label => 'MANAGE_STOCK_LABEL';

  String get recordStockReceiptLabel =>
      'MANAGE_STOCK_RECORDSTOCK_RECEIPT_LABEL';

  String get recordStockReceiptDescription =>
      'MANAGE_STOCK_RECEIPT_DESCRIPTION';

  String get recordStockIssuedLabel => 'MANAGE_STOCK_RECORDSTOCK_ISSUED_LABEL';

  String get recordStockIssuedDescription =>
      'MANAGE_STOCK_RECORDSTOCK_ISSUED_DESCRIPTION';

  String get recordStockReturnedLabel =>
      'MANAGE_STOCK_RECORDSTOCK_RETURNED_LABEL';

  String get recordStockReturnedDescription =>
      'MANAGE_STOCK_RECORDSTOCK_RETURNED_DESCRIPTION';

  String get recordStockDamagedLabel =>
      'MANAGE_STOCK_RECORDSTOCK_DAMAGED_LABEL';

  String get recordStockDamagedDescription =>
      'MANAGE_STOCK_RECORDSTOCK_DAMAGED_DESCRIPTION';

  String get recordStockLossLabel => 'MANAGE_STOCK_RECORDSTOCK_LOSS_LABEL';

  String get recordStockLossDescription =>
      'MANAGE_STOCK_RECORDSTOCK_LOSS_DESCRIPTION';
}

class ReasonForDeletion {
  const ReasonForDeletion();

  String get reasonForDeletionLabel => 'REASON_FOR_DELETION_LABEL';
}

class InventoryReportSelection {
  const InventoryReportSelection();

  String get label {
    return 'INVENTORY_REPORT_SELECTION_LABEL';
  }

  String get inventoryReportReceiptLabel {
    return 'INVENTORY_REPORT_SELECTION_RECEIPT_LABEL';
  }

  String get inventoryReportReceiptDescription {
    return 'INVENTORY_REPORT_SELECTION_RECEIPT_DESCRIPTION';
  }

  String get inventoryReportIssuedLabel {
    return 'INVENTORY_REPORT_SELECTION_ISSUED_LABEL';
  }

  String get inventoryReportIssuedDescription {
    return 'INVENTORY_REPORT_SELECTION_ISSUED_DESCRIPTION';
  }

  String get inventoryReportReturnedLabel {
    return 'INVENTORY_REPORT_SELECTION_RETURNED_LABEL';
  }

  String get inventoryReportReturnedDescription {
    return 'INVENTORY_REPORT_SELECTION_RETURNED_DESCRIPTION';
  }

  String get inventoryReportDamagedLabel {
    return 'INVENTORY_REPORT_SELECTION_DAMAGE_LABEL';
  }

  String get inventoryReportDamagedDescription {
    return 'INVENTORY_REPORT_SELECTION_DAMAGE_DESCRIPTION';
  }

  String get inventoryReportLossLabel {
    return 'INVENTORY_REPORT_SELECTION_LOSS_LABEL';
  }

  String get inventoryReportLossDescription {
    return 'INVENTORY_REPORT_SELECTION_LOSS_DESCRIPTION';
  }

  String get inventoryReportReconciliationLabel {
    return 'INVENTORY_REPORT_SELECTION_RECONCILIATION_LABEL';
  }

  String get inventoryReportReconciliationDescription {
    return 'INVENTORY_REPORT_SELECTION_RECONCILIATION_DESCRIPTION';
  }
}

class InventoryReportDetails {
  const InventoryReportDetails();

  String get backToHomeButtonLabel {
    return 'INVENTORY_REPORT_DETAILS_BACK_TO_HOME_BUTTON_LABEL';
  }

  String get receiptReportTitle {
    return 'INVENTORY_REPORT_DETAILS_RECEIPT_REPORT_TITLE';
  }

  String get dispatchReportTitle {
    return 'INVENTORY_REPORT_DETAILS_DISPATCH_REPORT_TITLE';
  }

  String get returnedReportTitle {
    return 'INVENTORY_REPORT_DETAILS_RETURNED_REPORT_TITLE';
  }

  String get damageReportTitle {
    return 'INVENTORY_REPORT_DETAILS_DAMAGE_REPORT_TITLE';
  }

  String get lossReportTitle {
    return 'INVENTORY_REPORT_DETAILS_LOSS_REPORT_TITLE';
  }

  String get reconciliationReportTitle {
    return 'INVENTORY_REPORT_DETAILS_RECONCILIATION_REPORT_TITLE';
  }

  String get dateLabel {
    return 'INVENTORY_REPORT_DETAILS_DATE_LABEL';
  }

  String get waybillLabel {
    return 'INVENTORY_REPORT_DETAILS_WAYBILL_LABEL';
  }

  String get receiptQuantityLabel {
    return 'INVENTORY_REPORT_DETAILS_RECEIPT_QUANTITY_LABEL';
  }

  String get dispatchQuantityLabel {
    return 'INVENTORY_REPORT_DETAILS_DISPATCH_QUANTITY_LABEL';
  }

  String get returnedQuantityLabel {
    return 'INVENTORY_REPORT_DETAILS_RETURNED_QUANTITY_LABEL';
  }

  String get damagedQuantityLabel {
    return 'INVENTORY_REPORT_DETAILS_DAMAGED_QUANTITY_LABEL';
  }

  String get lossQuantityLabel {
    return 'INVENTORY_REPORT_DETAILS_LOSS_QUANTITY_LABEL';
  }

  String get receiptTransactingPartyLabel {
    return 'INVENTORY_REPORT_DETAILS_RECEIPT_TRANSACTING_PARTY_LABEL';
  }

  String get dispatchTransactingPartyLabel {
    return 'INVENTORY_REPORT_DETAILS_DISPATCH_TRANSACTING_PARTY_LABEL';
  }

  String get returnedTransactingPartyLabel {
    return 'INVENTORY_REPORT_DETAILS_RETURNED_TRANSACTING_PARTY_LABEL';
  }

  String get damagedTransactingPartyLabel {
    return 'INVENTORY_REPORT_DETAILS_DAMAGED_TRANSACTING_PARTY_LABEL';
  }

  String get lossTransactingPartyLabel {
    return 'INVENTORY_REPORT_DETAILS_LOSS_TRANSACTING_PARTY_LABEL';
  }

  String get stockInHandLabel {
    return 'INVENTORY_REPORT_DETAILS_STOCK_IN_HAND_LABEL';
  }

  String get manualCountLabel {
    return 'INVENTORY_REPORT_DETAILS_MANUAL_COUNT_LABEL';
  }

  String get receivedCountLabel {
    return 'INVENTORY_REPORT_DETAILS_RECEIVED_COUNT_LABEL';
  }

  String get dispatchedCountLabel {
    return 'INVENTORY_REPORT_DETAILS_DISPATCHED_COUNT_LABEL';
  }

  String get returnedCountLabel {
    return 'INVENTORY_REPORT_DETAILS_RETURNED_COUNT_LABEL';
  }

  String get damagedCountLabel {
    return 'INVENTORY_REPORT_DETAILS_DAMAGED_COUNT_LABEL';
  }

  String get lostCountLabel {
    return 'INVENTORY_REPORT_DETAILS_LOST_COUNT_LABEL';
  }

  String get noRecordsMessage {
    return 'INVENTORY_REPORT_DETAILS_NO_RECORDS_MESSAGE';
  }

  String get noFilterMessage {
    return 'INVENTORY_REPORT_DETAILS_NO_FILTER_MESSAGE';
  }
}

class IndividualDetails {
  const IndividualDetails();

  String get nameLabelText => 'INDIVIDUAL_NAME_LABEL_TEXT';
}

class HouseHoldDetails {
  const HouseHoldDetails();

  String get actionLabel => 'HOUSEHOLD_ACTION_LABEL';
}
