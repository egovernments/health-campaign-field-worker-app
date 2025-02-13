part of 'showcase_constants.dart';

class _CLFLocationShowcaseData {
  static final _CLFLocationShowcaseData _instance =
      _CLFLocationShowcaseData._();

  _CLFLocationShowcaseData._();

  factory _CLFLocationShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        administrativeArea,
        gpsAccuracy,
        buildingName,
        addressLine1,
        addressLine2,
        landmark,
        postalCode,
      ];

  final administrativeArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.administrativeArea,
  );

  final gpsAccuracy = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.gpsAccuracy,
  );

  final landmark = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.landmark,
  );

  final buildingName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.buildingName,
  );

  final addressLine1 = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.address,
  );
  final addressLine2 = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.address,
  );

  final postalCode = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfLocationShowCase.postalCode,
  );
}
