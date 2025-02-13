const common = Common();
const searchBeneficiary = SearchBeneficiary();
const beneficiaryDetails = BeneficiaryDetails();
const householdLocation = HouseholdLocation();
const acknowledgementSuccess = AcknowledgementSuccess();
const householdDetails = HouseholdDetails();
const individualDetails = IndividualDetails();
const householdOverView = HouseholdOverView();
const memberCard = MemberCard();
const deliverIntervention = DeliverIntervention();
const referBeneficiary = ReferBeneficiary();
const adverseEvents = AdverseEvents();
const reasonForDeletion = ReasonForDeletion();
const searchBeneficiariesShowcase = SearchBeneficiariesShowcase();
const householdLocationShowcase = HouseholdLocationShowcase();
const householdDetailsShowcase = HouseholdDetailsShowcase();
const individualDetailsShowcase = IndividualDetailsShowcase();
const householdOverviewShowcase = HouseholdOverviewShowcase();
const deliverInterventionShowcase = DeliverInterventionShowcase();
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

  String get min3CharsRequired => 'MIN_3_CHARS_REQUIRED';

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

  String get locationCaptured => 'LOCATION_CAPTURED';

  String get coreCommonSummaryDetails => 'CORE_COMMON_SUMMARY_DETAILS';

  String get metersNear => 'METERS_NEAR';

  String get coreCommonLoadingText => 'CORE_COMMON_LOADING_TEXT';
}

class SearchBeneficiary {
  const SearchBeneficiary();

  String get communityProximityLabel =>
      'BENEFICIARY_SEARCH_COMMUNITY_PROXIMITY_LABEL_TEXT';

  String get clfSearchHintText => 'BENEFICIARY_CLF_SEARCH_HINT_TEXT';

  String get searchCLFLabel => 'BENEFICIARY_SEARCH_CLF_LABEL_TEXT';

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

  String get clfInfoTitle => 'BENEFICIARY_CLF_INFO_TITLE';

  String get beneficiaryAddActionLabel => 'BENEFICIARY_ADD_ACTION_LABEL';

  String get clfAddActionLabel => 'BENEFICIARY_ADD_CLF_ACTION_LABEL';

  String get iconLabel => 'ICON_LABEL';

  String get filterLabel => 'FILTER_LABEL';

  String get clearFilter => 'CLEAR_FILTER';

  String get applyFilter => 'APPLY_FILTER';

  String get yearsAbbr => 'YEARS_ABBR';

  String get monthsAbbr => 'MONTHS_ABBR';

  String get proximityLabel => 'PROXIMITY_LABEL';
}

class BeneficiaryDetails {
  const BeneficiaryDetails();

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

  String get householdMemberSingular => 'BENEFICIARY_HOUSEHOLD_MEMBER';

  String get householdMemberPlural => 'BENEFICIARY_HOUSEHOLD_MEMBERS';

  String get totalMembers => 'TOTAL_HOUSEHOLD_MEMBERS';
}

class IndividualDetails {
  const IndividualDetails();

  String get clfCheckboxLabelText => 'INDIVIDUAL_CLF_CHECKBOX_LABEL_TEXT';

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

  String get mobileNumberLengthValidationMessage =>
      'INDIVIDUAL_DETAILS_MOBILE_NUMBER_LENGTH';

  String get yearsHintText => 'YEARS_HINT_TEXT';

  String get monthsHintText => 'MONTHS_HINT_TEXT';

  String get yearsErrorText => 'ERR_YEARS';

  String get monthsErrorText => 'ERR_MONTHS';

  String get yearsAndMonthsErrorText => 'ERR_YEARS_AND_MONTHS';

  String get linkVoucherToIndividual => 'LINK_VOUCHER_TO_INDIVIDUAL';
}

class HouseholdLocation {
  const HouseholdLocation();

  String get buildingNameLabel => 'CLF_BUILDING_NAME_LABEL_TEXT';

  String get clfLocationLabelText => 'CLF_LOCATION_LABEL_TEXT';

  String get householdLocationLabelText => 'HOUSEHOLD_LOCATION_LABEL_TEXT';

  String get householdLocationDescriptionText =>
      'HOUSEHOLD_LOCATION_DESCRIPTION_TEXT';

  String get administrationAreaFormLabel => 'ADMINISTRATION_AREA_FORM_LABEL';

  String get gpsAccuracyLabel => 'CLOSE_HOUSEHOLD_GPS_ACCURACY_LABEL';

  String get administrationAreaRequiredValidation =>
      'HOUSEHOLD_LOCATION_ADMINISTRATION_AREA_REQUIRED_VALIDATION';

