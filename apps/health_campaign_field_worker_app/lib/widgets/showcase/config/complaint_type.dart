part of 'showcase_constants.dart';

class _ComplaintTypeShowcaseData {
  static final _ComplaintTypeShowcaseData _instance =
      _ComplaintTypeShowcaseData._();

  _ComplaintTypeShowcaseData._();

  factory _ComplaintTypeShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData =>
      [complaintType, complaintTypeNext];

  final complaintType = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintTypeShowcase.complaintType,
  );

  final complaintTypeNext = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintTypeShowcase.complaintTypeNext,
  );
}
