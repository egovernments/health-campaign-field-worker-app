part of 'showcase_constants.dart';

class _HouseholdOverviewShowcaseData {
  static final _HouseholdOverviewShowcaseData _instance =
      _HouseholdOverviewShowcaseData._();

  _HouseholdOverviewShowcaseData._();

  factory _HouseholdOverviewShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        deliveryStatus,
        householdHead,
        administrativeArea,
        memberCount,
        householdIndividualCard,
        editMember,
        deliverIntervention,
      ];

  final editHousehold = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.editHousehold,
  );

  final deliveryStatus = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.deliveryStatus,
  );

  final householdHead = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.householdHead,
  );

  final administrativeArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.administrativeArea,
  );

  final memberCount = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.memberCount,
  );

  final householdIndividualCard = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.householdOverviewShowcase.householdIndividualCardTitle,
  );

  final editMember = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.editMember,
  );

  final addMember = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.addMember,
  );

  final deliverIntervention = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdOverviewShowcase.deliverIntervention,
  );
}
