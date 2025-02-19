part of 'showcase_constants.dart';

class _CLFDetailsShowcaseData {
  static final _CLFDetailsShowcaseData _instance = _CLFDetailsShowcaseData._();

  _CLFDetailsShowcaseData._();

  factory _CLFDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        dateOfRegistration,
        numberOfPregnantWomenInHousehold,
        numberOfChildrenBelow5InHousehold,
        numberOfMembersLivingInHousehold,
      ];

  final dateOfRegistration = ShowcaseItemBuilder(
    messageLocalizationKey: i18.clfDetailsShowcase.dateOfRegistration,
  );

  final numberOfMembersLivingInHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.clfDetailsShowcase.numberOfMembersLivingInHousehold,
  );

  final numberOfPregnantWomenInHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.clfDetailsShowcase.numberOfPregnantWomenInHousehold,
  );
  final numberOfChildrenBelow5InHousehold = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.clfDetailsShowcase.numberOfChildrenBelow5InHousehold,
  );
}
