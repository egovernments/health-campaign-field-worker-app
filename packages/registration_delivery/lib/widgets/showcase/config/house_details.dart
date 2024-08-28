part of 'showcase_constants.dart';

class _HouseholdShowcaseData {
  static final _HouseholdShowcaseData _instance = _HouseholdShowcaseData._();

  _HouseholdShowcaseData._();

  factory _HouseholdShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        typeOfStructure,
        noOfRooms,
      ];

  final typeOfStructure = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdDetailsShowcase.typeOfStructure,
  );

  final noOfRooms = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.householdDetailsShowcase.numberOfRoomsInHousehold,
  );
}
