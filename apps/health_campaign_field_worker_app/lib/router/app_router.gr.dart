// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AcknowledgementRouteArgs>(
          orElse: () => const AcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    AuthenticatedRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<AuthenticatedRouteWrapperArgs>(
          orElse: () => const AuthenticatedRouteWrapperArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthenticatedPageWrapper(key: args.key),
      );
    },
    BeneficiariesReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BeneficiariesReportPage(),
      );
    },
    BoundarySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<BoundarySelectionRouteArgs>(
          orElse: () => const BoundarySelectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BoundarySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomBeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<CustomBeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const CustomBeneficiaryAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomBeneficiaryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    CustomClosedHouseholdDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomClosedHouseholdDetailsRouteArgs>(
          orElse: () => const CustomClosedHouseholdDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomClosedHouseholdDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomClosedHouseholdSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<CustomClosedHouseholdSummaryRouteArgs>(
          orElse: () => const CustomClosedHouseholdSummaryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomClosedHouseholdSummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomComplaintTypeRoute.name: (routeData) {
      final args = routeData.argsAs<CustomComplaintTypeRouteArgs>(
          orElse: () => const CustomComplaintTypeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomComplaintTypePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomComplaintsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomComplaintsDetailsRouteArgs>(
          orElse: () => const CustomComplaintsDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomComplaintsDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomDeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<CustomDeliverInterventionRouteArgs>(
          orElse: () => const CustomDeliverInterventionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomDeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    CustomDigitScannerRoute.name: (routeData) {
      final args = routeData.argsAs<CustomDigitScannerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomDigitScannerPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          quantity: args.quantity,
          isGS1code: args.isGS1code,
          gs1CodeList: args.gs1CodeList,
          singleValue: args.singleValue,
          isEditEnabled: args.isEditEnabled,
          manualEnabled: args.manualEnabled,
          scanType: args.scanType,
        ),
      );
    },
    CustomDistributionSummaryReportDetailsRoute.name: (routeData) {
      final args =
          routeData.argsAs<CustomDistributionSummaryReportDetailsRouteArgs>(
              orElse: () =>
                  const CustomDistributionSummaryReportDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomDistributionSummaryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomEumerationSummaryReportDetailsRoute.name: (routeData) {
      final args =
          routeData.argsAs<CustomEumerationSummaryReportDetailsRouteArgs>(
              orElse: () =>
                  const CustomEumerationSummaryReportDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomEumerationSummaryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomHouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomHouseHoldDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomHouseHoldDetailsPage(
          key: args.key,
          refugeeCamp: args.refugeeCamp,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomHouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<CustomHouseholdAcknowledgementRouteArgs>(
          orElse: () => const CustomHouseholdAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomHouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    CustomHouseholdLocationRoute.name: (routeData) {
      final args = routeData.argsAs<CustomHouseholdLocationRouteArgs>(
          orElse: () => const CustomHouseholdLocationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomHouseholdLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomHouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomHouseholdOverviewRouteArgs>(
          orElse: () => const CustomHouseholdOverviewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomHouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomIndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomIndividualDetailsRouteArgs>(
          orElse: () => const CustomIndividualDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomIndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
        ),
      );
    },
    CustomInventoryFacilitySelectionRoute.name: (routeData) {
      final args =
          routeData.argsAs<CustomInventoryFacilitySelectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomInventoryFacilitySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          facilities: args.facilities,
        ),
      );
    },
    CustomInventoryReportDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomInventoryReportDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomInventoryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          reportType: args.reportType,
        ),
      );
    },
    CustomInventoryReportSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<CustomInventoryReportSelectionRouteArgs>(
          orElse: () => const CustomInventoryReportSelectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomInventoryReportSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomSearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<CustomSearchBeneficiaryRouteArgs>(
          orElse: () => const CustomSearchBeneficiaryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomSearchBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomStockDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomStockDetailsRouteArgs>(
          orElse: () => const CustomStockDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomStockDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomStockReconciliationRoute.name: (routeData) {
      final args = routeData.argsAs<CustomStockReconciliationRouteArgs>(
          orElse: () => const CustomStockReconciliationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomStockReconciliationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<CustomSummaryRouteArgs>(
          orElse: () => const CustomSummaryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomSummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomSurveyFormBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomSurveyFormBoundaryViewRouteArgs>(
          orElse: () => const CustomSurveyFormBoundaryViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomSurveyFormBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomSurveyFormViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomSurveyFormViewRouteArgs>(
          orElse: () => const CustomSurveyFormViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomSurveyFormViewPage(
          key: args.key,
          referralClientRefId: args.referralClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    CustomWarehouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomWarehouseDetailsRouteArgs>(
          orElse: () => const CustomWarehouseDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomWarehouseDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DoseAdministeredVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<DoseAdministeredVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoseAdministeredVerificationPage(
          householdModel: args.householdModel,
          selectedIndividual: args.selectedIndividual,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageSelectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ProjectFacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectFacilitySelectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectFacilitySelectionPage(
          key: args.key,
          projectFacilities: args.projectFacilities,
        ),
      );
    },
    ProjectSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectSelectionRouteArgs>(
          orElse: () => const ProjectSelectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    UnauthenticatedRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedPageWrapper(),
      );
    },
    UserQRDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserQRDetailsRouteArgs>(
          orElse: () => const UserQRDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserQRDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ...RegistrationDeliveryRoute().pagesMap,
    ...InventoryRoute().pagesMap,
    ...AttendanceRoute().pagesMap,
    ...ClosedHouseholdPackageRoute().pagesMap,
    ...ComplaintsRoute().pagesMap,
    ...SurveyFormRoute().pagesMap,
  };
}

/// generated route for
/// [AcknowledgementPage]
class AcknowledgementRoute extends PageRouteInfo<AcknowledgementRouteArgs> {
  AcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<PageRouteInfo>? children,
  }) : super(
          AcknowledgementRoute.name,
          args: AcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'AcknowledgementRoute';

  static const PageInfo<AcknowledgementRouteArgs> page =
      PageInfo<AcknowledgementRouteArgs>(name);
}

class AcknowledgementRouteArgs {
  const AcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'AcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [AuthenticatedPageWrapper]
class AuthenticatedRouteWrapper
    extends PageRouteInfo<AuthenticatedRouteWrapperArgs> {
  AuthenticatedRouteWrapper({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthenticatedRouteWrapper.name,
          args: AuthenticatedRouteWrapperArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapper';

  static const PageInfo<AuthenticatedRouteWrapperArgs> page =
      PageInfo<AuthenticatedRouteWrapperArgs>(name);
}

class AuthenticatedRouteWrapperArgs {
  const AuthenticatedRouteWrapperArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthenticatedRouteWrapperArgs{key: $key}';
  }
}

/// generated route for
/// [BeneficiariesReportPage]
class BeneficiariesReportRoute extends PageRouteInfo<void> {
  const BeneficiariesReportRoute({List<PageRouteInfo>? children})
      : super(
          BeneficiariesReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'BeneficiariesReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BoundarySelectionPage]
class BoundarySelectionRoute extends PageRouteInfo<BoundarySelectionRouteArgs> {
  BoundarySelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          BoundarySelectionRoute.name,
          args: BoundarySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BoundarySelectionRoute';

  static const PageInfo<BoundarySelectionRouteArgs> page =
      PageInfo<BoundarySelectionRouteArgs>(name);
}

class BoundarySelectionRouteArgs {
  const BoundarySelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'BoundarySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomBeneficiaryAcknowledgementPage]
class CustomBeneficiaryAcknowledgementRoute
    extends PageRouteInfo<CustomBeneficiaryAcknowledgementRouteArgs> {
  CustomBeneficiaryAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableViewHousehold,
    List<PageRouteInfo>? children,
  }) : super(
          CustomBeneficiaryAcknowledgementRoute.name,
          args: CustomBeneficiaryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomBeneficiaryAcknowledgementRoute';

  static const PageInfo<CustomBeneficiaryAcknowledgementRouteArgs> page =
      PageInfo<CustomBeneficiaryAcknowledgementRouteArgs>(name);
}

class CustomBeneficiaryAcknowledgementRouteArgs {
  const CustomBeneficiaryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'CustomBeneficiaryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [CustomClosedHouseholdDetailsPage]
class CustomClosedHouseholdDetailsRoute
    extends PageRouteInfo<CustomClosedHouseholdDetailsRouteArgs> {
  CustomClosedHouseholdDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomClosedHouseholdDetailsRoute.name,
          args: CustomClosedHouseholdDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomClosedHouseholdDetailsRoute';

  static const PageInfo<CustomClosedHouseholdDetailsRouteArgs> page =
      PageInfo<CustomClosedHouseholdDetailsRouteArgs>(name);
}

class CustomClosedHouseholdDetailsRouteArgs {
  const CustomClosedHouseholdDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'CustomClosedHouseholdDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomClosedHouseholdSummaryPage]
class CustomClosedHouseholdSummaryRoute
    extends PageRouteInfo<CustomClosedHouseholdSummaryRouteArgs> {
  CustomClosedHouseholdSummaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomClosedHouseholdSummaryRoute.name,
          args: CustomClosedHouseholdSummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomClosedHouseholdSummaryRoute';

  static const PageInfo<CustomClosedHouseholdSummaryRouteArgs> page =
      PageInfo<CustomClosedHouseholdSummaryRouteArgs>(name);
}

class CustomClosedHouseholdSummaryRouteArgs {
  const CustomClosedHouseholdSummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'CustomClosedHouseholdSummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomComplaintTypePage]
class CustomComplaintTypeRoute
    extends PageRouteInfo<CustomComplaintTypeRouteArgs> {
  CustomComplaintTypeRoute({
    Key? key,
    ComplaintsLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomComplaintTypeRoute.name,
          args: CustomComplaintTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomComplaintTypeRoute';

  static const PageInfo<CustomComplaintTypeRouteArgs> page =
      PageInfo<CustomComplaintTypeRouteArgs>(name);
}

class CustomComplaintTypeRouteArgs {
  const CustomComplaintTypeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomComplaintTypeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomComplaintsDetailsPage]
class CustomComplaintsDetailsRoute
    extends PageRouteInfo<CustomComplaintsDetailsRouteArgs> {
  CustomComplaintsDetailsRoute({
    Key? key,
    ComplaintsLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomComplaintsDetailsRoute.name,
          args: CustomComplaintsDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomComplaintsDetailsRoute';

  static const PageInfo<CustomComplaintsDetailsRouteArgs> page =
      PageInfo<CustomComplaintsDetailsRouteArgs>(name);
}

class CustomComplaintsDetailsRouteArgs {
  const CustomComplaintsDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final ComplaintsLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomComplaintsDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomDeliverInterventionPage]
class CustomDeliverInterventionRoute
    extends PageRouteInfo<CustomDeliverInterventionRouteArgs> {
  CustomDeliverInterventionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          CustomDeliverInterventionRoute.name,
          args: CustomDeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomDeliverInterventionRoute';

  static const PageInfo<CustomDeliverInterventionRouteArgs> page =
      PageInfo<CustomDeliverInterventionRouteArgs>(name);
}

class CustomDeliverInterventionRouteArgs {
  const CustomDeliverInterventionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'CustomDeliverInterventionRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [CustomDigitScannerPage]
class CustomDigitScannerRoute
    extends PageRouteInfo<CustomDigitScannerRouteArgs> {
  CustomDigitScannerRoute({
    Key? key,
    ScannerLocalization? appLocalizations,
    required int quantity,
    required bool isGS1code,
    List<GS1Barcode> gs1CodeList = const [],
    bool singleValue = false,
    bool isEditEnabled = false,
    bool manualEnabled = true,
    ScanType scanType = ScanType.others,
    List<PageRouteInfo>? children,
  }) : super(
          CustomDigitScannerRoute.name,
          args: CustomDigitScannerRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            quantity: quantity,
            isGS1code: isGS1code,
            gs1CodeList: gs1CodeList,
            singleValue: singleValue,
            isEditEnabled: isEditEnabled,
            manualEnabled: manualEnabled,
            scanType: scanType,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomDigitScannerRoute';

  static const PageInfo<CustomDigitScannerRouteArgs> page =
      PageInfo<CustomDigitScannerRouteArgs>(name);
}

class CustomDigitScannerRouteArgs {
  const CustomDigitScannerRouteArgs({
    this.key,
    this.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.gs1CodeList = const [],
    this.singleValue = false,
    this.isEditEnabled = false,
    this.manualEnabled = true,
    this.scanType = ScanType.others,
  });

  final Key? key;

  final ScannerLocalization? appLocalizations;

  final int quantity;

  final bool isGS1code;

  final List<GS1Barcode> gs1CodeList;

  final bool singleValue;

  final bool isEditEnabled;

  final bool manualEnabled;

  final ScanType scanType;

  @override
  String toString() {
    return 'CustomDigitScannerRouteArgs{key: $key, appLocalizations: $appLocalizations, quantity: $quantity, isGS1code: $isGS1code, gs1CodeList: $gs1CodeList, singleValue: $singleValue, isEditEnabled: $isEditEnabled, manualEnabled: $manualEnabled, scanType: $scanType}';
  }
}

/// generated route for
/// [CustomDistributionSummaryReportDetailsPage]
class CustomDistributionSummaryReportDetailsRoute
    extends PageRouteInfo<CustomDistributionSummaryReportDetailsRouteArgs> {
  CustomDistributionSummaryReportDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomDistributionSummaryReportDetailsRoute.name,
          args: CustomDistributionSummaryReportDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomDistributionSummaryReportDetailsRoute';

  static const PageInfo<CustomDistributionSummaryReportDetailsRouteArgs> page =
      PageInfo<CustomDistributionSummaryReportDetailsRouteArgs>(name);
}

class CustomDistributionSummaryReportDetailsRouteArgs {
  const CustomDistributionSummaryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'CustomDistributionSummaryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomEumerationSummaryReportDetailsPage]
class CustomEumerationSummaryReportDetailsRoute
    extends PageRouteInfo<CustomEumerationSummaryReportDetailsRouteArgs> {
  CustomEumerationSummaryReportDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomEumerationSummaryReportDetailsRoute.name,
          args: CustomEumerationSummaryReportDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomEumerationSummaryReportDetailsRoute';

  static const PageInfo<CustomEumerationSummaryReportDetailsRouteArgs> page =
      PageInfo<CustomEumerationSummaryReportDetailsRouteArgs>(name);
}

class CustomEumerationSummaryReportDetailsRouteArgs {
  const CustomEumerationSummaryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'CustomEumerationSummaryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomHouseHoldDetailsPage]
class CustomHouseHoldDetailsRoute
    extends PageRouteInfo<CustomHouseHoldDetailsRouteArgs> {
  CustomHouseHoldDetailsRoute({
    Key? key,
    required String? refugeeCamp,
    RegistrationDeliveryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomHouseHoldDetailsRoute.name,
          args: CustomHouseHoldDetailsRouteArgs(
            key: key,
            refugeeCamp: refugeeCamp,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomHouseHoldDetailsRoute';

  static const PageInfo<CustomHouseHoldDetailsRouteArgs> page =
      PageInfo<CustomHouseHoldDetailsRouteArgs>(name);
}

class CustomHouseHoldDetailsRouteArgs {
  const CustomHouseHoldDetailsRouteArgs({
    this.key,
    required this.refugeeCamp,
    this.appLocalizations,
  });

  final Key? key;

  final String? refugeeCamp;

  final RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomHouseHoldDetailsRouteArgs{key: $key, refugeeCamp: $refugeeCamp, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomHouseholdAcknowledgementPage]
class CustomHouseholdAcknowledgementRoute
    extends PageRouteInfo<CustomHouseholdAcknowledgementRouteArgs> {
  CustomHouseholdAcknowledgementRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    bool? enableViewHousehold,
    List<PageRouteInfo>? children,
  }) : super(
          CustomHouseholdAcknowledgementRoute.name,
          args: CustomHouseholdAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomHouseholdAcknowledgementRoute';

  static const PageInfo<CustomHouseholdAcknowledgementRouteArgs> page =
      PageInfo<CustomHouseholdAcknowledgementRouteArgs>(name);
}

class CustomHouseholdAcknowledgementRouteArgs {
  const CustomHouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'CustomHouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [CustomHouseholdLocationPage]
class CustomHouseholdLocationRoute
    extends PageRouteInfo<CustomHouseholdLocationRouteArgs> {
  CustomHouseholdLocationRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomHouseholdLocationRoute.name,
          args: CustomHouseholdLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomHouseholdLocationRoute';

  static const PageInfo<CustomHouseholdLocationRouteArgs> page =
      PageInfo<CustomHouseholdLocationRouteArgs>(name);
}

class CustomHouseholdLocationRouteArgs {
  const CustomHouseholdLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomHouseholdLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomHouseholdOverviewPage]
class CustomHouseholdOverviewRoute
    extends PageRouteInfo<CustomHouseholdOverviewRouteArgs> {
  CustomHouseholdOverviewRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomHouseholdOverviewRoute.name,
          args: CustomHouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomHouseholdOverviewRoute';

  static const PageInfo<CustomHouseholdOverviewRouteArgs> page =
      PageInfo<CustomHouseholdOverviewRouteArgs>(name);
}

class CustomHouseholdOverviewRouteArgs {
  const CustomHouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomHouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomIndividualDetailsPage]
class CustomIndividualDetailsRoute
    extends PageRouteInfo<CustomIndividualDetailsRouteArgs> {
  CustomIndividualDetailsRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    bool isHeadOfHousehold = true,
    List<PageRouteInfo>? children,
  }) : super(
          CustomIndividualDetailsRoute.name,
          args: CustomIndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomIndividualDetailsRoute';

  static const PageInfo<CustomIndividualDetailsRouteArgs> page =
      PageInfo<CustomIndividualDetailsRouteArgs>(name);
}

class CustomIndividualDetailsRouteArgs {
  const CustomIndividualDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHeadOfHousehold = true,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  final bool isHeadOfHousehold;

  @override
  String toString() {
    return 'CustomIndividualDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isHeadOfHousehold: $isHeadOfHousehold}';
  }
}

/// generated route for
/// [CustomInventoryFacilitySelectionPage]
class CustomInventoryFacilitySelectionRoute
    extends PageRouteInfo<CustomInventoryFacilitySelectionRouteArgs> {
  CustomInventoryFacilitySelectionRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    required List<FacilityModel> facilities,
    List<PageRouteInfo>? children,
  }) : super(
          CustomInventoryFacilitySelectionRoute.name,
          args: CustomInventoryFacilitySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomInventoryFacilitySelectionRoute';

  static const PageInfo<CustomInventoryFacilitySelectionRouteArgs> page =
      PageInfo<CustomInventoryFacilitySelectionRouteArgs>(name);
}

class CustomInventoryFacilitySelectionRouteArgs {
  const CustomInventoryFacilitySelectionRouteArgs({
    this.key,
    this.appLocalizations,
    required this.facilities,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final List<FacilityModel> facilities;

  @override
  String toString() {
    return 'CustomInventoryFacilitySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations, facilities: $facilities}';
  }
}

/// generated route for
/// [CustomInventoryReportDetailsPage]
class CustomInventoryReportDetailsRoute
    extends PageRouteInfo<CustomInventoryReportDetailsRouteArgs> {
  CustomInventoryReportDetailsRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    required InventoryReportType reportType,
    List<PageRouteInfo>? children,
  }) : super(
          CustomInventoryReportDetailsRoute.name,
          args: CustomInventoryReportDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            reportType: reportType,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomInventoryReportDetailsRoute';

  static const PageInfo<CustomInventoryReportDetailsRouteArgs> page =
      PageInfo<CustomInventoryReportDetailsRouteArgs>(name);
}

class CustomInventoryReportDetailsRouteArgs {
  const CustomInventoryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.reportType,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final InventoryReportType reportType;

  @override
  String toString() {
    return 'CustomInventoryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, reportType: $reportType}';
  }
}

/// generated route for
/// [CustomInventoryReportSelectionPage]
class CustomInventoryReportSelectionRoute
    extends PageRouteInfo<CustomInventoryReportSelectionRouteArgs> {
  CustomInventoryReportSelectionRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomInventoryReportSelectionRoute.name,
          args: CustomInventoryReportSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomInventoryReportSelectionRoute';

  static const PageInfo<CustomInventoryReportSelectionRouteArgs> page =
      PageInfo<CustomInventoryReportSelectionRouteArgs>(name);
}

class CustomInventoryReportSelectionRouteArgs {
  const CustomInventoryReportSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomInventoryReportSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomSearchBeneficiaryPage]
class CustomSearchBeneficiaryRoute
    extends PageRouteInfo<CustomSearchBeneficiaryRouteArgs> {
  CustomSearchBeneficiaryRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomSearchBeneficiaryRoute.name,
          args: CustomSearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomSearchBeneficiaryRoute';

  static const PageInfo<CustomSearchBeneficiaryRouteArgs> page =
      PageInfo<CustomSearchBeneficiaryRouteArgs>(name);
}

class CustomSearchBeneficiaryRouteArgs {
  const CustomSearchBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomSearchBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomStockDetailsPage]
class CustomStockDetailsRoute
    extends PageRouteInfo<CustomStockDetailsRouteArgs> {
  CustomStockDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomStockDetailsRoute.name,
          args: CustomStockDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomStockDetailsRoute';

  static const PageInfo<CustomStockDetailsRouteArgs> page =
      PageInfo<CustomStockDetailsRouteArgs>(name);
}

class CustomStockDetailsRouteArgs {
  const CustomStockDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'CustomStockDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomStockReconciliationPage]
class CustomStockReconciliationRoute
    extends PageRouteInfo<CustomStockReconciliationRouteArgs> {
  CustomStockReconciliationRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomStockReconciliationRoute.name,
          args: CustomStockReconciliationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomStockReconciliationRoute';

  static const PageInfo<CustomStockReconciliationRouteArgs> page =
      PageInfo<CustomStockReconciliationRouteArgs>(name);
}

class CustomStockReconciliationRouteArgs {
  const CustomStockReconciliationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomStockReconciliationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomSummaryPage]
class CustomSummaryRoute extends PageRouteInfo<CustomSummaryRouteArgs> {
  CustomSummaryRoute({
    Key? key,
    RegistrationDeliveryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomSummaryRoute.name,
          args: CustomSummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomSummaryRoute';

  static const PageInfo<CustomSummaryRouteArgs> page =
      PageInfo<CustomSummaryRouteArgs>(name);
}

class CustomSummaryRouteArgs {
  const CustomSummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final RegistrationDeliveryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomSummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomSurveyFormBoundaryViewPage]
class CustomSurveyFormBoundaryViewRoute
    extends PageRouteInfo<CustomSurveyFormBoundaryViewRouteArgs> {
  CustomSurveyFormBoundaryViewRoute({
    Key? key,
    SurveyFormLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomSurveyFormBoundaryViewRoute.name,
          args: CustomSurveyFormBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomSurveyFormBoundaryViewRoute';

  static const PageInfo<CustomSurveyFormBoundaryViewRouteArgs> page =
      PageInfo<CustomSurveyFormBoundaryViewRouteArgs>(name);
}

class CustomSurveyFormBoundaryViewRouteArgs {
  const CustomSurveyFormBoundaryViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomSurveyFormBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomSurveyFormViewPage]
class CustomSurveyFormViewRoute
    extends PageRouteInfo<CustomSurveyFormViewRouteArgs> {
  CustomSurveyFormViewRoute({
    Key? key,
    String? referralClientRefId,
    SurveyFormLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomSurveyFormViewRoute.name,
          args: CustomSurveyFormViewRouteArgs(
            key: key,
            referralClientRefId: referralClientRefId,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomSurveyFormViewRoute';

  static const PageInfo<CustomSurveyFormViewRouteArgs> page =
      PageInfo<CustomSurveyFormViewRouteArgs>(name);
}

class CustomSurveyFormViewRouteArgs {
  const CustomSurveyFormViewRouteArgs({
    this.key,
    this.referralClientRefId,
    this.appLocalizations,
  });

  final Key? key;

  final String? referralClientRefId;

  final SurveyFormLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomSurveyFormViewRouteArgs{key: $key, referralClientRefId: $referralClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [CustomWarehouseDetailsPage]
class CustomWarehouseDetailsRoute
    extends PageRouteInfo<CustomWarehouseDetailsRouteArgs> {
  CustomWarehouseDetailsRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          CustomWarehouseDetailsRoute.name,
          args: CustomWarehouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomWarehouseDetailsRoute';

  static const PageInfo<CustomWarehouseDetailsRouteArgs> page =
      PageInfo<CustomWarehouseDetailsRouteArgs>(name);
}

class CustomWarehouseDetailsRouteArgs {
  const CustomWarehouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'CustomWarehouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [DoseAdministeredVerificationPage]
class DoseAdministeredVerificationRoute
    extends PageRouteInfo<DoseAdministeredVerificationRouteArgs> {
  DoseAdministeredVerificationRoute({
    required HouseholdModel householdModel,
    required IndividualModel? selectedIndividual,
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          DoseAdministeredVerificationRoute.name,
          args: DoseAdministeredVerificationRouteArgs(
            householdModel: householdModel,
            selectedIndividual: selectedIndividual,
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DoseAdministeredVerificationRoute';

  static const PageInfo<DoseAdministeredVerificationRouteArgs> page =
      PageInfo<DoseAdministeredVerificationRouteArgs>(name);
}

class DoseAdministeredVerificationRouteArgs {
  const DoseAdministeredVerificationRouteArgs({
    required this.householdModel,
    required this.selectedIndividual,
    this.key,
    this.appLocalizations,
  });

  final HouseholdModel householdModel;

  final IndividualModel? selectedIndividual;

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'DoseAdministeredVerificationRouteArgs{householdModel: $householdModel, selectedIndividual: $selectedIndividual, key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute({List<PageRouteInfo>? children})
      : super(
          LanguageSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ProjectFacilitySelectionPage]
class ProjectFacilitySelectionRoute
    extends PageRouteInfo<ProjectFacilitySelectionRouteArgs> {
  ProjectFacilitySelectionRoute({
    Key? key,
    required List<ProjectFacilityModel> projectFacilities,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectFacilitySelectionRoute.name,
          args: ProjectFacilitySelectionRouteArgs(
            key: key,
            projectFacilities: projectFacilities,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectFacilitySelectionRoute';

  static const PageInfo<ProjectFacilitySelectionRouteArgs> page =
      PageInfo<ProjectFacilitySelectionRouteArgs>(name);
}

class ProjectFacilitySelectionRouteArgs {
  const ProjectFacilitySelectionRouteArgs({
    this.key,
    required this.projectFacilities,
  });

  final Key? key;

  final List<ProjectFacilityModel> projectFacilities;

  @override
  String toString() {
    return 'ProjectFacilitySelectionRouteArgs{key: $key, projectFacilities: $projectFacilities}';
  }
}

/// generated route for
/// [ProjectSelectionPage]
class ProjectSelectionRoute extends PageRouteInfo<ProjectSelectionRouteArgs> {
  ProjectSelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectSelectionRoute.name,
          args: ProjectSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectSelectionRoute';

  static const PageInfo<ProjectSelectionRouteArgs> page =
      PageInfo<ProjectSelectionRouteArgs>(name);
}

class ProjectSelectionRouteArgs {
  const ProjectSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ProjectSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [UnauthenticatedPageWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserQRDetailsPage]
class UserQRDetailsRoute extends PageRouteInfo<UserQRDetailsRouteArgs> {
  UserQRDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          UserQRDetailsRoute.name,
          args: UserQRDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'UserQRDetailsRoute';

  static const PageInfo<UserQRDetailsRouteArgs> page =
      PageInfo<UserQRDetailsRouteArgs>(name);
}

class UserQRDetailsRouteArgs {
  const UserQRDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'UserQRDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
