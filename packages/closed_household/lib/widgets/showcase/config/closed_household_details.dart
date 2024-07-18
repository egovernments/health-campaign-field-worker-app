part of 'showcase_constants.dart';

class _ClosedHouseholdDetailsShowcaseData {
  static final _ClosedHouseholdDetailsShowcaseData _instance =
  _ClosedHouseholdDetailsShowcaseData._();

  _ClosedHouseholdDetailsShowcaseData._();

  factory _ClosedHouseholdDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
    villageName,
    gpsAccuracy,
    householdHeadName,
  ];

  final villageName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.closedHouseholdDetailsShowcase.villageName,
  );

  final gpsAccuracy = ShowcaseItemBuilder(
    messageLocalizationKey:
    i18.closedHouseholdDetailsShowcase.gpsAccuracy,
  );

  final householdHeadName = ShowcaseItemBuilder(
    messageLocalizationKey:
    i18.closedHouseholdDetailsShowcase.householdHeadName,
  );

}
