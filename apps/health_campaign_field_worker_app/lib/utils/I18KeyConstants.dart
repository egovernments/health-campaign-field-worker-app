class i18 {
  static Common common = const Common();
  static SearchBeneficiary searchBeneficiary = const SearchBeneficiary();
}

class Common {
  const Common();
  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';
  String get coreCommonAge => 'CORE_COMMON_AGE';
  String get coreCommonGender => 'CORE_COMMOM_GENDER';
}

class SearchBeneficiary {
  const SearchBeneficiary();
  String get listOfHouseholds => 'LIST_OF_HOUSE_HOLDS';
  String get noOfHouseholdsRegistered => 'NO_OF_HOUSE_HOLDS_REGISTERED';
  String get noOfBedetsDelivered => 'NO_OF_BEDETSDELIVERED';
  String get searchHintText => 'SEARCH_HINT_TEXT';
  String get beneficiaryInfoDescription => 'BENEFICIARY_INFO_DESCRIPTION';
  String get beneficiaryInfoTitle => 'BENEFICIARY_INFO_TITLE';
  String get actionLabel => 'ACTION_LABEL';
  String get iconLabel => 'ICON_LABEL';
}
