part of 'showcase_constants.dart';

class _IndividualDetailsShowcaseData {
  static final _IndividualDetailsShowcaseData _instance =
      _IndividualDetailsShowcaseData._();

  _IndividualDetailsShowcaseData._();

  factory _IndividualDetailsShowcaseData() => _instance;

  bool hidedata = true;
  List<ShowcaseItemBuilder> get showcaseData {
    List<ShowcaseItemBuilder> data = [
      nameOfIndividual,
      headOfHousehold,
      idType,
      dateOfBirth,
      gender,
      mobile,
      height,
      weight
    ];

    // if (!hidedata) {
    //   data.insert(data.indexOf(nameOfIndividual) + 1, headOfHousehold);
    // }

    return data;
  }

  final nameOfIndividual = ShowcaseItemBuilder(
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

  final idType = ShowcaseItemBuilder(
    messageLocalizationKey: i18.individualDetailsShowcase.idType,
  );
  final height = ShowcaseItemBuilder(
    messageLocalizationKey: "height",
  );
  final weight = ShowcaseItemBuilder(
    messageLocalizationKey: "weight",
  );
}