  String get householdAddressLine1LabelText =>
      'HOUSEHOLD_ADDRESS_LINE_1_FORM_LABEL';

  String get landmarkFormLabel => 'LANDMARK_FORM_LABEL';

  String get villageLabel => 'VILLAGE_LABEL';

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

  String get goToHome => 'GO_TO_HOME_SCREEN';

  String get downloadmoredata => 'DOWNLOAD_MORE_DATA';

  String get dataDownloadedSuccessLabel => 'DATA_DOWNLOADED_SUCCESS_LABEL';
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

class HouseholdDetails {
  const HouseholdDetails();

  String get householdDetailsLabel => 'HOUSEHOLD_DETAILS_LABEL';

  String get householdDetailsDescription => 'HOUSEHOLD_DETAILS_DESCRIPTION';

  String get actionLabel => 'HOUSEHOLD_ACTION_LABEL';

  String get dateOfRegistrationLabel =>
      'HOUSEHOLD_DETAILS_DATE_OF_REGISTRATION_LABEL';

  String get noOfMembersCountLabel => 'NO_OF_MEMBERS_COUNT_LABEL';

  String get noOfPregnantWomenCountLabel => 'NO_OF_PREGNANT_WOMEN_LABEL';

  String get noOfChildrenBelow5YearsLabel => 'NO_OF_CHILDREN_BELOW_5_YR_LABEL';

  String get viewHouseHoldDetailsAction =>
      'VIEW_HOUSEHOLD_DETAILS_ACTION_LABEL';

  String get noOfRoomsLabel => 'NO_OF_ROOMS_LABEL';

  String get houseDetailsLabel => 'HOUSE_DETAILS_LABEL';

  String get selectStructureTypeError => 'PLEASE_SELECT_STRUCTURE_TYPE';

  String get memberCountError => 'MEMBER_COUNT_ERROR';

  String get typeOfStructure => 'TYPE_OF_STRUCTURE';
}

class HouseholdOverView {
  const HouseholdOverView();

  String get householdOverViewLabel => 'HOUSEHOLD_OVER_VIEW_LABEL';

  String get instituteNameLabel => 'HOUSEHOLD_OVER_VIEW_INSTITUTE_NAME_LABEL';

  String get instituteTypeLabel => 'HOUSEHOLD_OVER_VIEW_INSTITUTE_TYPE_LABEL';

  String get clfOverviewLabel => 'HOUSEHOLD_OVER_VIEW_CLF_LABEL';

  String get householdOverViewEditLabel =>
      'HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL';

  String get clfOverViewEditLabel => 'CLF_OVER_VIEW_EDIT_ICON_LABEL';

  String get householdOverViewDeleteLabel =>
      'HOUSEHOLD_OVER_VIEW_DELETE_ICON_LABEL';

  String get householdOverViewEditIconText =>
      'HOUSEHOLD_OVER_VIEW_EDIT_ICON_LABEL_TEXT';

  String get clfOverViewEditIconText => 'CLF_OVER_VIEW_EDIT_ICON_LABEL_TEXT';

  String get householdOverViewActionCardTitle =>
      'HOUSEHOLD_OVER_VIEW_ACTION_CARD_TITLE';

  String get householdOverViewPrimaryActionLabel =>
      'HOUSEHOLD_OVER_VIEW_PRIMARY_ACTION_LABEL';

  String get householdOverViewSecondaryActionLabel =>
      'HOUSEHOLD_OVER_VIEW_SECONDARY_ACTION_LABEL';

  String get householdOverViewDeliveredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_DELIVERED_ICON_LABEL';

  String get householdOverViewRegisteredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_REGISTERED_ICON_LABEL';

  String get householdOverViewNotRegisteredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_NOT_REGISTERED_ICON_LABEL';

  String get householdOverViewNotDeliveredIconLabel =>
      'HOUSEHOLD_OVER_VIEW_NOT_DELIVERED_ICON_LABEL';

  String get householdOverViewNotEligibleIconLabel =>
      'HOUSEHOLD_OVER_VIEW_NOT_ELIGIBLE_ICON_LABEL';

  String get householdOverViewBeneficiaryReferredLabel =>
      'HOUSEHOLD_OVER_VIEW_BENEFICIARY_REFERRED_LABEL';

  String get householdOverViewHouseholdHeadLabel =>
      'HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_LABEL';

  String get householdOverViewHouseholdHeadNameLabel =>
      'HOUSEHOLD_OVER_VIEW_HOUSEHOLD_HEAD_NAME_LABEL';

