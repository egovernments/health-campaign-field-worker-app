import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/entities/attendee.dart';
import 'package:health_campaign_field_worker_app/pages/attendance/custom_manage_attendance.dart';
import 'package:health_campaign_field_worker_app/pages/attendance/custom_mark_attendance.dart';
import 'package:health_campaign_field_worker_app/pages/attendance/custom_session_select.dart';
import 'package:health_campaign_field_worker_app/pages/checklist/custom_survery_form_boundary.dart';
import 'package:health_campaign_field_worker_app/pages/checklist/custom_survery_form_wrapper.dart';
import 'package:health_campaign_field_worker_app/pages/checklist/custom_survey_form.dart';
import 'package:health_campaign_field_worker_app/pages/checklist/custom_survey_form_view.dart';
import 'package:survey_form/blocs/app_localization.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';
import 'package:survey_form/router/survey_form_router.dart';
import 'package:complaints/router/complaints_router.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:attendance_management/router/attendance_router.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:closed_household/router/closed_household_router.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:digit_scanner/blocs/app_localization.dart';
import 'package:health_campaign_field_worker_app/pages/custom_qr_scanner.dart';
import 'package:health_campaign_field_worker_app/pages/household_acknowlegment/custom_household_acknowlegment.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/custom_report_details.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/custom_report_selection.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:registration_delivery/router/registration_delivery_router.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:complaints/complaints.dart';
import 'package:survey_form/router/survey_form_router.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';

import '../blocs/localization/app_localization.dart';
import '../blocs/scanner/custom_digit_scanner_bloc.dart';
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
import '../pages/complaints/custom_complaints_details.dart';
import 'package:complaints/blocs/localization/app_localization.dart';
import '../pages/complaints/custom_complaint_type.dart';
import '../pages/inventory/custom_stock_reconciliation.dart';
import '../pages/inventory/custom_inventory_facility_selection.dart';
import '../pages/complaints/custom_complaints_details_view.dart';
import '../pages/complaints/custom_complaints_inbox.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  // INFO : Need to add the router modules here
  modules: [
    RegistrationDeliveryRoute,
    InventoryRoute,
    AttendanceRoute,
    ClosedHouseholdPackageRoute,
    ComplaintsRoute,
    SurveyFormRoute,
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
        // SurveyForm Route
        AutoRoute(
            page: CustomSurveyFormWrapperRoute.page,
            path: 'survey-form',
            children: [
              AutoRoute(
                page: CustomSurveyformRoute.page,
                path: '',
              ),
              AutoRoute(
                  page: SurveyFormBoundaryViewRoute.page,
                  path: 'view-boundary'),
              AutoRoute(
                  page: CustomSurveyFormBoundaryViewRoute.page,
                  path: 'custom-view-boundary'),
              AutoRoute(page: SurveyFormViewRoute.page, path: 'view'),
              AutoRoute(
                  page: CustomSurveyFormViewRoute.page, path: 'custom-view'),
              RedirectRoute(path: 'view', redirectTo: 'custom-view'),
              AutoRoute(page: SurveyFormPreviewRoute.page, path: 'preview'),
              AutoRoute(
                  page: SurveyFormAcknowledgementRoute.page,
                  path: 'surveyForm-acknowledgement'),
            ]),

        AutoRoute(
          page: ComplaintsInboxWrapperRoute.page,
          path: 'complaints-inbox',
          children: [
            AutoRoute(
              page: ComplaintsInboxRoute.page,
              path: 'complaints-inbox-items',
              // initial: true,
            ),
            AutoRoute(
              page: CustomComplaintsInboxRoute.page,
              path: 'custom-complaints-inbox-items',
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
            AutoRoute(
              page: CustomComplaintsDetailsViewRoute.page,
              path: 'custom-complaints-inbox-view-details',
            ),
            RedirectRoute(
              path: 'complaints-inbox-view-details',
              redirectTo: 'custom-complaints-inbox-view-details',
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
            ),
            AutoRoute(
              page: CustomComplaintTypeRoute.page,
              path: 'custom-complaints-type',
              initial: true,
            ),
            RedirectRoute(
              path: 'complaints-type',
              redirectTo: 'custom-complaints-details',
            ),
            AutoRoute(
              page: ComplaintsLocationRoute.page,
              path: 'complaints-location',
            ),
            AutoRoute(
              page: ComplaintsDetailsRoute.page,
              path: 'complaints-details',
            ),
            AutoRoute(
              page: CustomComplaintsDetailsRoute.page,
              path: 'custom-complaints-details',
            ),
            RedirectRoute(
              path: 'complaints-details',
              redirectTo: 'custom-complaints-details',
            ),
          ],
        ),

        /// Complaints Acknowledgemnet
        AutoRoute(
          page: ComplaintsAcknowledgementRoute.page,
          path: 'complaints-acknowledgement',
        ),

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
          page: CustomManageAttendanceRoute.page,
          path: 'custom-manage-attendance',
        ),
        RedirectRoute(
            path: "manage-attendance", redirectTo: "custom-manage-attendance"),
        AutoRoute(
          page: AttendanceDateSessionSelectionRoute.page,
          path: 'attendance-date-session-selection',
        ),
        AutoRoute(
          page: CustomAttendanceDateSessionSelectionRoute.page,
          path: 'custom-attendance-date-session-selection',
        ),
        RedirectRoute(
            path: "attendance-date-session-selection",
            redirectTo: "custom-attendance-date-session-selection"),
        AutoRoute(
          page: MarkAttendanceRoute.page,
          path: 'mark-attendance',
        ),
        AutoRoute(
          page: CustomMarkAttendanceRoute.page,
          path: 'custom-mark-attendance',
        ),
        RedirectRoute(
          path: 'mark-attendance',
          redirectTo: 'custom-mark-attendance',
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
          page: CustomInventoryFacilitySelectionRoute.page,
          path: 'custom-inventory-select-facilities',
        ),
        RedirectRoute(
            path: 'inventory-select-facilities',
            redirectTo: 'custom-inventory-select-facilities'),
        AutoRoute(
          page: StockReconciliationRoute.page,
          path: 'stock-reconciliation',
        ),
        AutoRoute(
          page: CustomStockReconciliationRoute.page,
          path: 'custom-stock-reconciliation',
        ),
        RedirectRoute(
            path: 'stock-reconciliation',
            redirectTo: 'custom-stock-reconciliation'),
        AutoRoute(
          page: InventoryReportSelectionRoute.page,
          path: 'inventory-report-selection',
        ),
        AutoRoute(
          page: CustomInventoryReportSelectionRoute.page,
          path: 'custom-inventory-report-selection',
        ),
        RedirectRoute(
            path: 'inventory-report-selection',
            redirectTo: 'custom-inventory-report-selection'),
        AutoRoute(
          page: InventoryReportDetailsRoute.page,
          path: 'inventory-report-details',
        ),
        AutoRoute(
          page: CustomInventoryReportDetailsRoute.page,
          path: 'custom-inventory-report-details',
        ),
        RedirectRoute(
            path: 'inventory-report-details',
            redirectTo: 'custom-inventory-report-details'),
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
                  AutoRoute(
                    page: CustomHouseholdAcknowledgementRoute.page,
                    path: 'custom-household-acknowledgement',
                  ),
                  RedirectRoute(
                      path: 'household-acknowledgement',
                      redirectTo: 'custom-household-acknowledgement')
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
