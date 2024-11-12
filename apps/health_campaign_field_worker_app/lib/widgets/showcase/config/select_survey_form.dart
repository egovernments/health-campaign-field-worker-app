part of 'showcase_constants.dart';

class _SelectSurveyFormShowcaseData {
  static final _SelectSurveyFormShowcaseData _instance =
      _SelectSurveyFormShowcaseData._();

  _SelectSurveyFormShowcaseData._();

  factory _SelectSurveyFormShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        selectSurveyForm,
      ];

  final selectSurveyForm = ShowcaseItemBuilder(
    messageLocalizationKey: i18.selectSurveyFormShowcase.selectSurveyForm,
  );
}
