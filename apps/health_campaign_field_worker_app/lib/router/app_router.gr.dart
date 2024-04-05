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
    BeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const BeneficiaryAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BeneficiaryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    BeneficiaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDetailsRouteArgs>(
          orElse: () => const BeneficiaryDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BeneficiaryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryRegistrationWrapperRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: BeneficiaryRegistrationWrapperPage(
          key: args.key,
          initialState: args.initialState,
        )),
      );
    },
    BeneficiaryWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryWrapperRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BeneficiaryWrapperPage(
          key: args.key,
          wrapper: args.wrapper,
          isEditing: args.isEditing,
        ),
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
    ChecklistBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistBoundaryViewRouteArgs>(
          orElse: () => const ChecklistBoundaryViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChecklistBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistRouteArgs>(
          orElse: () => const ChecklistRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistPreviewRouteArgs>(
          orElse: () => const ChecklistPreviewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistViewRouteArgs>(
          orElse: () => const ChecklistViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChecklistViewPage(
          key: args.key,
          referralClientRefId: args.referralClientRefId,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistWrapperRouteArgs>(
          orElse: () => const ChecklistWrapperRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChecklistWrapperPage(
          key: args.key,
          isEditing: args.isEditing,
        )),
      );
    },
    ComplaintTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintTypeRouteArgs>(
          orElse: () => const ComplaintTypeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintTypePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsAcknowledgementRouteArgs>(
          orElse: () => const ComplaintsAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsRouteArgs>(
          orElse: () => const ComplaintsDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintsInboxFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxFilterRouteArgs>(
          orElse: () => const ComplaintsInboxFilterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxSearchPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSortRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSortRouteArgs>(
          orElse: () => const ComplaintsInboxSortRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ComplaintsInboxWrapperPage(),
      );
    },
    ComplaintsLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsLocationRouteArgs>(
          orElse: () => const ComplaintsLocationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ComplaintsLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsRegistrationWrapperRouteArgs>(
          orElse: () => const ComplaintsRegistrationWrapperRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ComplaintsRegistrationWrapperPage(
          key: args.key,
          pgrServiceModel: args.pgrServiceModel,
        )),
      );
    },
    DeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverInterventionRouteArgs>(
          orElse: () => const DeliverInterventionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    DoseAdministeredRoute.name: (routeData) {
      final args = routeData.argsAs<DoseAdministeredRouteArgs>(
          orElse: () => const DoseAdministeredRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoseAdministeredPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HFCreateReferralWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HFCreateReferralWrapperRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: HFCreateReferralWrapperPage(
          key: args.key,
          viewOnly: args.viewOnly,
          hfReferralModel: args.hfReferralModel,
        )),
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
    HouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseHoldDetailsRouteArgs>(
          orElse: () => const HouseHoldDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HouseHoldDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementRouteArgs>(
          orElse: () => const HouseholdAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
      );
    },
    HouseholdLocationRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdLocationRouteArgs>(
          orElse: () => const HouseholdLocationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HouseholdLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewRouteArgs>(
          orElse: () => const HouseholdOverviewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    IndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualDetailsRouteArgs>(
          orElse: () => const IndividualDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
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
    ReasonForDeletionRoute.name: (routeData) {
      final args = routeData.argsAs<ReasonForDeletionRouteArgs>(
          orElse: () => const ReasonForDeletionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReasonForDeletionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHousholdDelete: args.isHousholdDelete,
        ),
      );
    },
    RecordPastDeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordPastDeliveryDetailsRouteArgs>(
          orElse: () => const RecordPastDeliveryDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecordPastDeliveryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
        ),
      );
    },
    RecordReferralDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordReferralDetailsRouteArgs>(
          orElse: () => const RecordReferralDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecordReferralDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ReferBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReferBeneficiaryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReferBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          projectBeneficiaryClientRefId: args.projectBeneficiaryClientRefId,
        ),
      );
    },
    ReferralFacilityRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralFacilityRouteArgs>(
          orElse: () => const ReferralFacilityRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReferralFacilityPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ReferralReasonCheckListPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonCheckListPreviewRouteArgs>(
          orElse: () => const ReferralReasonCheckListPreviewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReferralReasonCheckListPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          referralClientRefId: args.referralClientRefId,
        ),
      );
    },
    ReferralReasonChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistRouteArgs>(
          orElse: () => const ReferralReasonChecklistRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReferralReasonChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          referralClientRefId: args.referralClientRefId,
        ),
      );
    },
    SearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryRouteArgs>(
          orElse: () => const SearchBeneficiaryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SearchReferralsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchReferralsRouteArgs>(
          orElse: () => const SearchReferralsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchReferralsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SideEffectsRoute.name: (routeData) {
      final args = routeData.argsAs<SideEffectsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SideEffectsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
          isEditing: args.isEditing,
        ),
      );
    },
    SplashAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<SplashAcknowledgementRouteArgs>(
          orElse: () => const SplashAcknowledgementRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableBackToSearch: args.enableBackToSearch,
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
    ...InventoryRoute().pagesMap,
    ...AttendanceRoute().pagesMap,
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
/// [BeneficiaryAcknowledgementPage]
class BeneficiaryAcknowledgementRoute
    extends PageRouteInfo<BeneficiaryAcknowledgementRouteArgs> {
  BeneficiaryAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableViewHousehold,
    List<PageRouteInfo>? children,
  }) : super(
          BeneficiaryAcknowledgementRoute.name,
          args: BeneficiaryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryAcknowledgementRoute';

  static const PageInfo<BeneficiaryAcknowledgementRouteArgs> page =
      PageInfo<BeneficiaryAcknowledgementRouteArgs>(name);
}

class BeneficiaryAcknowledgementRouteArgs {
  const BeneficiaryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'BeneficiaryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [BeneficiaryDetailsPage]
class BeneficiaryDetailsRoute
    extends PageRouteInfo<BeneficiaryDetailsRouteArgs> {
  BeneficiaryDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          BeneficiaryDetailsRoute.name,
          args: BeneficiaryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryDetailsRoute';

  static const PageInfo<BeneficiaryDetailsRouteArgs> page =
      PageInfo<BeneficiaryDetailsRouteArgs>(name);
}

class BeneficiaryDetailsRouteArgs {
  const BeneficiaryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'BeneficiaryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [BeneficiaryRegistrationWrapperPage]
class BeneficiaryRegistrationWrapperRoute
    extends PageRouteInfo<BeneficiaryRegistrationWrapperRouteArgs> {
  BeneficiaryRegistrationWrapperRoute({
    Key? key,
    required BeneficiaryRegistrationState initialState,
    List<PageRouteInfo>? children,
  }) : super(
          BeneficiaryRegistrationWrapperRoute.name,
          args: BeneficiaryRegistrationWrapperRouteArgs(
            key: key,
            initialState: initialState,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryRegistrationWrapperRoute';

  static const PageInfo<BeneficiaryRegistrationWrapperRouteArgs> page =
      PageInfo<BeneficiaryRegistrationWrapperRouteArgs>(name);
}

class BeneficiaryRegistrationWrapperRouteArgs {
  const BeneficiaryRegistrationWrapperRouteArgs({
    this.key,
    required this.initialState,
  });

  final Key? key;

  final BeneficiaryRegistrationState initialState;

  @override
  String toString() {
    return 'BeneficiaryRegistrationWrapperRouteArgs{key: $key, initialState: $initialState}';
  }
}

/// generated route for
/// [BeneficiaryWrapperPage]
class BeneficiaryWrapperRoute
    extends PageRouteInfo<BeneficiaryWrapperRouteArgs> {
  BeneficiaryWrapperRoute({
    Key? key,
    required HouseholdMemberWrapper wrapper,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          BeneficiaryWrapperRoute.name,
          args: BeneficiaryWrapperRouteArgs(
            key: key,
            wrapper: wrapper,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryWrapperRoute';

  static const PageInfo<BeneficiaryWrapperRouteArgs> page =
      PageInfo<BeneficiaryWrapperRouteArgs>(name);
}

class BeneficiaryWrapperRouteArgs {
  const BeneficiaryWrapperRouteArgs({
    this.key,
    required this.wrapper,
    this.isEditing = false,
  });

  final Key? key;

  final HouseholdMemberWrapper wrapper;

  final bool isEditing;

  @override
  String toString() {
    return 'BeneficiaryWrapperRouteArgs{key: $key, wrapper: $wrapper, isEditing: $isEditing}';
  }
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
/// [ChecklistBoundaryViewPage]
class ChecklistBoundaryViewRoute
    extends PageRouteInfo<ChecklistBoundaryViewRouteArgs> {
  ChecklistBoundaryViewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistBoundaryViewRoute.name,
          args: ChecklistBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistBoundaryViewRoute';

  static const PageInfo<ChecklistBoundaryViewRouteArgs> page =
      PageInfo<ChecklistBoundaryViewRouteArgs>(name);
}

class ChecklistBoundaryViewRouteArgs {
  const ChecklistBoundaryViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ChecklistBoundaryViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ChecklistPage]
class ChecklistRoute extends PageRouteInfo<ChecklistRouteArgs> {
  ChecklistRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistRoute.name,
          args: ChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistRoute';

  static const PageInfo<ChecklistRouteArgs> page =
      PageInfo<ChecklistRouteArgs>(name);
}

class ChecklistRouteArgs {
  const ChecklistRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ChecklistRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ChecklistPreviewPage]
class ChecklistPreviewRoute extends PageRouteInfo<ChecklistPreviewRouteArgs> {
  ChecklistPreviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistPreviewRoute.name,
          args: ChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistPreviewRoute';

  static const PageInfo<ChecklistPreviewRouteArgs> page =
      PageInfo<ChecklistPreviewRouteArgs>(name);
}

class ChecklistPreviewRouteArgs {
  const ChecklistPreviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ChecklistPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ChecklistViewPage]
class ChecklistViewRoute extends PageRouteInfo<ChecklistViewRouteArgs> {
  ChecklistViewRoute({
    Key? key,
    String? referralClientRefId,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistViewRoute.name,
          args: ChecklistViewRouteArgs(
            key: key,
            referralClientRefId: referralClientRefId,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistViewRoute';

  static const PageInfo<ChecklistViewRouteArgs> page =
      PageInfo<ChecklistViewRouteArgs>(name);
}

class ChecklistViewRouteArgs {
  const ChecklistViewRouteArgs({
    this.key,
    this.referralClientRefId,
    this.appLocalizations,
  });

  final Key? key;

  final String? referralClientRefId;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ChecklistViewRouteArgs{key: $key, referralClientRefId: $referralClientRefId, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ChecklistWrapperPage]
class ChecklistWrapperRoute extends PageRouteInfo<ChecklistWrapperRouteArgs> {
  ChecklistWrapperRoute({
    Key? key,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistWrapperRoute.name,
          args: ChecklistWrapperRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistWrapperRoute';

  static const PageInfo<ChecklistWrapperRouteArgs> page =
      PageInfo<ChecklistWrapperRouteArgs>(name);
}

class ChecklistWrapperRouteArgs {
  const ChecklistWrapperRouteArgs({
    this.key,
    this.isEditing = false,
  });

  final Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'ChecklistWrapperRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [ComplaintTypePage]
class ComplaintTypeRoute extends PageRouteInfo<ComplaintTypeRouteArgs> {
  ComplaintTypeRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintTypeRoute.name,
          args: ComplaintTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintTypeRoute';

  static const PageInfo<ComplaintTypeRouteArgs> page =
      PageInfo<ComplaintTypeRouteArgs>(name);
}

class ComplaintTypeRouteArgs {
  const ComplaintTypeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintTypeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsAcknowledgementRoute';

  static const PageInfo<ComplaintsAcknowledgementRouteArgs> page =
      PageInfo<ComplaintsAcknowledgementRouteArgs>(name);
}

class ComplaintsAcknowledgementRouteArgs {
  const ComplaintsAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsDetailsPage]
class ComplaintsDetailsRoute extends PageRouteInfo<ComplaintsDetailsRouteArgs> {
  ComplaintsDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsRoute.name,
          args: ComplaintsDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsRoute';

  static const PageInfo<ComplaintsDetailsRouteArgs> page =
      PageInfo<ComplaintsDetailsRouteArgs>(name);
}

class ComplaintsDetailsRouteArgs {
  const ComplaintsDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    Key? key,
    required PgrServiceModel complaint,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsDetailsViewRoute';

  static const PageInfo<ComplaintsDetailsViewRouteArgs> page =
      PageInfo<ComplaintsDetailsViewRouteArgs>(name);
}

class ComplaintsDetailsViewRouteArgs {
  const ComplaintsDetailsViewRouteArgs({
    this.key,
    required this.complaint,
  });

  final Key? key;

  final PgrServiceModel complaint;

  @override
  String toString() {
    return 'ComplaintsDetailsViewRouteArgs{key: $key, complaint: $complaint}';
  }
}

/// generated route for
/// [ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxFilterRoute';

  static const PageInfo<ComplaintsInboxFilterRouteArgs> page =
      PageInfo<ComplaintsInboxFilterRouteArgs>(name);
}

class ComplaintsInboxFilterRouteArgs {
  const ComplaintsInboxFilterRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxFilterRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsInboxPage]
class ComplaintsInboxRoute extends PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxRoute.name,
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxRoute';

  static const PageInfo<ComplaintsInboxRouteArgs> page =
      PageInfo<ComplaintsInboxRouteArgs>(name);
}

class ComplaintsInboxRouteArgs {
  const ComplaintsInboxRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSearchRoute';

  static const PageInfo<ComplaintsInboxSearchRouteArgs> page =
      PageInfo<ComplaintsInboxSearchRouteArgs>(name);
}

class ComplaintsInboxSearchRouteArgs {
  const ComplaintsInboxSearchRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSearchRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsInboxSortPage]
class ComplaintsInboxSortRoute
    extends PageRouteInfo<ComplaintsInboxSortRouteArgs> {
  ComplaintsInboxSortRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsInboxSortRoute.name,
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxSortRoute';

  static const PageInfo<ComplaintsInboxSortRouteArgs> page =
      PageInfo<ComplaintsInboxSortRouteArgs>(name);
}

class ComplaintsInboxSortRouteArgs {
  const ComplaintsInboxSortRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsInboxSortRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ComplaintsLocationPage]
class ComplaintsLocationRoute
    extends PageRouteInfo<ComplaintsLocationRouteArgs> {
  ComplaintsLocationRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsLocationRoute.name,
          args: ComplaintsLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsLocationRoute';

  static const PageInfo<ComplaintsLocationRouteArgs> page =
      PageInfo<ComplaintsLocationRouteArgs>(name);
}

class ComplaintsLocationRouteArgs {
  const ComplaintsLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ComplaintsLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsRegistrationWrapperPage]
class ComplaintsRegistrationWrapperRoute
    extends PageRouteInfo<ComplaintsRegistrationWrapperRouteArgs> {
  ComplaintsRegistrationWrapperRoute({
    Key? key,
    PgrServiceModel? pgrServiceModel,
    List<PageRouteInfo>? children,
  }) : super(
          ComplaintsRegistrationWrapperRoute.name,
          args: ComplaintsRegistrationWrapperRouteArgs(
            key: key,
            pgrServiceModel: pgrServiceModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsRegistrationWrapperRoute';

  static const PageInfo<ComplaintsRegistrationWrapperRouteArgs> page =
      PageInfo<ComplaintsRegistrationWrapperRouteArgs>(name);
}

class ComplaintsRegistrationWrapperRouteArgs {
  const ComplaintsRegistrationWrapperRouteArgs({
    this.key,
    this.pgrServiceModel,
  });

  final Key? key;

  final PgrServiceModel? pgrServiceModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationWrapperRouteArgs{key: $key, pgrServiceModel: $pgrServiceModel}';
  }
}

/// generated route for
/// [DeliverInterventionPage]
class DeliverInterventionRoute
    extends PageRouteInfo<DeliverInterventionRouteArgs> {
  DeliverInterventionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          DeliverInterventionRoute.name,
          args: DeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliverInterventionRoute';

  static const PageInfo<DeliverInterventionRouteArgs> page =
      PageInfo<DeliverInterventionRouteArgs>(name);
}

class DeliverInterventionRouteArgs {
  const DeliverInterventionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'DeliverInterventionRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [DoseAdministeredPage]
class DoseAdministeredRoute extends PageRouteInfo<DoseAdministeredRouteArgs> {
  DoseAdministeredRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          DoseAdministeredRoute.name,
          args: DoseAdministeredRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'DoseAdministeredRoute';

  static const PageInfo<DoseAdministeredRouteArgs> page =
      PageInfo<DoseAdministeredRouteArgs>(name);
}

class DoseAdministeredRouteArgs {
  const DoseAdministeredRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'DoseAdministeredRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [HFCreateReferralWrapperPage]
class HFCreateReferralWrapperRoute
    extends PageRouteInfo<HFCreateReferralWrapperRouteArgs> {
  HFCreateReferralWrapperRoute({
    Key? key,
    required bool viewOnly,
    HFReferralModel? hfReferralModel,
    List<PageRouteInfo>? children,
  }) : super(
          HFCreateReferralWrapperRoute.name,
          args: HFCreateReferralWrapperRouteArgs(
            key: key,
            viewOnly: viewOnly,
            hfReferralModel: hfReferralModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HFCreateReferralWrapperRoute';

  static const PageInfo<HFCreateReferralWrapperRouteArgs> page =
      PageInfo<HFCreateReferralWrapperRouteArgs>(name);
}

class HFCreateReferralWrapperRouteArgs {
  const HFCreateReferralWrapperRouteArgs({
    this.key,
    required this.viewOnly,
    this.hfReferralModel,
  });

  final Key? key;

  final bool viewOnly;

  final HFReferralModel? hfReferralModel;

  @override
  String toString() {
    return 'HFCreateReferralWrapperRouteArgs{key: $key, viewOnly: $viewOnly, hfReferralModel: $hfReferralModel}';
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
/// [HouseHoldDetailsPage]
class HouseHoldDetailsRoute extends PageRouteInfo<HouseHoldDetailsRouteArgs> {
  HouseHoldDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          HouseHoldDetailsRoute.name,
          args: HouseHoldDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseHoldDetailsRoute';

  static const PageInfo<HouseHoldDetailsRouteArgs> page =
      PageInfo<HouseHoldDetailsRouteArgs>(name);
}

class HouseHoldDetailsRouteArgs {
  const HouseHoldDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HouseHoldDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [HouseholdAcknowledgementPage]
class HouseholdAcknowledgementRoute
    extends PageRouteInfo<HouseholdAcknowledgementRouteArgs> {
  HouseholdAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableViewHousehold,
    List<PageRouteInfo>? children,
  }) : super(
          HouseholdAcknowledgementRoute.name,
          args: HouseholdAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdAcknowledgementRoute';

  static const PageInfo<HouseholdAcknowledgementRouteArgs> page =
      PageInfo<HouseholdAcknowledgementRouteArgs>(name);
}

class HouseholdAcknowledgementRouteArgs {
  const HouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableViewHousehold,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool? enableViewHousehold;

  @override
  String toString() {
    return 'HouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableViewHousehold: $enableViewHousehold}';
  }
}

/// generated route for
/// [HouseholdLocationPage]
class HouseholdLocationRoute extends PageRouteInfo<HouseholdLocationRouteArgs> {
  HouseholdLocationRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          HouseholdLocationRoute.name,
          args: HouseholdLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdLocationRoute';

  static const PageInfo<HouseholdLocationRouteArgs> page =
      PageInfo<HouseholdLocationRouteArgs>(name);
}

class HouseholdLocationRouteArgs {
  const HouseholdLocationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HouseholdLocationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [HouseholdOverviewPage]
class HouseholdOverviewRoute extends PageRouteInfo<HouseholdOverviewRouteArgs> {
  HouseholdOverviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          HouseholdOverviewRoute.name,
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseholdOverviewRoute';

  static const PageInfo<HouseholdOverviewRouteArgs> page =
      PageInfo<HouseholdOverviewRouteArgs>(name);
}

class HouseholdOverviewRouteArgs {
  const HouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [IndividualDetailsPage]
class IndividualDetailsRoute extends PageRouteInfo<IndividualDetailsRouteArgs> {
  IndividualDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isHeadOfHousehold = false,
    List<PageRouteInfo>? children,
  }) : super(
          IndividualDetailsRoute.name,
          args: IndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
          ),
          initialChildren: children,
        );

  static const String name = 'IndividualDetailsRoute';

  static const PageInfo<IndividualDetailsRouteArgs> page =
      PageInfo<IndividualDetailsRouteArgs>(name);
}

class IndividualDetailsRouteArgs {
  const IndividualDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isHeadOfHousehold;

  @override
  String toString() {
    return 'IndividualDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isHeadOfHousehold: $isHeadOfHousehold}';
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
/// [ReasonForDeletionPage]
class ReasonForDeletionRoute extends PageRouteInfo<ReasonForDeletionRouteArgs> {
  ReasonForDeletionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isHousholdDelete = false,
    List<PageRouteInfo>? children,
  }) : super(
          ReasonForDeletionRoute.name,
          args: ReasonForDeletionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHousholdDelete: isHousholdDelete,
          ),
          initialChildren: children,
        );

  static const String name = 'ReasonForDeletionRoute';

  static const PageInfo<ReasonForDeletionRouteArgs> page =
      PageInfo<ReasonForDeletionRouteArgs>(name);
}

class ReasonForDeletionRouteArgs {
  const ReasonForDeletionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHousholdDelete = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isHousholdDelete;

  @override
  String toString() {
    return 'ReasonForDeletionRouteArgs{key: $key, appLocalizations: $appLocalizations, isHousholdDelete: $isHousholdDelete}';
  }
}

/// generated route for
/// [RecordPastDeliveryDetailsPage]
class RecordPastDeliveryDetailsRoute
    extends PageRouteInfo<RecordPastDeliveryDetailsRouteArgs> {
  RecordPastDeliveryDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<TaskModel>? tasks,
    List<PageRouteInfo>? children,
  }) : super(
          RecordPastDeliveryDetailsRoute.name,
          args: RecordPastDeliveryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordPastDeliveryDetailsRoute';

  static const PageInfo<RecordPastDeliveryDetailsRouteArgs> page =
      PageInfo<RecordPastDeliveryDetailsRouteArgs>(name);
}

class RecordPastDeliveryDetailsRouteArgs {
  const RecordPastDeliveryDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.tasks,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final List<TaskModel>? tasks;

  @override
  String toString() {
    return 'RecordPastDeliveryDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks}';
  }
}

/// generated route for
/// [RecordReferralDetailsPage]
class RecordReferralDetailsRoute
    extends PageRouteInfo<RecordReferralDetailsRouteArgs> {
  RecordReferralDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          RecordReferralDetailsRoute.name,
          args: RecordReferralDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordReferralDetailsRoute';

  static const PageInfo<RecordReferralDetailsRouteArgs> page =
      PageInfo<RecordReferralDetailsRouteArgs>(name);
}

class RecordReferralDetailsRouteArgs {
  const RecordReferralDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'RecordReferralDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [ReferBeneficiaryPage]
class ReferBeneficiaryRoute extends PageRouteInfo<ReferBeneficiaryRouteArgs> {
  ReferBeneficiaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    required String projectBeneficiaryClientRefId,
    List<PageRouteInfo>? children,
  }) : super(
          ReferBeneficiaryRoute.name,
          args: ReferBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            projectBeneficiaryClientRefId: projectBeneficiaryClientRefId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferBeneficiaryRoute';

  static const PageInfo<ReferBeneficiaryRouteArgs> page =
      PageInfo<ReferBeneficiaryRouteArgs>(name);
}

class ReferBeneficiaryRouteArgs {
  const ReferBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    required this.projectBeneficiaryClientRefId,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  final String projectBeneficiaryClientRefId;

  @override
  String toString() {
    return 'ReferBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, projectBeneficiaryClientRefId: $projectBeneficiaryClientRefId}';
  }
}

/// generated route for
/// [ReferralFacilityPage]
class ReferralFacilityRoute extends PageRouteInfo<ReferralFacilityRouteArgs> {
  ReferralFacilityRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          ReferralFacilityRoute.name,
          args: ReferralFacilityRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralFacilityRoute';

  static const PageInfo<ReferralFacilityRouteArgs> page =
      PageInfo<ReferralFacilityRouteArgs>(name);
}

class ReferralFacilityRouteArgs {
  const ReferralFacilityRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'ReferralFacilityRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [ReferralReasonCheckListPreviewPage]
class ReferralReasonCheckListPreviewRoute
    extends PageRouteInfo<ReferralReasonCheckListPreviewRouteArgs> {
  ReferralReasonCheckListPreviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    String? referralClientRefId,
    List<PageRouteInfo>? children,
  }) : super(
          ReferralReasonCheckListPreviewRoute.name,
          args: ReferralReasonCheckListPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            referralClientRefId: referralClientRefId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReasonCheckListPreviewRoute';

  static const PageInfo<ReferralReasonCheckListPreviewRouteArgs> page =
      PageInfo<ReferralReasonCheckListPreviewRouteArgs>(name);
}

class ReferralReasonCheckListPreviewRouteArgs {
  const ReferralReasonCheckListPreviewRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    this.referralClientRefId,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  final String? referralClientRefId;

  @override
  String toString() {
    return 'ReferralReasonCheckListPreviewRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, referralClientRefId: $referralClientRefId}';
  }
}

/// generated route for
/// [ReferralReasonChecklistPage]
class ReferralReasonChecklistRoute
    extends PageRouteInfo<ReferralReasonChecklistRouteArgs> {
  ReferralReasonChecklistRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    String? referralClientRefId,
    List<PageRouteInfo>? children,
  }) : super(
          ReferralReasonChecklistRoute.name,
          args: ReferralReasonChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            referralClientRefId: referralClientRefId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralReasonChecklistRoute';

  static const PageInfo<ReferralReasonChecklistRouteArgs> page =
      PageInfo<ReferralReasonChecklistRouteArgs>(name);
}

class ReferralReasonChecklistRouteArgs {
  const ReferralReasonChecklistRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
    this.referralClientRefId,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  final String? referralClientRefId;

  @override
  String toString() {
    return 'ReferralReasonChecklistRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing, referralClientRefId: $referralClientRefId}';
  }
}

/// generated route for
/// [SearchBeneficiaryPage]
class SearchBeneficiaryRoute extends PageRouteInfo<SearchBeneficiaryRouteArgs> {
  SearchBeneficiaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          SearchBeneficiaryRoute.name,
          args: SearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBeneficiaryRoute';

  static const PageInfo<SearchBeneficiaryRouteArgs> page =
      PageInfo<SearchBeneficiaryRouteArgs>(name);
}

class SearchBeneficiaryRouteArgs {
  const SearchBeneficiaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'SearchBeneficiaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [SearchReferralsPage]
class SearchReferralsRoute extends PageRouteInfo<SearchReferralsRouteArgs> {
  SearchReferralsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<PageRouteInfo>? children,
  }) : super(
          SearchReferralsRoute.name,
          args: SearchReferralsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchReferralsRoute';

  static const PageInfo<SearchReferralsRouteArgs> page =
      PageInfo<SearchReferralsRouteArgs>(name);
}

class SearchReferralsRouteArgs {
  const SearchReferralsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'SearchReferralsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [SideEffectsPage]
class SideEffectsRoute extends PageRouteInfo<SideEffectsRouteArgs> {
  SideEffectsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    required List<TaskModel> tasks,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          SideEffectsRoute.name,
          args: SideEffectsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'SideEffectsRoute';

  static const PageInfo<SideEffectsRouteArgs> page =
      PageInfo<SideEffectsRouteArgs>(name);
}

class SideEffectsRouteArgs {
  const SideEffectsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.tasks,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final List<TaskModel> tasks;

  final bool isEditing;

  @override
  String toString() {
    return 'SideEffectsRouteArgs{key: $key, appLocalizations: $appLocalizations, tasks: $tasks, isEditing: $isEditing}';
  }
}

/// generated route for
/// [SplashAcknowledgementPage]
class SplashAcknowledgementRoute
    extends PageRouteInfo<SplashAcknowledgementRouteArgs> {
  SplashAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableBackToSearch,
    List<PageRouteInfo>? children,
  }) : super(
          SplashAcknowledgementRoute.name,
          args: SplashAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableBackToSearch: enableBackToSearch,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashAcknowledgementRoute';

  static const PageInfo<SplashAcknowledgementRouteArgs> page =
      PageInfo<SplashAcknowledgementRouteArgs>(name);
}

class SplashAcknowledgementRouteArgs {
  const SplashAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.enableBackToSearch,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool? enableBackToSearch;

  @override
  String toString() {
    return 'SplashAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, enableBackToSearch: $enableBackToSearch}';
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
