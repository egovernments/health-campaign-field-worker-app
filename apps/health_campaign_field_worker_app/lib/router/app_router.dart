import 'package:attendance_management/router/attendance_router.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:closed_household/router/closed_household_router.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:registration_delivery/router/registration_delivery_router.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../blocs/localization/app_localization.dart';
import '../blocs/summary_reports/custom_enumeration_summary_report.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/beneficiary_registration/custom_beneficiary_acknowledgement.dart';
import '../pages/boundary_selection.dart';
import '../pages/home.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/profile.dart';
import '../pages/project_facility_selection.dart';
import '../pages/project_selection.dart';
import '../pages/qr_details_page.dart';
import '../pages/reports/beneficiary/beneficaries_report.dart';
import '../pages/unauthenticated.dart';
import '../pages/beneficiary_registration/custom_household_location.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/registration_delivery.dart';
import '../pages/beneficiary_registration/custom_household_details.dart';
import '../pages/custom_search_beneficiary.dart';
import '../pages/beneficiary_registration/custom_individual_details.dart';
import '../pages/beneficiary_registration/custom_summary_page.dart';
import '../pages/beneficiary/custom_household_overview.dart';
import '../pages/closed/custom_closed_household_summary.dart';
import '../pages/beneficiary/custom_deliver_intervention.dart';
import '../pages/beneficiary/dose_administered_verification.dart';
import '../pages/closed/custom_closed_household_details.dart';
import '../pages/inventory/custom_stock_details.dart';
import '../pages/inventory/custom_warehouse_details.dart';
import 'package:inventory_management/blocs/app_localization.dart';

