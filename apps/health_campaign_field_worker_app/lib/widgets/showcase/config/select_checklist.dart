part of 'showcase_constants.dart';

class _SelectChecklistShowcaseData {
  static final _SelectChecklistShowcaseData _instance =
      _SelectChecklistShowcaseData._();

  _SelectChecklistShowcaseData._();

  factory _SelectChecklistShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        selectChecklist,
      ];

  final selectChecklist = ShowcaseItemBuilder(
    messageLocalizationKey: i18.selectChecklistShowcase.selectChecklist,
  );
}
