part of 'showcase_constants.dart';

class _ChecklistDataShowcaseData {
  static final _ChecklistDataShowcaseData _instance =
      _ChecklistDataShowcaseData._();

  _ChecklistDataShowcaseData._();

  factory _ChecklistDataShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        date,
        administrativeUnit,
      ];

  final date = ShowcaseItemBuilder(
    messageLocalizationKey: i18.checklistDataShowcase.date,
  );

  final administrativeUnit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.checklistDataShowcase.administrativeUnit,
  );
}
