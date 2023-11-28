part of 'showcase_constants.dart';

class _ComplaintsDetailsViewShowcaseData {
  static final _ComplaintsDetailsViewShowcaseData _instance =
      _ComplaintsDetailsViewShowcaseData._();

  _ComplaintsDetailsViewShowcaseData._();

  factory _ComplaintsDetailsViewShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        complaintNumber,
        complaintType,
        complaintDate,
        complaintName,
        complaintArea,
        complaintContact,
        complaintStatus,
        complaintDescription,
        complaintClose,
      ];

  final complaintNumber = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintNumber,
  );

  final complaintType = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintType,
  );

  final complaintDate = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintDate,
  );

  final complaintName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintName,
  );

  final complaintArea = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintArea,
  );

  final complaintContact = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintContact,
  );

  final complaintStatus = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintStatus,
  );

  final complaintDescription = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.complaintsDetailsViewShowcase.complaintDescription,
  );

  final complaintClose = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsViewShowcase.complaintClose,
  );
}
