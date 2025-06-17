const searchBeneficiaryKeys = SearchBeneficiaryKeys();
const householdOverViewKeys = HouseholdOverViewKeys();
const acknowledgementKeys = AcknowledgementKeys();
const commonKeys = CommonKeys();

class SearchBeneficiaryKeys{
  const SearchBeneficiaryKeys();

}

class CommonKeys{
  const CommonKeys();
  String get secondaryButtonKey => 'SecondaryButton';
  String get primaryButtonKey => 'PrimaryButton';
}

class HouseholdOverViewKeys{
  const HouseholdOverViewKeys();

  String get editHouseholdKey => 'editHousehold';
  String get editIndividualKey => 'editIndividual';
  String get individualSecondaryButtonKey => 'IndividualDeliverySecondaryButton';
  String get individualPrimaryButtonKey => 'IndividualDeliveryPrimaryButton';
  String get addMemberKey => 'addMember';
  String get householdSecondaryButtonKey => 'SecondaryButton';
  String get householdPrimaryButtonKey => 'PrimaryButton';
}

class AcknowledgementKeys{
  const AcknowledgementKeys();

  String get acknowledgmentTitleKey => 'AcknowledgmentTitle';
  String get acknowledgmentDescriptionKey => 'AcknowledgmentDescription';

}