  String get householdOverViewActionText => 'HOUSEHOLD_OVER_VIEW_ACTION_TEXT';

  String get viewDeliveryLabel => 'VIEW_DELIVERY_DETAILS_LABEL';

  String get transactionDetails => 'STOCK_TRANSACTION_DETAILS';

  String get householdOverViewAddActionText =>
      'HOUSEHOLD_OVER_VIEW__ADD_ACTION_TEXT';
}

class MemberCard {
  const MemberCard();

  String get assignAsHouseholdhead => 'MEMBER_CARD_ASSIGN_AS_HEAD';

  String get assignAsClfhead => 'MEMBER_CARD_ASSIGN_AS_CLF';

  String get editIndividualDetails => 'MEMBER_CARD_EDIT_INDIVIDUAL_DETAILS';

  String get deleteIndividualActionText =>
      'MEMBER_CARD_DELETE_INDIVIDUAL_ACTION_TEXT';

  String get deliverInterventionSubmitLabel =>
      'MEMBER_CARD_DELIVER_INTERVENTION_SUBMIT_LABEL';

  String get deliverDetailsUpdateLabel =>
      'MEMBER_CARD_DELIVER_DETAILS_UPDATE_LABEL';

  String get deliverDetailsYearText => 'MEMBER_CARD_DELIVER_DETAILS_YEAR_TEXT';

  String get editDetails => 'MEMBER_CARD_EDIT_DETAILS';

  String get heightLabel => 'HEIGHT_LABEL';

  String get deliverDetailsMonthsText =>
      'MEMBER_CARD_DELIVER_DETAILS_MONTHS_TEXT';

  String get unableToDeliverLabel => 'MEMBER_CARD_UNABLE_TO_DELIVER_LABEL';

  String get beneficiaryRefusedLabel => 'MEMBER_CARD_BENEFICIARY_REFUSED_LABEL';

  String get recordAdverseEventsLabel =>
      'MEMBER_CARD_RECORD_ADVERSE_EVENTS_LABEL';

  String get referBeneficiaryLabel => 'MEMBER_CARD_REFER_BENEFICIARY_LABEL';
}

class DeliverIntervention {
  const DeliverIntervention();

  String get deliverInterventionLabel => 'DELIVER_INTERVENTION_LABEL';

  String get beneficiaryChecklistDialogDescription =>
      'BENEFICIARY_CHECKLIST_DIALOG_DESCRIPTION';

  String get refusedDeliveryLabel => 'REFUSED_DELIVERY_LABEL';

  String get refusedDeliveryVisitDateLabel => 'REFUSED_DELIVERY_VISIT_DATE';

  String get reasonForRefusalLabel => 'REASON_FOR_REFUSAL_LABEL';

  String get reasonForRefusalCommentLabel => 'REASON_FOR_REFUSAL_COMMENT_LABEL';

  String get deliverInterventionResourceLabel =>
      'DELIVER_INTERVENTION_RESOURCE_LABEL';

  String get dateOfRegistrationLabel =>
      'DELIVER_INTERVENTION_DATE_OF_REGISTRATION_LABEL';

  String get resourceDeliveredLabel =>
      'DELIVER_INTERVENTION_RESOURCE_DELIVERED_LABEL';

  String get typeOfResourceUsed => 'TYPE_OF_RESOURCE_USED';

  String get resourceDeliveredError =>
      'DELIVER_INTERVENTION_RESOURCE_DELIVERED_ERROR';

  String get quantityDistributedLabel =>
      'DELIVER_INTERVENTION_QUANTITY_DISTRIBUTED_LABEL';

  String get deliveryCommentLabel =>
      'DELIVER_INTERVENTION_DELIVERY_COMMENT_LABEL';

  String get deliveryCommentHeading =>
      'DELIVER_INTERVENTION_DELIVERY_COMMENT_HEADING';

  String get deliveryDetailsLabel =>
      'DELIVER_INTERVENTION_DELIVERY_DETAILS_LABEL';

  String get idTypeText => 'DELIVER_INTERVENTION_ID_TYPE_TEXT';

  String get idNumberText => 'DELIVER_INTERVENTION_ID_NUMBER_TEXT';

  String get memberCountText => 'DELIVER_INTERVENTION_MEMBER_COUNT_TEXT';

  String get noOfResourcesForDelivery =>
      'DELIVER_INTERVENTION_NO_OF_RESOURCES_FOR_DELIVERY';

  String get dialogTitle => 'DELIVER_INTERVENTION_DIALOG_TITLE';

  String get dialogContent => 'DELIVER_INTERVENTION_DIALOG_CONTENT';

