// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UnauthenticatedRouteWrapper.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedPageWrapper(),
      );
    },
    AuthenticatedRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<AuthenticatedRouteWrapperArgs>(
          orElse: () => const AuthenticatedRouteWrapperArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AuthenticatedPageWrapper(key: args.key),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguageSelectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SearchBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBeneficiaryRouteArgs>(
          orElse: () => const SearchBeneficiaryRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SearchBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BeneficiaryRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryRegistrationWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BeneficiaryWrapperPage(
          key: args.key,
          wrapper: args.wrapper,
          isEditing: args.isEditing,
        ),
      );
    },
    ChecklistWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistWrapperRouteArgs>(
          orElse: () => const ChecklistWrapperRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChecklistWrapperPage(
          key: args.key,
          isEditing: args.isEditing,
        )),
      );
    },
    AcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<AcknowledgementRouteArgs>(
          orElse: () => const AcknowledgementRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsAcknowledgementRouteArgs>(
          orElse: () => const ComplaintsAcknowledgementRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    RecordStockWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<RecordStockWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RecordStockWrapperPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    ManageStocksRoute.name: (routeData) {
      final args = routeData.argsAs<ManageStocksRouteArgs>(
          orElse: () => const ManageStocksRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ManageStocksPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    StockReconciliationRoute.name: (routeData) {
      final args = routeData.argsAs<StockReconciliationRouteArgs>(
          orElse: () => const StockReconciliationRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StockReconciliationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    FacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<FacilitySelectionRouteArgs>();
      return MaterialPageX<FacilityModel>(
        routeData: routeData,
        child: FacilitySelectionPage(
          key: args.key,
          facilities: args.facilities,
        ),
      );
    },
    InventoryReportSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportSelectionRouteArgs>(
          orElse: () => const InventoryReportSelectionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: InventoryReportSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    InventoryReportDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: InventoryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          reportType: args.reportType,
        )),
      );
    },
    ProjectSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectSelectionRouteArgs>(
          orElse: () => const ProjectSelectionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProjectSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    BoundarySelectionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BoundarySelectionPage(),
      );
    },
    ComplaintsInboxWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ComplaintsInboxWrapperPage(),
      );
    },
    ComplaintsRegistrationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsRegistrationWrapperRouteArgs>(
          orElse: () => const ComplaintsRegistrationWrapperRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ComplaintsRegistrationWrapperPage(
          key: args.key,
          pgrServiceModel: args.pgrServiceModel,
        )),
      );
    },
    IndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualDetailsRouteArgs>(
          orElse: () => const IndividualDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: IndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
        ),
      );
    },
    HouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseHoldDetailsRouteArgs>(
          orElse: () => const HouseHoldDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HouseHoldDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HouseholdLocationRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdLocationRouteArgs>(
          orElse: () => const HouseholdLocationRouteArgs());
      return MaterialPageX<dynamic>(
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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverInterventionRouteArgs>(
          orElse: () => const DeliverInterventionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    AdverseEventsRoute.name: (routeData) {
      final args = routeData.argsAs<AdverseEventsRouteArgs>(
          orElse: () => const AdverseEventsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AdverseEventsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ReasonForDeletionRoute.name: (routeData) {
      final args = routeData.argsAs<ReasonForDeletionRouteArgs>(
          orElse: () => const ReasonForDeletionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReasonForDeletionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHousholdDelete: args.isHousholdDelete,
        ),
      );
    },
    ChecklistViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistViewRouteArgs>(
          orElse: () => const ChecklistViewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChecklistViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistRouteArgs>(
          orElse: () => const ChecklistRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistBoundaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistBoundaryViewRouteArgs>(
          orElse: () => const ChecklistBoundaryViewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChecklistBoundaryViewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ChecklistPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistPreviewRouteArgs>(
          orElse: () => const ChecklistPreviewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChecklistPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    WarehouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WarehouseDetailsRouteArgs>(
          orElse: () => const WarehouseDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WarehouseDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    StockDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailsRouteArgs>(
          orElse: () => const StockDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StockDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxRouteArgs>(
          orElse: () => const ComplaintsInboxRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxFilterRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxFilterRouteArgs>(
          orElse: () => const ComplaintsInboxFilterRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxFilterPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsInboxSearchRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsInboxSearchRouteArgs>(
          orElse: () => const ComplaintsInboxSearchRouteArgs());
      return MaterialPageX<dynamic>(
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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsInboxSortPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsDetailsViewPage(
          key: args.key,
          complaint: args.complaint,
        ),
      );
    },
    ComplaintTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintTypeRouteArgs>(
          orElse: () => const ComplaintTypeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintTypePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsLocationRouteArgs>(
          orElse: () => const ComplaintsLocationRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsLocationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ComplaintsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ComplaintsDetailsRouteArgs>(
          orElse: () => const ComplaintsDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ComplaintsDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: UnauthenticatedRouteWrapper.name,
              redirectTo: 'language_selection',
              fullMatch: true,
            ),
            RouteConfig(
              LanguageSelectionRoute.name,
              path: 'language_selection',
              parent: UnauthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: UnauthenticatedRouteWrapper.name,
            ),
          ],
        ),
        RouteConfig(
          AuthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: AuthenticatedRouteWrapper.name,
              redirectTo: 'select-project',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              SearchBeneficiaryRoute.name,
              path: 'search-beneficiary',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              BeneficiaryRegistrationWrapperRoute.name,
              path: 'beneficiary-registration',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: BeneficiaryRegistrationWrapperRoute.name,
                  redirectTo: 'household-location',
                  fullMatch: true,
                ),
                RouteConfig(
                  IndividualDetailsRoute.name,
                  path: 'individual-details',
                  parent: BeneficiaryRegistrationWrapperRoute.name,
                ),
                RouteConfig(
                  HouseHoldDetailsRoute.name,
                  path: 'household-details',
                  parent: BeneficiaryRegistrationWrapperRoute.name,
                ),
                RouteConfig(
                  HouseholdLocationRoute.name,
                  path: 'household-location',
                  parent: BeneficiaryRegistrationWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              BeneficiaryWrapperRoute.name,
              path: 'beneficiary',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: BeneficiaryWrapperRoute.name,
                  redirectTo: 'overview',
                  fullMatch: true,
                ),
                RouteConfig(
                  HouseholdOverviewRoute.name,
                  path: 'overview',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  DeliverInterventionRoute.name,
                  path: 'deliver-intervention',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  AdverseEventsRoute.name,
                  path: 'adverse-events',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  ReasonForDeletionRoute.name,
                  path: 'reason-for-deletion',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  ChecklistViewRoute.name,
                  path: 'view',
                  parent: BeneficiaryWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              ChecklistWrapperRoute.name,
              path: 'checklist',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  ChecklistRoute.name,
                  path: '',
                  parent: ChecklistWrapperRoute.name,
                ),
                RouteConfig(
                  ChecklistBoundaryViewRoute.name,
                  path: 'view-boundary',
                  parent: ChecklistWrapperRoute.name,
                ),
                RouteConfig(
                  ChecklistViewRoute.name,
                  path: 'view',
                  parent: ChecklistWrapperRoute.name,
                ),
                RouteConfig(
                  ChecklistPreviewRoute.name,
                  path: 'preview',
                  parent: ChecklistWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              AcknowledgementRoute.name,
              path: 'acknowledgement',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ComplaintsAcknowledgementRoute.name,
              path: 'complaints-acknowledgement',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              RecordStockWrapperRoute.name,
              path: 'record-stock',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: RecordStockWrapperRoute.name,
                  redirectTo: 'warehouse-details',
                  fullMatch: true,
                ),
                RouteConfig(
                  WarehouseDetailsRoute.name,
                  path: 'warehouse-details',
                  parent: RecordStockWrapperRoute.name,
                ),
                RouteConfig(
                  StockDetailsRoute.name,
                  path: 'details',
                  parent: RecordStockWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              ManageStocksRoute.name,
              path: 'manage-stocks',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              StockReconciliationRoute.name,
              path: 'stock-reconciliation',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              FacilitySelectionRoute.name,
              path: 'select-facilities',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              InventoryReportSelectionRoute.name,
              path: 'inventory-report-selection',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              InventoryReportDetailsRoute.name,
              path: 'inventory-report-details',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ProjectSelectionRoute.name,
              path: 'select-project',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              BoundarySelectionRoute.name,
              path: 'select-boundary',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ComplaintsInboxWrapperRoute.name,
              path: 'complaints-inbox',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ComplaintsInboxWrapperRoute.name,
                  redirectTo: 'complaints-inbox-items',
                  fullMatch: true,
                ),
                RouteConfig(
                  ComplaintsInboxRoute.name,
                  path: 'complaints-inbox-items',
                  parent: ComplaintsInboxWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsInboxFilterRoute.name,
                  path: 'complaints-inbox-filter',
                  parent: ComplaintsInboxWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsInboxSearchRoute.name,
                  path: 'complaints-inbox-search',
                  parent: ComplaintsInboxWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsInboxSortRoute.name,
                  path: 'complaints-inbox-sort',
                  parent: ComplaintsInboxWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsDetailsViewRoute.name,
                  path: 'complaints-inbox-view-details',
                  parent: ComplaintsInboxWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              ComplaintsRegistrationWrapperRoute.name,
              path: 'complaints-registration',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ComplaintsRegistrationWrapperRoute.name,
                  redirectTo: 'complaints-type',
                  fullMatch: true,
                ),
                RouteConfig(
                  ComplaintTypeRoute.name,
                  path: 'complaints-type',
                  parent: ComplaintsRegistrationWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsLocationRoute.name,
                  path: 'complaints-location',
                  parent: ComplaintsRegistrationWrapperRoute.name,
                ),
                RouteConfig(
                  ComplaintsDetailsRoute.name,
                  path: 'complaints-details',
                  parent: ComplaintsRegistrationWrapperRoute.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [UnauthenticatedPageWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouteWrapper';
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
          path: '/',
          args: AuthenticatedRouteWrapperArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapper';
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
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute()
      : super(
          LanguageSelectionRoute.name,
          path: 'language_selection',
        );

  static const String name = 'LanguageSelectionRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'LoginRoute';
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          HomeRoute.name,
          path: 'home',
          args: HomeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HomeRoute';
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
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ProfileRoute.name,
          path: 'profile',
          args: ProfileRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ProfileRoute';
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
/// [SearchBeneficiaryPage]
class SearchBeneficiaryRoute extends PageRouteInfo<SearchBeneficiaryRouteArgs> {
  SearchBeneficiaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          SearchBeneficiaryRoute.name,
          path: 'search-beneficiary',
          args: SearchBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'SearchBeneficiaryRoute';
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
/// [BeneficiaryRegistrationWrapperPage]
class BeneficiaryRegistrationWrapperRoute
    extends PageRouteInfo<BeneficiaryRegistrationWrapperRouteArgs> {
  BeneficiaryRegistrationWrapperRoute({
    Key? key,
    required BeneficiaryRegistrationState initialState,
    List<PageRouteInfo>? children,
  }) : super(
          BeneficiaryRegistrationWrapperRoute.name,
          path: 'beneficiary-registration',
          args: BeneficiaryRegistrationWrapperRouteArgs(
            key: key,
            initialState: initialState,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryRegistrationWrapperRoute';
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
          path: 'beneficiary',
          args: BeneficiaryWrapperRouteArgs(
            key: key,
            wrapper: wrapper,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'BeneficiaryWrapperRoute';
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
/// [ChecklistWrapperPage]
class ChecklistWrapperRoute extends PageRouteInfo<ChecklistWrapperRouteArgs> {
  ChecklistWrapperRoute({
    Key? key,
    bool isEditing = false,
    List<PageRouteInfo>? children,
  }) : super(
          ChecklistWrapperRoute.name,
          path: 'checklist',
          args: ChecklistWrapperRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
          initialChildren: children,
        );

  static const String name = 'ChecklistWrapperRoute';
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
/// [AcknowledgementPage]
class AcknowledgementRoute extends PageRouteInfo<AcknowledgementRouteArgs> {
  AcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          AcknowledgementRoute.name,
          path: 'acknowledgement',
          args: AcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'AcknowledgementRoute';
}

class AcknowledgementRouteArgs {
  const AcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'AcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsAcknowledgementPage]
class ComplaintsAcknowledgementRoute
    extends PageRouteInfo<ComplaintsAcknowledgementRouteArgs> {
  ComplaintsAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsAcknowledgementRoute.name,
          path: 'complaints-acknowledgement',
          args: ComplaintsAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsAcknowledgementRoute';
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
/// [RecordStockWrapperPage]
class RecordStockWrapperRoute
    extends PageRouteInfo<RecordStockWrapperRouteArgs> {
  RecordStockWrapperRoute({
    Key? key,
    required StockRecordEntryType type,
    List<PageRouteInfo>? children,
  }) : super(
          RecordStockWrapperRoute.name,
          path: 'record-stock',
          args: RecordStockWrapperRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordStockWrapperRoute';
}

class RecordStockWrapperRouteArgs {
  const RecordStockWrapperRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final StockRecordEntryType type;

  @override
  String toString() {
    return 'RecordStockWrapperRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [ManageStocksPage]
class ManageStocksRoute extends PageRouteInfo<ManageStocksRouteArgs> {
  ManageStocksRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ManageStocksRoute.name,
          path: 'manage-stocks',
          args: ManageStocksRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ManageStocksRoute';
}

class ManageStocksRouteArgs {
  const ManageStocksRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ManageStocksRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [StockReconciliationPage]
class StockReconciliationRoute
    extends PageRouteInfo<StockReconciliationRouteArgs> {
  StockReconciliationRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          StockReconciliationRoute.name,
          path: 'stock-reconciliation',
          args: StockReconciliationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'StockReconciliationRoute';
}

class StockReconciliationRouteArgs {
  const StockReconciliationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'StockReconciliationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [FacilitySelectionPage]
class FacilitySelectionRoute extends PageRouteInfo<FacilitySelectionRouteArgs> {
  FacilitySelectionRoute({
    Key? key,
    required List<FacilityModel> facilities,
  }) : super(
          FacilitySelectionRoute.name,
          path: 'select-facilities',
          args: FacilitySelectionRouteArgs(
            key: key,
            facilities: facilities,
          ),
        );

  static const String name = 'FacilitySelectionRoute';
}

class FacilitySelectionRouteArgs {
  const FacilitySelectionRouteArgs({
    this.key,
    required this.facilities,
  });

  final Key? key;

  final List<FacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [InventoryReportSelectionPage]
class InventoryReportSelectionRoute
    extends PageRouteInfo<InventoryReportSelectionRouteArgs> {
  InventoryReportSelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          InventoryReportSelectionRoute.name,
          path: 'inventory-report-selection',
          args: InventoryReportSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'InventoryReportSelectionRoute';
}

class InventoryReportSelectionRouteArgs {
  const InventoryReportSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'InventoryReportSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [InventoryReportDetailsPage]
class InventoryReportDetailsRoute
    extends PageRouteInfo<InventoryReportDetailsRouteArgs> {
  InventoryReportDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    required InventoryReportType reportType,
  }) : super(
          InventoryReportDetailsRoute.name,
          path: 'inventory-report-details',
          args: InventoryReportDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            reportType: reportType,
          ),
        );

  static const String name = 'InventoryReportDetailsRoute';
}

class InventoryReportDetailsRouteArgs {
  const InventoryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.reportType,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final InventoryReportType reportType;

  @override
  String toString() {
    return 'InventoryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, reportType: $reportType}';
  }
}

/// generated route for
/// [ProjectSelectionPage]
class ProjectSelectionRoute extends PageRouteInfo<ProjectSelectionRouteArgs> {
  ProjectSelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ProjectSelectionRoute.name,
          path: 'select-project',
          args: ProjectSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ProjectSelectionRoute';
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
/// [BoundarySelectionPage]
class BoundarySelectionRoute extends PageRouteInfo<void> {
  const BoundarySelectionRoute()
      : super(
          BoundarySelectionRoute.name,
          path: 'select-boundary',
        );

  static const String name = 'BoundarySelectionRoute';
}

/// generated route for
/// [ComplaintsInboxWrapperPage]
class ComplaintsInboxWrapperRoute extends PageRouteInfo<void> {
  const ComplaintsInboxWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ComplaintsInboxWrapperRoute.name,
          path: 'complaints-inbox',
          initialChildren: children,
        );

  static const String name = 'ComplaintsInboxWrapperRoute';
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
          path: 'complaints-registration',
          args: ComplaintsRegistrationWrapperRouteArgs(
            key: key,
            pgrServiceModel: pgrServiceModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ComplaintsRegistrationWrapperRoute';
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
/// [IndividualDetailsPage]
class IndividualDetailsRoute extends PageRouteInfo<IndividualDetailsRouteArgs> {
  IndividualDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isHeadOfHousehold = false,
  }) : super(
          IndividualDetailsRoute.name,
          path: 'individual-details',
          args: IndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
          ),
        );

  static const String name = 'IndividualDetailsRoute';
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
/// [HouseHoldDetailsPage]
class HouseHoldDetailsRoute extends PageRouteInfo<HouseHoldDetailsRouteArgs> {
  HouseHoldDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          HouseHoldDetailsRoute.name,
          path: 'household-details',
          args: HouseHoldDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HouseHoldDetailsRoute';
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
/// [HouseholdLocationPage]
class HouseholdLocationRoute extends PageRouteInfo<HouseholdLocationRouteArgs> {
  HouseholdLocationRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          HouseholdLocationRoute.name,
          path: 'household-location',
          args: HouseholdLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HouseholdLocationRoute';
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
  }) : super(
          HouseholdOverviewRoute.name,
          path: 'overview',
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HouseholdOverviewRoute';
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
/// [DeliverInterventionPage]
class DeliverInterventionRoute
    extends PageRouteInfo<DeliverInterventionRouteArgs> {
  DeliverInterventionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
  }) : super(
          DeliverInterventionRoute.name,
          path: 'deliver-intervention',
          args: DeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
        );

  static const String name = 'DeliverInterventionRoute';
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
/// [AdverseEventsPage]
class AdverseEventsRoute extends PageRouteInfo<AdverseEventsRouteArgs> {
  AdverseEventsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
  }) : super(
          AdverseEventsRoute.name,
          path: 'adverse-events',
          args: AdverseEventsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
        );

  static const String name = 'AdverseEventsRoute';
}

class AdverseEventsRouteArgs {
  const AdverseEventsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'AdverseEventsRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [ReasonForDeletionPage]
class ReasonForDeletionRoute extends PageRouteInfo<ReasonForDeletionRouteArgs> {
  ReasonForDeletionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isHousholdDelete = false,
  }) : super(
          ReasonForDeletionRoute.name,
          path: 'reason-for-deletion',
          args: ReasonForDeletionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHousholdDelete: isHousholdDelete,
          ),
        );

  static const String name = 'ReasonForDeletionRoute';
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
/// [ChecklistViewPage]
class ChecklistViewRoute extends PageRouteInfo<ChecklistViewRouteArgs> {
  ChecklistViewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ChecklistViewRoute.name,
          path: 'view',
          args: ChecklistViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ChecklistViewRoute';
}

class ChecklistViewRouteArgs {
  const ChecklistViewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'ChecklistViewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ChecklistPage]
class ChecklistRoute extends PageRouteInfo<ChecklistRouteArgs> {
  ChecklistRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ChecklistRoute.name,
          path: '',
          args: ChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ChecklistRoute';
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
/// [ChecklistBoundaryViewPage]
class ChecklistBoundaryViewRoute
    extends PageRouteInfo<ChecklistBoundaryViewRouteArgs> {
  ChecklistBoundaryViewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ChecklistBoundaryViewRoute.name,
          path: 'view-boundary',
          args: ChecklistBoundaryViewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ChecklistBoundaryViewRoute';
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
/// [ChecklistPreviewPage]
class ChecklistPreviewRoute extends PageRouteInfo<ChecklistPreviewRouteArgs> {
  ChecklistPreviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ChecklistPreviewRoute.name,
          path: 'preview',
          args: ChecklistPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ChecklistPreviewRoute';
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
/// [WarehouseDetailsPage]
class WarehouseDetailsRoute extends PageRouteInfo<WarehouseDetailsRouteArgs> {
  WarehouseDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          WarehouseDetailsRoute.name,
          path: 'warehouse-details',
          args: WarehouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'WarehouseDetailsRoute';
}

class WarehouseDetailsRouteArgs {
  const WarehouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'WarehouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [StockDetailsPage]
class StockDetailsRoute extends PageRouteInfo<StockDetailsRouteArgs> {
  StockDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          StockDetailsRoute.name,
          path: 'details',
          args: StockDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'StockDetailsRoute';
}

class StockDetailsRouteArgs {
  const StockDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'StockDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [ComplaintsInboxPage]
class ComplaintsInboxRoute extends PageRouteInfo<ComplaintsInboxRouteArgs> {
  ComplaintsInboxRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsInboxRoute.name,
          path: 'complaints-inbox-items',
          args: ComplaintsInboxRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsInboxRoute';
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
/// [ComplaintsInboxFilterPage]
class ComplaintsInboxFilterRoute
    extends PageRouteInfo<ComplaintsInboxFilterRouteArgs> {
  ComplaintsInboxFilterRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsInboxFilterRoute.name,
          path: 'complaints-inbox-filter',
          args: ComplaintsInboxFilterRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsInboxFilterRoute';
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
/// [ComplaintsInboxSearchPage]
class ComplaintsInboxSearchRoute
    extends PageRouteInfo<ComplaintsInboxSearchRouteArgs> {
  ComplaintsInboxSearchRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsInboxSearchRoute.name,
          path: 'complaints-inbox-search',
          args: ComplaintsInboxSearchRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsInboxSearchRoute';
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
  }) : super(
          ComplaintsInboxSortRoute.name,
          path: 'complaints-inbox-sort',
          args: ComplaintsInboxSortRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsInboxSortRoute';
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
/// [ComplaintsDetailsViewPage]
class ComplaintsDetailsViewRoute
    extends PageRouteInfo<ComplaintsDetailsViewRouteArgs> {
  ComplaintsDetailsViewRoute({
    Key? key,
    required PgrServiceModel complaint,
  }) : super(
          ComplaintsDetailsViewRoute.name,
          path: 'complaints-inbox-view-details',
          args: ComplaintsDetailsViewRouteArgs(
            key: key,
            complaint: complaint,
          ),
        );

  static const String name = 'ComplaintsDetailsViewRoute';
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
/// [ComplaintTypePage]
class ComplaintTypeRoute extends PageRouteInfo<ComplaintTypeRouteArgs> {
  ComplaintTypeRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintTypeRoute.name,
          path: 'complaints-type',
          args: ComplaintTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintTypeRoute';
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
/// [ComplaintsLocationPage]
class ComplaintsLocationRoute
    extends PageRouteInfo<ComplaintsLocationRouteArgs> {
  ComplaintsLocationRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsLocationRoute.name,
          path: 'complaints-location',
          args: ComplaintsLocationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsLocationRoute';
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
/// [ComplaintsDetailsPage]
class ComplaintsDetailsRoute extends PageRouteInfo<ComplaintsDetailsRouteArgs> {
  ComplaintsDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          ComplaintsDetailsRoute.name,
          path: 'complaints-details',
          args: ComplaintsDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ComplaintsDetailsRoute';
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