import '../pages/reports/beneficiary/custom_enumeration_summary_report_details.dart';
import '../pages/reports/beneficiary/custom_distribution_summary_report_details.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  // INFO : Need to add the router modules here
  modules: [
    RegistrationDeliveryRoute,
    InventoryRoute,
    AttendanceRoute,
    ClosedHouseholdPackageRoute
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
          page: BeneficiariesReportRoute.page,
          path: 'beneficiary-downsync-report',
        ),

        // INFO : Need to add Router of package Here
        // Closed-Household Route
        AutoRoute(
            page: ClosedHouseholdWrapperRoute.page,
            path: 'closed-household-wrapper',
            children: [
              AutoRoute(
                page: ClosedHouseholdDetailsRoute.page,
                path: 'closed-household-details',
              ),
              AutoRoute(
                page: CustomClosedHouseholdDetailsRoute.page,
                path: 'custom-closed-household-details',
                initial: true,
              ),
              AutoRoute(
                  page: ClosedHouseholdSummaryRoute.page,
                  path: 'closed-household-summary'),
              AutoRoute(
                  page: CustomClosedHouseholdSummaryRoute.page,
                  path: 'custom-closed-household-summary'),
              RedirectRoute(
                  path: 'closed-household-summary',
                  redirectTo: 'custom-closed-household-summary'),
              AutoRoute(
                  page: ClosedHouseholdAcknowledgementRoute.page,
                  path: 'closed-household-acknowledgement'),
            ]),

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
        AutoRoute(
          page: AttendanceAcknowledgementRoute.page,
          path: 'attendance-acknowledgement',
        ),

        // Inventory Route
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
            ),
            AutoRoute(
              page: CustomWarehouseDetailsRoute.page,
              path: 'custom-warehouse-details',
              initial: true,
            ),
            AutoRoute(
              page: StockDetailsRoute.page,
              path: 'details',
            ),
            AutoRoute(
              page: CustomStockDetailsRoute.page,
              path: 'custom-details',
            ),
            RedirectRoute(
              path: 'details',
              redirectTo: 'custom-details',
            ),
          ],
        ),
        AutoRoute(
          page: InventoryFacilitySelectionRoute.page,
          path: 'inventory-select-facilities',
        ),
        AutoRoute(
          page: StockReconciliationRoute.page,
          path: 'stock-reconciliation',
        ),
        AutoRoute(
          page: InventoryReportSelectionRoute.page,
          path: 'inventory-report-selection',
        ),
        AutoRoute(
          page: InventoryReportDetailsRoute.page,
          path: 'inventory-report-details',
        ),
        AutoRoute(
          page: InventoryAcknowledgementRoute.page,
          path: 'inventory-acknowledgement',
        ),

        AutoRoute(
            page: RegistrationDeliveryWrapperRoute.page,
            path: 'registration-delivery-wrapper',
            children: [
              AutoRoute(
                page: SearchBeneficiaryRoute.page,
                path: 'search-beneficiary',
              ),
              AutoRoute(
                initial: true,
                page: CustomSearchBeneficiaryRoute.page,
                path: 'custom-search-beneficiary',
              ),
              RedirectRoute(
                path: 'search-beneficiary',
                redirectTo: 'custom-search-beneficiary',
              ),
              AutoRoute(
                page: FacilitySelectionRoute.page,
                path: 'select-facilities',
              ),

              /// Beneficiary Registration
              AutoRoute(
                page: BeneficiaryRegistrationWrapperRoute.page,
                path: 'beneficiary-registration',
                children: [
                  AutoRoute(
                    page: IndividualDetailsRoute.page,
                    path: 'individual-details',
                  ),
                  AutoRoute(
                    page: CustomIndividualDetailsRoute.page,
                    path: 'custom-individual-details',
                  ),
                  RedirectRoute(
                    path: 'individual-details',
                    redirectTo: 'custom-individual-details',
                  ),
                  AutoRoute(
                    page: HouseHoldDetailsRoute.page,
                    path: 'household-details',
                  ),
                  AutoRoute(
                    page: CustomHouseHoldDetailsRoute.page,
                    path: 'custom-household-details',
                  ),
                  RedirectRoute(
                    path: 'household-details',
                    redirectTo: 'custom-household-details',
                  ),
                  AutoRoute(
                    page: HouseholdLocationRoute.page,
                    path: 'household-location',
                  ),
                  AutoRoute(
                    page: CustomHouseholdLocationRoute.page,
                    path: 'custom-household-location',
                    initial: true,
                  ),
                  RedirectRoute(
                    path: 'household-location',
                    redirectTo: 'custom-household-location',
                  ),
                  AutoRoute(
                    page: SummaryRoute.page,
                    path: 'beneficiary-summary',
                  ),
                  AutoRoute(
                    page: CustomSummaryRoute.page,
                    path: 'custom-beneficiary-summary',
                  ),
                  RedirectRoute(
                    path: 'beneficiary-summary',
                    redirectTo: 'custom-beneficiary-summary',
                  ),
                  AutoRoute(
                    page: DoseAdministeredVerificationRoute.page,
                    path: 'dose-administered-verification',
                  ),
                  AutoRoute(
                    page: BeneficiaryAcknowledgementRoute.page,
                    path: 'beneficiary-acknowledgement',
                  ),
                  AutoRoute(
                    page: CustomBeneficiaryAcknowledgementRoute.page,
                    path: 'custom-beneficiary-acknowledgement',
                  )
                ],
              ),
              AutoRoute(
                page: BeneficiaryWrapperRoute.page,
                path: 'beneficiary',
                children: [
                  AutoRoute(
                    page: HouseholdOverviewRoute.page,
                    path: 'overview',
                    // initial: true,
                  ),
                  AutoRoute(
                    page: CustomHouseholdOverviewRoute.page,
                    path: 'custom-overview',
                    initial: true,
                  ),
                  RedirectRoute(
                      path: 'overview', redirectTo: 'custom-overview'),
                  AutoRoute(
                    page: BeneficiaryDetailsRoute.page,
                    path: 'beneficiary-details',
                  ),
                  AutoRoute(
                    page: DeliverInterventionRoute.page,
                    path: 'deliver-intervention',
                  ),
                  AutoRoute(
                    page: CustomDeliverInterventionRoute.page,
                    path: 'custom-deliver-intervention',
                  ),
                  RedirectRoute(
                    path: 'deliver-intervention',
                    redirectTo: 'custom-deliver-intervention',
                  ),
                  AutoRoute(
                      page: DeliverySummaryRoute.page, path: 'deliver-summary'),
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
                ],
              ),
            ]),

        //Enumeration and distribution Summary reports
        AutoRoute(
          page: CustomEumerationSummaryReportDetailsRoute.page,
          path: 'custom-enumeration-report',
        ),
        AutoRoute(
          page: CustomDistributionSummaryReportDetailsRoute.page,
          path: 'custom-distribution-report',
        ),

        AutoRoute(page: AcknowledgementRoute.page, path: 'acknowledgement'),

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
      ],
    )
  ];
}