  String get didYouObserveAdvEventsTitle =>
      'DID_YOU_OBSERVE_ADVERSE_EVENTS_TITLE';

  String get didYouObservePreviousAdvEventsTitle =>
      'DID_YOU_OBSERVE_PREVIOUS_ADVERSE_EVENTS_TITLE';

  String get heightLabelText => 'HEIGHT_LABEL_TEXT';

  String get resourceAddBeneficiary =>
      'DELIVER_INTERVENTION_RESOURCE_ADD_RESOURCE';

  String get resourceDeleteBeneficiary =>
      'DELIVER_INTERVENTION_RESOURCE_DELETE_RESOURCE';

  String get resourceDeleteBeneficiaryDialogTitle =>
      'DELIVER_INTERVENTION_RESOURCE_DIALOG_TITLE';

  String get resourceDeleteBeneficiaryPrimaryActionLabel =>
      'DELIVER_INTERVENTION_RESOURCE_DELETE_PRIMARY_ACTION_LABEL';

  String get wasTheDoseAdministered => 'WAS_THE_DOSE_ADMINISTERED_LABEL';

  String get dose => 'DELIVER_INTERVENTION_DOSE';

  String get hidePastCycles => 'DELIVER_INTERVENTION_HIDE_PAST_CYCLES';

  String get viewPastCycles => 'DELIVER_INTERVENTION_VIEW_PAST_CYCLES';

  String get currentCycle => 'DELIVER_INTERVENTION_CURRENT_CYCLE';

  String get cycle => 'DELIVERY_CYCLE';

  String get recordPastDeliveryDeatils =>
      'DELIVER_INTERVENTION_PAST_DELIVERY_DETAILS';

  String get wasDosePastDeliveryDetails =>
      'DELIVER_INTERVENTION_PAST_DOSE_DELIVERY_DETAILS';

  //[todo] need to change the 24
  String get wasDosePastRecordDeliveryDetails =>
      'DELIVER_INTERVENTION_PAST_RECORD_DOSE_DELIVERY_DETAILS';

  String get resourceCannotBeZero => 'RESOURCE_QUANTITY_CANNOT_BE_ZERO';

  String get resourceDeliveredValidation => 'RESOURCE_DELIVERED_VALIDATION';

  String get resourceDuplicateValidation => 'RESOURCE_DUPLICATE_VALIDATION';

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

  String get manualScan => 'MANUAL_SCAN';

  String get manualEnterCode => 'ENTER_MANUAL_CODE';

  String get manualCodeDescription => 'MANUAL_CODE_DESCRIPTION';

  String get resourceCode => 'RESOURCE_CODE';

  String get voucherCode => 'VOUCHER_CODE';

  String get checkForProductVariantsConfig =>
      'CHECK_FOR_PRODUCT_VARIANTS_CONFIG';
}

class ReferBeneficiary {
  const ReferBeneficiary();

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

  String get noFacilityAssigned => 'NO_FACILITY_ASSIGNED';

  String get noFacilityAssignedDescription =>
      'NO_FACILITY_ASSIGNED_DESCRIPTION';
}

class ReasonForDeletion {
  const ReasonForDeletion();

  String get reasonForDeletionLabel => 'REASON_FOR_DELETION_LABEL';
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

class SearchBeneficiariesShowcase {
  const SearchBeneficiariesShowcase();

  String get numberOfHouseholdsRegistered {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_NUMBER_OF_HOUSEHOLDS_REGISTERED';
  }

  String get numberOfBednetsDelivered {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_NUMBER_OF_BEDNETS_DELIVERED';
  }

  String get enterNameOfHouseholdHead {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_ENTER_NAME_OF_HOUSEHOLD_HEAD';
  }

  String get registerNewHousehold {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_REGISTER_NEW_HOUSEHOLD';
  }

  String get nameOfBeneficiary {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_NAME_OF_BENEFICIARY';
  }

  String get deliveryStatus {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_DELIVERY_STATUS';
  }

  String get open {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_OPEN';
  }

  String get beneficiary {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_BENEFICIARY';
  }

  String get age {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_AGE';
  }

  String get gender {
    return 'SEARCH_BENEFICIARIES_SHOWCASE_GENDER';
  }
}

String get numberOfHouseholdsRegistered {
  return 'SEARCH_BENEFICIARIES_SHOWCASE_NUMBER_OF_HOUSEHOLDS_REGISTERED';
}

String get numberOfBednetsDelivered {
  return 'SEARCH_BENEFICIARIES_SHOWCASE_NUMBER_OF_BEDNETS_DELIVERED';
}

String get enterNameOfHouseholdHead {
  return 'SEARCH_BENEFICIARIES_SHOWCASE_ENTER_NAME_OF_HOUSEHOLD_HEAD';
}

String get registerNewHousehold {
  return 'SEARCH_BENEFICIARIES_SHOWCASE_REGISTER_NEW_HOUSEHOLD';
}

class HouseholdLocationShowcase {
  const HouseholdLocationShowcase();

