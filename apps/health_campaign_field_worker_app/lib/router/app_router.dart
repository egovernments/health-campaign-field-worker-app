import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:attendance_management/router/attendance_router.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/search_households/search_households.dart';
import '../models/data_model.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/beneficiary/beneficiary_details.dart';
import '../pages/beneficiary/beneficiary_wrapper.dart';
import '../pages/beneficiary/deliver_intervention.dart';
import '../pages/beneficiary/dose_administered.dart';
import '../pages/beneficiary/household_overview.dart';
import '../pages/beneficiary/record_past_delivery_details.dart';
import '../pages/beneficiary/refer_beneficiary.dart';
import '../pages/beneficiary/side_effects.dart';
import '../pages/beneficiary/widgets/household_acknowledgement.dart';
import '../pages/beneficiary/widgets/splash_acknowledgement.dart';
import '../pages/beneficiary_registration/beneficiary_acknowledgement.dart';
import '../pages/beneficiary_registration/beneficiary_registration_wrapper.dart';
import '../pages/beneficiary_registration/household_details.dart';
import '../pages/beneficiary_registration/household_location.dart';
import '../pages/beneficiary_registration/individual_details.dart';
import '../pages/boundary_selection.dart';
import '../pages/checklist/checklist.dart';
import '../pages/checklist/checklist_boundary_view.dart';
import '../pages/checklist/checklist_preview.dart';
import '../pages/checklist/checklist_view.dart';
import '../pages/checklist/checklist_wrapper.dart';
import '../pages/complaints/inbox/complaints_details_view.dart';
import '../pages/complaints/inbox/complaints_inbox.dart';
import '../pages/complaints/inbox/complaints_inbox_filter.dart';
import '../pages/complaints/inbox/complaints_inbox_search.dart';
import '../pages/complaints/inbox/complaints_inbox_sort.dart';
import '../pages/complaints/inbox/complaints_inbox_wrapper.dart';
import '../pages/complaints/registration/complaint_type.dart';
import '../pages/complaints/registration/complaints_details.dart';
import '../pages/complaints/registration/complaints_location.dart';
import '../pages/complaints/registration/complaints_registration_wrapper.dart';
import '../pages/complaints_acknowledgement.dart';
import '../pages/home.dart';
import '../pages/inventory/project_facility_selection.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/profile.dart';
import '../pages/project_selection.dart';
import '../pages/qr_details_page.dart';
import '../pages/reason_for_deletion.dart';
import '../pages/reports/beneficiary/beneficaries_report.dart';
import '../pages/search_beneficiary.dart';
import '../pages/unauthenticated.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    InventoryRoute,
    AttendanceRoute,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: UnauthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(
          page: LanguageSelectionRoute.page,
          path: 'language_selection',
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page, path: 'login'),
      ],
    ),
    AutoRoute(
      page: AuthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: UserQRDetailsRoute.page, path: 'user-qr-code'),
        AutoRoute(
            page: SearchBeneficiaryRoute.page, path: 'search-beneficiary'),
        AutoRoute(
          page: BeneficiariesReportRoute.page,
          path: 'beneficiary-downsync-report',
        ),

        /// Beneficiary Registration
        AutoRoute(
          page: BeneficiaryRegistrationWrapperRoute.page,
          path: 'beneficiary-registration',
          children: [
            AutoRoute(
                page: IndividualDetailsRoute.page, path: 'individual-details'),
            AutoRoute(
                page: HouseHoldDetailsRoute.page, path: 'household-details'),
            AutoRoute(
              page: HouseholdLocationRoute.page,
              path: 'household-location',
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: BeneficiaryWrapperRoute.page,
          path: 'beneficiary',
          children: [
            AutoRoute(
              page: HouseholdOverviewRoute.page,
              path: 'overview',
              initial: true,
            ),
            AutoRoute(
              page: BeneficiaryDetailsRoute.page,
              path: 'beneficiary-details',
            ),
            AutoRoute(
              page: DeliverInterventionRoute.page,
              path: 'deliver-intervention',
            ),
            AutoRoute(
              page: SideEffectsRoute.page,
              path: 'side-effects',
            ),
            AutoRoute(
              page: ReferBeneficiaryRoute.page,
              path: 'refer-beneficiary',
            ),
            AutoRoute(
              page: DoseAdministeredRoute.page,
              path: 'dose-administered',
            ),
            AutoRoute(
              page: SplashAcknowledgementRoute.page,
              path: 'splash-acknowledgement',
            ),
            AutoRoute(
              page: ReasonForDeletionRoute.page,
              path: 'reason-for-deletion',
            ),
            AutoRoute(
              page: RecordPastDeliveryDetailsRoute.page,
              path: 'record-past-delivery-details',
            ),
            AutoRoute(
              page: HouseholdAcknowledgementRoute.page,
              path: 'household-acknowledgement',
            ),
            AutoRoute(page: ChecklistViewRoute.page, path: 'view'),
          ],
        ),

        AutoRoute(
            page: ChecklistWrapperRoute.page,
            path: 'checklist',
            children: [
              AutoRoute(
                page: ChecklistRoute.page,
                path: '',
              ),
              AutoRoute(
                  page: ChecklistBoundaryViewRoute.page, path: 'view-boundary'),
              AutoRoute(page: ChecklistViewRoute.page, path: 'view'),
              AutoRoute(page: ChecklistPreviewRoute.page, path: 'preview'),
            ]),
        AutoRoute(
          page: BeneficiaryAcknowledgementRoute.page,
          path: 'beneficiary-acknowledgement',
        ),
        AutoRoute(page: AcknowledgementRoute.page, path: 'acknowledgement'),
        AutoRoute(
          page: ComplaintsAcknowledgementRoute.page,
          path: 'complaints-acknowledgement',
        ),

        /// Inventory Routes
        AutoRoute(
          page: RecordStockWrapperPage,
          path: 'record-stock',
          children: [
            AutoRoute(
              page: WarehouseDetailsPage,
              path: 'warehouse-details',
              initial: true,
            ),
            AutoRoute(page: StockDetailsPage, path: 'details'),
          ],
        ),
        AutoRoute(page: ManageStocksPage, path: 'manage-stocks'),
        AutoRoute(page: StockReconciliationPage, path: 'stock-reconciliation'),
        AutoRoute<FacilityModel>(
          page: FacilitySelectionPage,
          path: 'select-facilities',
        ),
        AutoRoute<ProjectFacilityModel>(
          page: ProjectFacilitySelectionPage,
          path: 'select-project-facilities',
        ),
        AutoRoute(
          page: ProjectFacilitySelectionRoute.page,
          path: 'select-project-facilities',
        ),

        /// Project Selection
        AutoRoute(
          page: ProjectSelectionRoute.page,
          path: 'select-project',
          initial: true,
        ),

        /// Boundary Selection
        AutoRoute(
          page: BoundarySelectionRoute.page,
          path: 'select-boundary',
        ),

        /// Complaints Inbox
        AutoRoute(
          page: ComplaintsInboxWrapperRoute.page,
          path: 'complaints-inbox',
          children: [
            AutoRoute(
              page: ComplaintsInboxRoute.page,
              path: 'complaints-inbox-items',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsInboxFilterRoute.page,
              path: 'complaints-inbox-filter',
            ),
            AutoRoute(
              page: ComplaintsInboxSearchRoute.page,
              path: 'complaints-inbox-search',
            ),
            AutoRoute(
              page: ComplaintsInboxSortRoute.page,
              path: 'complaints-inbox-sort',
            ),
            AutoRoute(
              page: ComplaintsDetailsViewRoute.page,
              path: 'complaints-inbox-view-details',
            ),
          ],
        ),

        /// Complaints registration
        AutoRoute(
          page: ComplaintsRegistrationWrapperRoute.page,
          path: 'complaints-registration',
          children: [
            AutoRoute(
              page: ComplaintTypeRoute.page,
              path: 'complaints-type',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsLocationRoute.page,
              path: 'complaints-location',
            ),
            AutoRoute(
              page: ComplaintsDetailsRoute.page,
              path: 'complaints-details',
            ),
          ],
        ),

        // Attendance Route
        AutoRoute(
          page: ManageAttendanceRoute.page,
          path: 'manage-attendance',
        ),
        AutoRoute(
          page: AttendanceDateSessionSelectionRoute.page,
          path: 'attendance-date-session-selection',
        ),
        AutoRoute(
          page: MarkAttendanceRoute.page,
          path: 'mark-attendance',
        ),

        //Inventory Route
        AutoRoute(
          page: ManageStocksRoute.page,
          path: 'manage-stocks',
        ),
        AutoRoute(
            page: RecordStockWrapperRoute.page,
            path: 'record-stock',
            children: [
              AutoRoute(
                  page: WarehouseDetailsRoute.page,
                  path: 'warehouse-details',
                  initial: true),
              AutoRoute(page: StockDetailsRoute.page, path: 'details'),
            ]),
        AutoRoute(page: FacilitySelectionRoute.page, path: 'select-facilities'),
        AutoRoute(
            page: StockReconciliationRoute.page, path: 'stock-reconciliation'),
        AutoRoute(
            page: InventoryReportSelectionRoute.page,
            path: 'inventory-report-selection'),
        AutoRoute(
            page: InventoryReportDetailsRoute.page,
            path: 'inventory-report-details'),
        AutoRoute(
            page: InventoryAcknowledgementRoute.page,
            path: 'inventory-acknowledgement'),
      ],
    ),
  ];
}
