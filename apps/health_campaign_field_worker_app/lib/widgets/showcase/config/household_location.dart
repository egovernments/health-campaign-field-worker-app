part of 'showcase_constants.dart';

class _HouseholdLocationShowcaseData {
  static final _HouseholdLocationShowcaseData _instance =
      _HouseholdLocationShowcaseData._();

  _HouseholdLocationShowcaseData._();

  factory _HouseholdLocationShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        administrativeArea,
        landmark,
      ];

  final administrativeArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.administrativeArea,
  );

  final landmark = ShowcaseItemBuilder(
    messageLocalizationKey: i18.householdLocationShowcase.landmark,
  );
}
