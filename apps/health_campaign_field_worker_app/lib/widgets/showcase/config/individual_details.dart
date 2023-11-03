part of 'showcase_constants.dart';

class _IndividualDetailsShowcaseData {
  static final _IndividualDetailsShowcaseData _instance =
      _IndividualDetailsShowcaseData._();

  _IndividualDetailsShowcaseData._();

  factory _IndividualDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        firstNameOfIndividual,
        lastNameOfIndividual,
        headOfHousehold,
        age,
        dateOfBirth,
        gender,
        mobile,
      ];

  final firstNameOfIndividual = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.firstNameOfIndividual,
  );

  final lastNameOfIndividual = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.lastNameOfIndividual,
  );

  final headOfHousehold = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.headOfHousehold,
  );

  final age = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.age,
  );

  final dateOfBirth = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.dateOfBirth,
  );

  final gender = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.gender,
  );

  final mobile = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.mobile,
  );
}