  String get buildingName {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_BUILDING_NAME';
  }

  String get administrativeArea {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_ADMINISTRATIVE_AREA';
  }

  String get gpsAccuracy {
    return 'HOUSEHOLD_LOCATION_SHOWCASE_GPS_ACCURACY_LABEL';
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

class HouseholdDetailsShowcase {
  const HouseholdDetailsShowcase();

  String get dateOfRegistration {
    return 'HOUSEHOLD_DETAILS_SHOWCASE_DATE_OF_REGISTRATION';
  }

  String get numberOfMembersLivingInHousehold {
    return 'HOUSEHOLD_DETAILS_SHOWCASE_NUMBER_OF_MEMBERS_LIVING_IN_HOUSEHOLD';
  }

  String get numberOfPregnantWomenInHousehold =>
      'HOUSEHOLD_DETAILS_SHOWCASE_NO_OF_PREGNANT_WOMEN_IN_HOUSEHOLD';

  String get numberOfChildrenBelow5InHousehold =>
      'HOUSEHOLD_DETAILS_SHOWCASE_NO_OF_CHILD_BELOW_5_IN_HOUSEHOLD';

  String get numberOfRoomsInHousehold =>
      'HOUSE_DETAILS_SHOWCASE_NO_OF_ROOMS_IN_HOUSEHOLD';

  String get typeOfStructure => 'HOUSE_DETAILS_SHOWCASE_TYPE_OF_STRUCTURE';
}

class IndividualDetailsShowcase {
  const IndividualDetailsShowcase();

  String get firstNameOfIndividual {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_FIRST_NAME_OF_INDIVIDUAL';
  }

  String get lastNameOfIndividual {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_LAST_NAME_OF_INDIVIDUAL';
  }

  String get headOfHousehold {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_HEAD_OF_HOUSEHOLD';
  }

  String get age {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_AGE';
  }

  String get dateOfBirth {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_DATE_OF_BIRTH';
  }

  String get gender {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_GENDER';
  }

  String get mobile {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_MOBILE';
  }

  String get idType {
    return 'INDIVIDUAL_DETAILS_SHOWCASE_ID_TYPE';
  }
}

class HouseholdOverviewShowcase {
  const HouseholdOverviewShowcase();

  String get editHousehold {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_EDIT_HOUSEHOLD';
  }

  String get deliveryStatus {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_DELIVERY_STATUS';
  }

  String get householdHead {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_HOUSEHOLD_HEAD';
  }

  String get administrativeArea {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_ADMINISTRATIVE_AREA';
  }

  String get memberCount {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_MEMBER_COUNT';
  }

  String get householdIndividualCardTitle {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_HOUSEHOLD_INDIVIDUAL_CARD_TITLE';
  }

  String get editMember {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_EDIT_MEMBER';
  }

  String get addMember {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_ADD_MEMBER';
  }

  String get deliverIntervention {
    return 'HOUSEHOLD_OVERVIEW_SHOWCASE_DELIVER_INTERVENTION';
  }
}

class DeliverInterventionShowcase {
  const DeliverInterventionShowcase();

  String get dateOfVisitLabel {
    return 'DELIVER_INTERVENTION_SHOWCASE_MEMBER_COUNT';
  }

  String get reasonOfRefusalLabel {
    return 'DELIVER_INTERVENTION_SHOWCASE_NUMBER_OF_BEDNETS_TO_DELIVER';
  }

  String get commentLabel {
    return 'DELIVER_INTERVENTION_SHOWCASE_NUMBER_OF_BEDNETS_DISTRIBUTED';
  }

  String get memberCount {
    return 'DELIVER_INTERVENTION_SHOWCASE_MEMBER_COUNT';
  }

  String get numberOfBednetsToDeliver {
    return 'DELIVER_INTERVENTION_SHOWCASE_NUMBER_OF_BEDNETS_TO_DELIVER';
  }

  String get numberOfBednetsDistributed {
    return 'DELIVER_INTERVENTION_SHOWCASE_NUMBER_OF_BEDNETS_DISTRIBUTED';
  }

  String get deliveryComment {
    return 'DELIVER_INTERVENTION_SHOWCASE_DELIVERY_COMMENT';
  }
}
