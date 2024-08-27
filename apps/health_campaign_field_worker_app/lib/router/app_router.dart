import 'package:attendance_management/router/attendance_router.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:closed_household/router/closed_household_router.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/router/dashboard_router.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:digit_scanner/router/digit_scanner_router.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:survey_form/router/survey_form_router.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:registration_delivery/router/registration_delivery_router.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';

import '../blocs/localization/app_localization.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/boundary_selection.dart';
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
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/profile.dart';
import '../pages/project_facility_selection.dart';
import '../pages/project_selection.dart';
import '../pages/qr_details_page.dart';
import '../pages/reports/beneficiary/beneficaries_report.dart';
import '../pages/unauthenticated.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    InventoryRoute,
    AttendanceRoute,
    ReferralReconciliationRoute,
    DigitScannerPackageRoute,
    RegistrationDeliveryRoute,
    ClosedHouseholdPackageRoute,
    DashboardRoute,
    SurveyFormRoute
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
        AutoRoute(page: DigitScannerRoute.page, path: 'scanner'),
        AutoRoute(
          page: BeneficiariesReportRoute.page,
          path: 'beneficiary-downsync-report',
        ),
        // DSS Dashboard Routes
        AutoRoute(
          page: UserDashboardRoute.page,
          path: 'dashboard',
        ),
        AutoRoute(
            page: RegistrationDeliveryWrapperRoute.page,
            path: 'registration-delivery-wrapper',
            children: [
              AutoRoute(
                  initial: true,
                  page: SearchBeneficiaryRoute.page,
                  path: 'search-beneficiary'),

              /// Beneficiary Registration
              AutoRoute(
                page: BeneficiaryRegistrationWrapperRoute.page,
                path: 'beneficiary-registration',
                children: [
                  AutoRoute(
                      page: IndividualDetailsRoute.page,
                      path: 'individual-details'),
                  AutoRoute(
                      page: HouseHoldDetailsRoute.page,
                      path: 'household-details'),
                  AutoRoute(
                      page: HouseDetailsRoute.page, path: 'house-details'),
                  AutoRoute(
                    page: HouseholdLocationRoute.page,
                    path: 'household-location',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryAcknowledgementRoute.page,
                    path: 'beneficiary-acknowledgement',
                  ),
                  AutoRoute(
                    page: SummaryRoute.page,
                    path: 'beneficiary-summary',
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
                    page: BeneficiaryChecklistRoute.page,
                    path: 'beneficiary-checklist',
                  ),
                  AutoRoute(
                    page: BeneficiaryDetailsRoute.page,
                    path: 'beneficiary-details',
                  ),
                  AutoRoute(
                    page: BeneficiaryChecklistRoute.page,
                    path: 'beneficiary-checklist',
                  ),
                  AutoRoute(
                    page: DeliverInterventionRoute.page,
                    path: 'deliver-intervention',
                  ),
                  AutoRoute(
                    page: RefusedDeliveryRoute.page,
                    path: 'refused-delivery',
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
                  AutoRoute(
                    page: DeliverySummaryRoute.page,
                    path: 'delivery-summary',
                  ),
                ],
              ),
            ]),

        /// close household
        AutoRoute(
            page: ClosedHouseholdWrapperRoute.page,
            path: 'closed-household-wrapper',
            children: [
              AutoRoute(
                page: ClosedHouseholdDetailsRoute.page,
                path: 'closed-household-details',
                initial: true,
              ),
              AutoRoute(
                  page: ClosedHouseholdSummaryRoute.page,
                  path: 'closed-household-summary'),
              AutoRoute(
                  page: ClosedHouseholdAcknowledgementRoute.page,
                  path: 'closed-household-acknowledgement'),
            ]),

        AutoRoute(
            page: SurveyFormWrapperRoute.page,
            path: 'surveyForm',
            children: [
              AutoRoute(
                page: SurveyformRoute.page,
                path: '',
              ),
              AutoRoute(
                  page: SurveyFormBoundaryViewRoute.page, path: 'view-boundary'),
              AutoRoute(page: SurveyFormViewRoute.page, path: 'view'),
              AutoRoute(page: SurveyFormPreviewRoute.page, path: 'preview'),
              AutoRoute(page: SurveyFormAcknowledgementRoute.page, path: 'surveyForm-acknowledgement'),
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
        AutoRoute(
          page: ProjectFacilitySelectionRoute.page,
          path: 'select-project-facilities',
        ),
        AutoRoute(
          page: FacilitySelectionRoute.page,
          path: 'select-facilities',
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
        AutoRoute(
          page: AttendanceAcknowledgementRoute.page,
          path: 'attendance-acknowledgement',
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
        AutoRoute(
            page: InventoryFacilitySelectionRoute.page,
            path: 'inventory-select-facilities'),
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

        // Referral Reconciliation Route
        AutoRoute(
            page: HFCreateReferralWrapperRoute.page,
            path: 'hf-referral',
            children: [
              AutoRoute(
                  page: ReferralFacilityRoute.page,
                  path: 'facility-details',
                  initial: true),
              AutoRoute(
                  page: RecordReferralDetailsRoute.page,
                  path: 'referral-details'),
              AutoRoute(
                page: ReferralReasonChecklistRoute.page,
                path: 'referral-checklist-create',
              ),
              AutoRoute(
                page: ReferralReasonChecklistPreviewRoute.page,
                path: 'referral-checklist-view',
              ),
            ]),
        AutoRoute(
          page: ReferralReconAcknowledgementRoute.page,
          path: 'referral-acknowledgement',
        ),
        AutoRoute(
          page: ReferralReconProjectFacilitySelectionRoute.page,
          path: 'referral-project-facility',
        ),
        AutoRoute(
          page: SearchReferralReconciliationsRoute.page,
          path: 'search-referrals',
        ),
      ],
    )
  ];
}
