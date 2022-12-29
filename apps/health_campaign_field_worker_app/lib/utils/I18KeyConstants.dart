class i18 {
  static Common common = const Common();
  static SearchBeneficiary searchBeneficiary = const SearchBeneficiary();
}

class Common {
  const Common();
  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';
  String get coreCommonAge => 'CORE_COMMON_AGE';
  String get coreCommonGender => 'CORE_COMMON_GENDER';
}

class SearchBeneficiary {
  const SearchBeneficiary();
  String get statisticsLabelText => 'BENEFICIARY_STATISTICS_LABEL_TEXT';
  String get noOfHouseholdsRegistered => 'NO_OF_HOUSEHOLDS_REGISTERED';
  String get noOfBednetsDelivered => 'NO_OF_BEDNETS_DELIVERED';
  String get beneficiarySearchHintText => 'BENEFICIARY_SEARCH_HINT_TEXT';
  String get beneficiaryInfoDescription => 'BENEFICIARY_INFO_DESCRIPTION';
  String get beneficiaryInfoTitle => 'BENEFICIARY_INFO_TITLE';
  String get beneficiaryAddActionLabel => 'BENEFICIARY_ADD_ACTION_LABEL';
  String get iconLabel => 'ICON_LABEL';
}
