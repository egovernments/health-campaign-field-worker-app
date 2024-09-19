
part of 'showcase_constants.dart';

class _SurveyFormDataShowcaseData {
  static final _SurveyFormDataShowcaseData _instance =
      _SurveyFormDataShowcaseData._();

  _SurveyFormDataShowcaseData._();

  factory _SurveyFormDataShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        date,
        administrativeUnit,
      ];

  final date = ShowcaseItemBuilder(
    messageLocalizationKey: i18.surveyFormDataShowcase.date,
  );

  final administrativeUnit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.surveyFormDataShowcase.administrativeUnit,
  );
}
