const common = Common();
const transitPost = TransitPost();

class Common {
  const Common();

  String get coreCommonHelp => 'CORE_COMMON_HELP';

  String get coreCommonBack => 'CORE_COMMON_BACK';

  String get coreCommonRequired => 'CORE_COMMON_REQUIRED';

  String get coreCommonOk => 'CORE_COMMON_OK';

  String get locationCapturing => 'CAPTURING_LOCATION';
}

class TransitPost {
  const TransitPost();

  String get scanResourceLabel => 'TRANSIT_POST_SCAN_RESOURCE_LABEL';

  String get totalDeliveriesDescription =>
      'TRANSIT_POST_TOTAL_DELIVERIES_DESCRIPTION';

  String get todayDeliveriesDescription =>
      'TRANSIT_POST_TODAY_DELIVERIES_DESCRIPTION';

  String get typeSelectionLabel => 'TRANSIT_POST_TYPE_SELECTION_LABEL';

  String get nameLabel => 'TRANSIT_POST_NAME_LABEL';

  String get recordDeliveryLabel => 'TRANSIT_POST_RECORD_DELIVERY_LABEL';

  String get closeDeliveryLabel => 'TRANSIT_POST_CLOSE_DELIVERY_LABEL';

  String get vaccinationDetailsLabel =>
      'TRANSIT_POST_VACCINATION_DETAILS_LABEL';

  String get dateLabel => 'TRANSIT_POST_DATE_LABEL';

  String get transitPostTypeLabel => 'TRANSIT_POST_TYPE_LABEL';

  String get transitPostNameLabel => 'TRANSIT_POST_NAME_LABEL';

  String get resourceDeliveredLabel => 'TRANSIT_POST_RESOURCE_DELIVERED_LABEL';

  String get doseLabel => 'TRANSIT_POST_TABLE_HEADER_DOSE_LABEL';

  String get resourceLabel => 'TRANSIT_POST_TABLE_HEADER_RESOURCE_LABEL';

  String get resourceScannedLabel => 'TRANSIT_POST_RESOURCE_SCANNED_LABEL';

  String get resourceCodeLabel => 'TRANSIT_POST_RESOURCE_CODE_LABEL';

  String get batchNumberLabel => 'TRANSIT_POST_BATCH_NUMBER_LABEL';

  String get deliverySuccessfulLabel =>
      'TRANSIT_POST_DELIVERY_SUCCESSFUL_LABEL';

  String get deliverySuccessfulDescription =>
      'TRANSIT_POST_DELIVERY_SUCCESSFUL_DESCRIPTION';

  String get alertPopupTitle => 'TRANSIT_POST_ALERT_POPUP_TITLE';

  String get countPopupTitle => 'TRANSIT_POST_ALERT_POPUP_TITLE';

  String get alertPopupDescription => 'TRANSIT_POST_ALERT_POPUP_DESCRIPTION';

  String get countPopupDescription => 'TRANSIT_POST_ALERT_POPUP_DESCRIPTION';

  String get beneficiaryAgeLabel => 'TRANSIT_POST_BENEFICIARY_AGE_LABEL';

  String get beneficiaryAgeDescription =>
      'TRANSIT_POST_BENEFICIARY_AGE_DESCRIPTION';
}
