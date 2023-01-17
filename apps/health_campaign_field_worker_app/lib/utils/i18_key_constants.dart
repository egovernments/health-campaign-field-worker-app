library i18;

const common = Common();
const login = Login();
const forgotPassword = ForgotPassword();
const home = Home();
const searchBeneficiary = SearchBeneficiary();
const householdLocation = HouseholdLocation();

class Common {
  const Common();

  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';

  String get coreCommonAge => 'CORE_COMMON_AGE';

  String get coreCommonGender => 'CORE_COMMON_GENDER';
}

class Login {
  const Login();

  String get labelText => 'LOGIN_LABEL_TEXT';

  String get userIdPlaceholder => 'USER_ID_PLACEHOLDER';

  String get passwordPlaceholder => 'PASSWORD_PLACEHOLDER';

  String get actionLabel => 'LOGIN_ACTION_LABEL';
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

  String get viewReportsLabel => 'HOME_VIEW_REPORTS_LABEL';

  String get syncDataLabel => 'HOME_SYNC_DATA_LABEL';

  String get callbackLabel => 'HOME_CALL_BACK_LABEL';

  String get fileComplaint => 'HOME_FILE_COMPLAINT';

  String get progressIndicatorTitle => 'PROGRESS_INDICATOR_TITLE';

  String get progressIndicatorPrefixLabel => 'PROGRESS_INDICATOR_PREFIX_LABEL';
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

class HouseholdLocation {
  const HouseholdLocation();

  String get householdLocationLabelText => 'HOUSEHOLD_LOCATION_LABEL_TEXT';

  String get administrationAreaFormLabel => 'ADMINISTRATION_AREA_FORM_LABEL';

  String get householdAddressLine1LabelText => 'HOUSEHOLD_ADDRESS_LINE_1_FORM_LABEL';

  String get landmarkFormLabel => 'LANDMARK_FORM_LABEL';

  String get householdAddressLine2LabelText => 'HOUSEHOLD_ADDRESS_LINE_2_FORM_LABEL';

  String get postalCodeFormLabel => 'POSTAL_CODE_FORM_LABEL';

  String get actionLabel => 'HOUSEHOLD_LOCATION_ACTION_LABEL';
}
