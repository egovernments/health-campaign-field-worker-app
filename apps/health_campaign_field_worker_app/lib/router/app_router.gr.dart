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
    UserQRDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserQRDetailsRouteArgs>(
          orElse: () => const UserQRDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: UserQRDetailsPage(
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
    QRScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QRScannerRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: QRScannerPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          quantity: args.quantity,
          isGS1code: args.isGS1code,
          sinlgleValue: args.sinlgleValue,
          isEditEnabled: args.isEditEnabled,
        ),
      );
    },
    BeneficiariesReportRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BeneficiariesReportPage(),
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
    BeneficiaryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryAcknowledgementRouteArgs>(
          orElse: () => const BeneficiaryAcknowledgementRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BeneficiaryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
        ),
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
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
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
    SearchReferralsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchReferralsRouteArgs>(
          orElse: () => const SearchReferralsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SearchReferralsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    HFCreateReferralWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HFCreateReferralWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: HFCreateReferralWrapperPage(
          key: args.key,
          viewOnly: args.viewOnly,
          hfReferralModel: args.hfReferralModel,
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
    ProjectFacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectFacilitySelectionRouteArgs>();
      return MaterialPageX<ProjectFacilityModel>(
        routeData: routeData,
        child: ProjectFacilitySelectionPage(
          key: args.key,
          projectFacilities: args.projectFacilities,
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
      final args = routeData.argsAs<BoundarySelectionRouteArgs>(
          orElse: () => const BoundarySelectionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BoundarySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
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
    BeneficiaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryDetailsRouteArgs>(
          orElse: () => const BeneficiaryDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BeneficiaryDetailsPage(
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
    SideEffectsRoute.name: (routeData) {
      final args = routeData.argsAs<SideEffectsRouteArgs>();
      return MaterialPageX<List<TaskModel>>(
        routeData: routeData,
        child: SideEffectsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
          isEditing: args.isEditing,
        ),
      );
    },
    ReferBeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReferBeneficiaryRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReferBeneficiaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          projectBeneficiaryClientRefId: args.projectBeneficiaryClientRefId,
        ),
      );
    },
    DoseAdministeredRoute.name: (routeData) {
      final args = routeData.argsAs<DoseAdministeredRouteArgs>(
          orElse: () => const DoseAdministeredRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DoseAdministeredPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    SplashAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<SplashAcknowledgementRouteArgs>(
          orElse: () => const SplashAcknowledgementRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SplashAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableBackToSearch: args.enableBackToSearch,
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
    RecordPastDeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordPastDeliveryDetailsRouteArgs>(
          orElse: () => const RecordPastDeliveryDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RecordPastDeliveryDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          tasks: args.tasks,
        ),
      );
    },
    HouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdAcknowledgementRouteArgs>(
          orElse: () => const HouseholdAcknowledgementRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          enableViewHousehold: args.enableViewHousehold,
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
          referralClientRefId: args.referralClientRefId,
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
    ReferralFacilityRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralFacilityRouteArgs>(
          orElse: () => const ReferralFacilityRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReferralFacilityPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    RecordReferralDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecordReferralDetailsRouteArgs>(
          orElse: () => const RecordReferralDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RecordReferralDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ReferralReasonChecklistRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonChecklistRouteArgs>(
          orElse: () => const ReferralReasonChecklistRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReferralReasonChecklistPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          referralClientRefId: args.referralClientRefId,
        ),
      );
    },
    ReferralReasonCheckListPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralReasonCheckListPreviewRouteArgs>(
          orElse: () => const ReferralReasonCheckListPreviewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReferralReasonCheckListPreviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
          referralClientRefId: args.referralClientRefId,
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
              UserQRDetailsRoute.name,
              path: 'user-qr-code',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              SearchBeneficiaryRoute.name,
              path: 'search-beneficiary',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              QRScannerRoute.name,
              path: 'scanner',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              BeneficiariesReportRoute.name,
              path: 'beneficiary-downsync-report',
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
                  BeneficiaryDetailsRoute.name,
                  path: 'beneficiary-details',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  DeliverInterventionRoute.name,
                  path: 'deliver-intervention',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  SideEffectsRoute.name,
                  path: 'side-effects',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  ReferBeneficiaryRoute.name,
                  path: 'refer-beneficiary',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  DoseAdministeredRoute.name,
                  path: 'dose-administered',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  SplashAcknowledgementRoute.name,
                  path: 'splash-acknowledgement',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  ReasonForDeletionRoute.name,
                  path: 'reason-for-deletion',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  RecordPastDeliveryDetailsRoute.name,
                  path: 'record-past-delivery-details',
                  parent: BeneficiaryWrapperRoute.name,
                ),
                RouteConfig(
                  HouseholdAcknowledgementRoute.name,
                  path: 'household-acknowledgement',
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
              BeneficiaryAcknowledgementRoute.name,
              path: 'beneficiary-acknowledgement',
              parent: AuthenticatedRouteWrapper.name,
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
              SearchReferralsRoute.name,
              path: 'search-referrals',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              HFCreateReferralWrapperRoute.name,
              path: 'hf-referral',
              parent: AuthenticatedRouteWrapper.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: HFCreateReferralWrapperRoute.name,
                  redirectTo: 'facility-details',
                  fullMatch: true,
                ),
                RouteConfig(
                  ReferralFacilityRoute.name,
                  path: 'facility-details',
                  parent: HFCreateReferralWrapperRoute.name,
                ),
                RouteConfig(
                  RecordReferralDetailsRoute.name,
                  path: 'referral-details',
                  parent: HFCreateReferralWrapperRoute.name,
                ),
                RouteConfig(
                  ReferralReasonChecklistRoute.name,
                  path: 'referral-reason',
                  parent: HFCreateReferralWrapperRoute.name,
                ),
                RouteConfig(
                  ReferralReasonCheckListPreviewRoute.name,
                  path: 'referral-reason-view',
                  parent: HFCreateReferralWrapperRoute.name,
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
              ProjectFacilitySelectionRoute.name,
              path: 'select-project-facilities',
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
/// [UserQRDetailsPage]
class UserQRDetailsRoute extends PageRouteInfo<UserQRDetailsRouteArgs> {
  UserQRDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          UserQRDetailsRoute.name,
          path: 'user-qr-code',
          args: UserQRDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'UserQRDetailsRoute';
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
/// [QRScannerPage]
class QRScannerRoute extends PageRouteInfo<QRScannerRouteArgs> {
  QRScannerRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    required int quantity,
    required bool isGS1code,
    bool sinlgleValue = false,
    bool isEditEnabled = false,
  }) : super(
          QRScannerRoute.name,
          path: 'scanner',
          args: QRScannerRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            quantity: quantity,
            isGS1code: isGS1code,
            sinlgleValue: sinlgleValue,
            isEditEnabled: isEditEnabled,
          ),
        );

  static const String name = 'QRScannerRoute';
}

class QRScannerRouteArgs {
  const QRScannerRouteArgs({
    this.key,
    this.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.sinlgleValue = false,
    this.isEditEnabled = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final int quantity;

  final bool isGS1code;

  final bool sinlgleValue;

  final bool isEditEnabled;

  @override
  String toString() {
    return 'QRScannerRouteArgs{key: $key, appLocalizations: $appLocalizations, quantity: $quantity, isGS1code: $isGS1code, sinlgleValue: $sinlgleValue, isEditEnabled: $isEditEnabled}';
  }
}

/// generated route for
/// [BeneficiariesReportPage]
class BeneficiariesReportRoute extends PageRouteInfo<void> {
  const BeneficiariesReportRoute()
      : super(
          BeneficiariesReportRoute.name,
          path: 'beneficiary-downsync-report',
        );

  static const String name = 'BeneficiariesReportRoute';
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
/// [BeneficiaryAcknowledgementPage]
class BeneficiaryAcknowledgementRoute
    extends PageRouteInfo<BeneficiaryAcknowledgementRouteArgs> {
  BeneficiaryAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableViewHousehold,
  }) : super(
          BeneficiaryAcknowledgementRoute.name,
          path: 'beneficiary-acknowledgement',
          args: BeneficiaryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
        );

  static const String name = 'BeneficiaryAcknowledgementRoute';
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
/// [AcknowledgementPage]
class AcknowledgementRoute extends PageRouteInfo<AcknowledgementRouteArgs> {
  AcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
  }) : super(
          AcknowledgementRoute.name,
          path: 'acknowledgement',
          args: AcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
        );

  static const String name = 'AcknowledgementRoute';
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
/// [SearchReferralsPage]
class SearchReferralsRoute extends PageRouteInfo<SearchReferralsRouteArgs> {
  SearchReferralsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          SearchReferralsRoute.name,
          path: 'search-referrals',
          args: SearchReferralsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'SearchReferralsRoute';
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
          path: 'hf-referral',
          args: HFCreateReferralWrapperRouteArgs(
            key: key,
            viewOnly: viewOnly,
            hfReferralModel: hfReferralModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HFCreateReferralWrapperRoute';
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
/// [ProjectFacilitySelectionPage]
class ProjectFacilitySelectionRoute
    extends PageRouteInfo<ProjectFacilitySelectionRouteArgs> {
  ProjectFacilitySelectionRoute({
    Key? key,
    required List<ProjectFacilityModel> projectFacilities,
  }) : super(
          ProjectFacilitySelectionRoute.name,
          path: 'select-project-facilities',
          args: ProjectFacilitySelectionRouteArgs(
            key: key,
            projectFacilities: projectFacilities,
          ),
        );

  static const String name = 'ProjectFacilitySelectionRoute';
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
class BoundarySelectionRoute extends PageRouteInfo<BoundarySelectionRouteArgs> {
  BoundarySelectionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          BoundarySelectionRoute.name,
          path: 'select-boundary',
          args: BoundarySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'BoundarySelectionRoute';
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
/// [BeneficiaryDetailsPage]
class BeneficiaryDetailsRoute
    extends PageRouteInfo<BeneficiaryDetailsRouteArgs> {
  BeneficiaryDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          BeneficiaryDetailsRoute.name,
          path: 'beneficiary-details',
          args: BeneficiaryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'BeneficiaryDetailsRoute';
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
/// [SideEffectsPage]
class SideEffectsRoute extends PageRouteInfo<SideEffectsRouteArgs> {
  SideEffectsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    required List<TaskModel> tasks,
    bool isEditing = false,
  }) : super(
          SideEffectsRoute.name,
          path: 'side-effects',
          args: SideEffectsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
            isEditing: isEditing,
          ),
        );

  static const String name = 'SideEffectsRoute';
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
/// [ReferBeneficiaryPage]
class ReferBeneficiaryRoute extends PageRouteInfo<ReferBeneficiaryRouteArgs> {
  ReferBeneficiaryRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    required String projectBeneficiaryClientRefId,
  }) : super(
          ReferBeneficiaryRoute.name,
          path: 'refer-beneficiary',
          args: ReferBeneficiaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            projectBeneficiaryClientRefId: projectBeneficiaryClientRefId,
          ),
        );

  static const String name = 'ReferBeneficiaryRoute';
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
/// [DoseAdministeredPage]
class DoseAdministeredRoute extends PageRouteInfo<DoseAdministeredRouteArgs> {
  DoseAdministeredRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          DoseAdministeredRoute.name,
          path: 'dose-administered',
          args: DoseAdministeredRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'DoseAdministeredRoute';
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
/// [SplashAcknowledgementPage]
class SplashAcknowledgementRoute
    extends PageRouteInfo<SplashAcknowledgementRouteArgs> {
  SplashAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableBackToSearch,
  }) : super(
          SplashAcknowledgementRoute.name,
          path: 'splash-acknowledgement',
          args: SplashAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableBackToSearch: enableBackToSearch,
          ),
        );

  static const String name = 'SplashAcknowledgementRoute';
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
/// [RecordPastDeliveryDetailsPage]
class RecordPastDeliveryDetailsRoute
    extends PageRouteInfo<RecordPastDeliveryDetailsRouteArgs> {
  RecordPastDeliveryDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    List<TaskModel>? tasks,
  }) : super(
          RecordPastDeliveryDetailsRoute.name,
          path: 'record-past-delivery-details',
          args: RecordPastDeliveryDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            tasks: tasks,
          ),
        );

  static const String name = 'RecordPastDeliveryDetailsRoute';
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
/// [HouseholdAcknowledgementPage]
class HouseholdAcknowledgementRoute
    extends PageRouteInfo<HouseholdAcknowledgementRouteArgs> {
  HouseholdAcknowledgementRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool? enableViewHousehold,
  }) : super(
          HouseholdAcknowledgementRoute.name,
          path: 'household-acknowledgement',
          args: HouseholdAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            enableViewHousehold: enableViewHousehold,
          ),
        );

  static const String name = 'HouseholdAcknowledgementRoute';
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
/// [ChecklistViewPage]
class ChecklistViewRoute extends PageRouteInfo<ChecklistViewRouteArgs> {
  ChecklistViewRoute({
    Key? key,
    String? referralClientRefId,
    AppLocalizations? appLocalizations,
  }) : super(
          ChecklistViewRoute.name,
          path: 'view',
          args: ChecklistViewRouteArgs(
            key: key,
            referralClientRefId: referralClientRefId,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'ChecklistViewRoute';
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
/// [ReferralFacilityPage]
class ReferralFacilityRoute extends PageRouteInfo<ReferralFacilityRouteArgs> {
  ReferralFacilityRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
  }) : super(
          ReferralFacilityRoute.name,
          path: 'facility-details',
          args: ReferralFacilityRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
        );

  static const String name = 'ReferralFacilityRoute';
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
/// [RecordReferralDetailsPage]
class RecordReferralDetailsRoute
    extends PageRouteInfo<RecordReferralDetailsRouteArgs> {
  RecordReferralDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
  }) : super(
          RecordReferralDetailsRoute.name,
          path: 'referral-details',
          args: RecordReferralDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
        );

  static const String name = 'RecordReferralDetailsRoute';
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
/// [ReferralReasonChecklistPage]
class ReferralReasonChecklistRoute
    extends PageRouteInfo<ReferralReasonChecklistRouteArgs> {
  ReferralReasonChecklistRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    String? referralClientRefId,
  }) : super(
          ReferralReasonChecklistRoute.name,
          path: 'referral-reason',
          args: ReferralReasonChecklistRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            referralClientRefId: referralClientRefId,
          ),
        );

  static const String name = 'ReferralReasonChecklistRoute';
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
/// [ReferralReasonCheckListPreviewPage]
class ReferralReasonCheckListPreviewRoute
    extends PageRouteInfo<ReferralReasonCheckListPreviewRouteArgs> {
  ReferralReasonCheckListPreviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
    String? referralClientRefId,
  }) : super(
          ReferralReasonCheckListPreviewRoute.name,
          path: 'referral-reason-view',
          args: ReferralReasonCheckListPreviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
            referralClientRefId: referralClientRefId,
          ),
        );

  static const String name = 'ReferralReasonCheckListPreviewRoute';
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
