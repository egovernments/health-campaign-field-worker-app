part of 'showcase_constants.dart';

class _HouseholdLocationShowcaseData {
  static final _HouseholdLocationShowcaseData _instance =
      _HouseholdLocationShowcaseData._();

  _HouseholdLocationShowcaseData._();

  factory _HouseholdLocationShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        administrativeArea,
        gpsAccuracy,
        addressLine1,
        addressLine2,
        landmark,
        postalCode,
      ];

  final administrativeArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.administrativeArea,
  );

  final gpsAccuracy = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.gpsAccuracy,
  );

  final landmark = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.landmark,
  );

  final buildingName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.buildingName,
  );

  final addressLine1 = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.address,
  );
  final addressLine2 = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.address,
  );

  final postalCode = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.postalCode,
  );
}
