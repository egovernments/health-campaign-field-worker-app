part of 'showcase_constants.dart';

class _SearchBeneficiariesShowcaseData {
  static final _SearchBeneficiariesShowcaseData _instance =
      _SearchBeneficiariesShowcaseData._();

  _SearchBeneficiariesShowcaseData._();

  factory _SearchBeneficiariesShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        householdsRegistered,
        bednetsDelivered,
        nameOfHouseholdHead,
        registerNewHousehold,
        nameOfBeneficiary,
        deliveryStatus,
        open,
        beneficiary,
        age,
        gender,
      ];

  final householdsRegistered = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.searchBeneficiariesShowcase.numberOfHouseholdsRegistered,
  );

  final bednetsDelivered = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.searchBeneficiariesShowcase.numberOfBednetsDelivered,
  );

  final nameOfHouseholdHead = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.searchBeneficiariesShowcase.enterNameOfHouseholdHead,
  );

  final registerNewHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.searchBeneficiariesShowcase.registerNewHousehold,
  );

  final nameOfBeneficiary = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.nameOfBeneficiary,
  );

  final deliveryStatus = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.deliveryStatus,
  );

  final open = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.open,
  );

  final beneficiary = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.beneficiary,
  );

  final age = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.age,
  );

  final gender = ShowcaseItemBuilder(
    messageLocalizationKey: i18.searchBeneficiariesShowcase.gender,
  );
}
