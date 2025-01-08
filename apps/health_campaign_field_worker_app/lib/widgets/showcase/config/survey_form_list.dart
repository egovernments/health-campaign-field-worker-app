part of 'showcase_constants.dart';

class _SurveyFormListShowcaseData {
  static final _SurveyFormListShowcaseData _instance =
      _SurveyFormListShowcaseData._();

  _SurveyFormListShowcaseData._();

  factory _SurveyFormListShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [open];

  final open = ShowcaseItemBuilder(
    messageLocalizationKey: i18.surveyFormListShowcase.open,
  );
}
