part of 'showcase_constants.dart';

class _HomePageShowcaseData {
  static final _HomePageShowcaseData _instance = _HomePageShowcaseData._();

  _HomePageShowcaseData._();

  factory _HomePageShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        distributorProgressBar,
        distributorBeneficiaries,
        distributorFileComplaint,
        distributorSyncData,
        warehouseManagerManageStock,
        wareHouseManagerStockReconciliation,
        wareHouseManagerChecklist,
        warehouseManagerFileComplaint,
        warehouseManagerSyncData,
        inventoryReport,
        supervisorProgressBar,
        supervisorMyChecklist,
        supervisorComplaints,
        supervisorSyncData,
        deleteAll,
        db,
        closedHouseHold,
        summaryReport,
      ];

  final distributorProgressBar = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.distributorProgressBar,
  );

  final distributorBeneficiaries = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.distributorBeneficiaries,
  );

  final distributorFileComplaint = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.distributorFileComplaint,
  );

  final distributorSyncData = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.distributorSyncData,
  );

  final warehouseManagerManageStock = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.warehouseManagerManageStock,
  );

  final supervisorMySurveyForm = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.supervisorMySurveyForm,
  );

  final wareHouseManagerStockReconciliation = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.homeShowcase.wareHouseManagerStockReconciliation,
  );

  final wareHouseManagerChecklist = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.wareHouseManagerChecklist,
  );

  final warehouseManagerFileComplaint = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.warehouseManagerFileComplaint,
  );

  final warehouseManagerSyncData = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.warehouseManagerSyncData,
  );

  final supervisorProgressBar = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.supervisorProgressBar,
  );

  final supervisorMyChecklist = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.supervisorMyChecklist,
  );

  final supervisorComplaints = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.supervisorComplaints,
  );

  final supervisorSyncData = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.supervisorSyncData,
  );

  final inventoryReport = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.inventoryReport,
  );
  final hfBeneficiaryReferral = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.beneficiaryReferral,
  );

  final deleteAll = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.deleteAll,
  );

  final manageAttendance = ShowcaseItemBuilder(
    messageLocalizationKey: i18.home.manageAttendanceLabel,
  );

  final db = ShowcaseItemBuilder(
    messageLocalizationKey: i18.home.db,
  );

  final closedHouseHold = ShowcaseItemBuilder(
    messageLocalizationKey: i18.home.closedHouseHoldLabel,
  );

  final summaryReport = ShowcaseItemBuilder(
    messageLocalizationKey: i18.home.viewSummaryReportsLabel,
  );
  final clf = ShowcaseItemBuilder(
    messageLocalizationKey: i18.homeShowcase.clf,
  );
}
