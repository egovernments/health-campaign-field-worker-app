part of 'showcase_constants.dart';

class _ComplaintsDetailsShowcaseData {
  static final _ComplaintsDetailsShowcaseData _instance =
      _ComplaintsDetailsShowcaseData._();

  _ComplaintsDetailsShowcaseData._();

  factory _ComplaintsDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        complaintDate,
        complaintOrganizationUnit,
        complaintSelfOrOther,
        complaintName,
        complaintContact,
        complaintSupervisorName,
        complaintSupervisorContact,
        complaintDescription,
        complaintSubmit,
      ];

  final complaintOrganizationUnit = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.complaintsDetailsShowcase.complaintOrganizationUnit,
  );

  final complaintSelfOrOther = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintSelfOrOther,
  );

  final complaintDate = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintDate,
  );

  final complaintName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintName,
  );

  final complaintSupervisorName = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.complaintsDetailsShowcase.complaintSupervisorName,
  );

  final complaintContact = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintContact,
  );

  final complaintSupervisorContact = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.complaintsDetailsShowcase.complaintSupervisorContact,
  );

  final complaintDescription = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintDescription,
  );

  final complaintSubmit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.complaintsDetailsShowcase.complaintSubmit,
  );
}
