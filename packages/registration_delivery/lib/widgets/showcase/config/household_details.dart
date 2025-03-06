part of 'showcase_constants.dart';

class _HouseholdDetailsShowcaseData {
  static final _HouseholdDetailsShowcaseData _instance =
      _HouseholdDetailsShowcaseData._();

  _HouseholdDetailsShowcaseData._();

  factory _HouseholdDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        dateOfRegistration,
        numberOfPregnantWomenInHousehold,
        numberOfChildrenBelow5InHousehold,
        numberOfMembersLivingInHousehold,
      ];

  final dateOfRegistration = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdDetailsShowcase.dateOfRegistration,
  );

  final numberOfMembersLivingInHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.householdDetailsShowcase.numberOfMembersLivingInHousehold,
  );

  final numberOfPregnantWomenInHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.householdDetailsShowcase.numberOfPregnantWomenInHousehold,
  );
  final numberOfChildrenBelow5InHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.householdDetailsShowcase.numberOfChildrenBelow5InHousehold,
  );
}
