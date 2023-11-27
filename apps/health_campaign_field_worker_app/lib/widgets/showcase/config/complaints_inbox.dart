part of 'showcase_constants.dart';

class _ComplaintsInboxShowcaseData {
  static final _ComplaintsInboxShowcaseData _instance =
      _ComplaintsInboxShowcaseData._();

  _ComplaintsInboxShowcaseData._();

  factory _ComplaintsInboxShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        complaintSearch,
        complaintFilter,
        complaintSort,
        complaintNumber,
        complaintType,
        complaintDate,
        complaintArea,
        complaintStatus,
        complaintOpen,
        complaintCreate,
      ];

  final complaintNumber = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintNumber,
  );

  final complaintType = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintType,
  );

  final complaintDate = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintDate,
  );

  final complaintSearch = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintSearch,
  );

  final complaintArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintArea,
  );

  final complaintFilter = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintFilter,
  );

  final complaintStatus = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintStatus,
  );

  final complaintSort = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintSort,
  );

  final complaintOpen = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintOpen,
  );

  final complaintCreate = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsInboxShowcase.complaintCreate,
  );
}
