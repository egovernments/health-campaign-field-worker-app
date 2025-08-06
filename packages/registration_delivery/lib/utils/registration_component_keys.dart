const searchBeneficiaryKeys = SearchBeneficiaryKeys();
const householdOverViewKeys = HouseholdOverViewKeys();
const acknowledgementKeys = AcknowledgementKeys();
const commonKeys = CommonKeys();
const beneficiaryDetailsKeys = BeneficiaryDetailsKeys();

class SearchBeneficiaryKeys {
  const SearchBeneficiaryKeys();
}

class BeneficiaryDetailsKeys {
  const BeneficiaryDetailsKeys();

  String get detailsCardKey => 'DetailsCard';
  String get tableCardKey => 'Table';
  String get showDeliveryPopUp => 'deliveryConditionDialog';
}

class CommonKeys {
  const CommonKeys();
  String get secondaryButtonKey => 'SecondaryButton';
  String get primaryButtonKey => 'PrimaryButton';
}

class HouseholdOverViewKeys {
  const HouseholdOverViewKeys();

  String get editHouseholdKey => 'editHousehold';
  String get editIndividualKey => 'editIndividual';
  String get individualSecondaryButtonKey =>
      'IndividualDeliverySecondaryButton';
  String get individualPrimaryButtonKey => 'IndividualDeliveryPrimaryButton';
  String get addMemberKey => 'addMember';
  String get householdSecondaryButtonKey => 'SecondaryButton';
  String get householdPrimaryButtonKey => 'PrimaryButton';
  String get detailsCardKey => 'DetailsCard';
}

class AcknowledgementKeys {
  const AcknowledgementKeys();

  String get acknowledgmentTitleKey => 'AcknowledgementTitle';
  String get acknowledgmentDescriptionKey => 'AcknowledgementDescription';
}
