part of 'showcase_constants.dart';

class _ChecklistListShowcaseData {
  static final _ChecklistListShowcaseData _instance =
      _ChecklistListShowcaseData._();

  _ChecklistListShowcaseData._();

  factory _ChecklistListShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [open];

  final open = ShowcaseItemBuilder(
    messageLocalizationKey: i18.checklistListShowcase.open,
  );
}
