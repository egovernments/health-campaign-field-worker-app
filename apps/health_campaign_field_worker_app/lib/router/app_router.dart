import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/inventory_report/inventory_report.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/record_stock/record_stock.dart';
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
import '../pages/health_field_worker/create_referral/create_hf_referral_wrapper.dart';
import '../pages/health_field_worker/create_referral/reason_checklist_preview.dart';
import '../pages/health_field_worker/create_referral/record_facility_details.dart';
import '../pages/health_field_worker/create_referral/record_reason_checklist.dart';
import '../pages/health_field_worker/create_referral/record_referral_details.dart';
import '../pages/home.dart';
import '../pages/inventory/facility_selection.dart';
import '../pages/inventory/manage_stocks.dart';
import '../pages/inventory/project_facility_selection.dart';
import '../pages/inventory/record_stock/record_stock_wrapper.dart';
import '../pages/inventory/record_stock/stock_details.dart';
import '../pages/inventory/record_stock/warehouse_details.dart';
import '../pages/inventory/reports/report_details.dart';
import '../pages/inventory/reports/report_selection.dart';
import '../pages/inventory/stock_reconciliation/stock_reconciliation.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/profile.dart';
import '../pages/project_selection.dart';
import '../pages/qr_details_page.dart';
import '../pages/qr_scanner.dart';
import '../pages/reason_for_deletion.dart';
import '../pages/reports/beneficiary/beneficaries_report.dart';
import '../pages/search_beneficiary.dart';
import '../pages/search_referrals.dart';
import '../pages/unauthenticated.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: UnauthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(
          page: LanguageSelectionPage,
          path: 'language_selection',
          initial: true,
        ),
        AutoRoute(page: LoginPage, path: 'login'),
      ],
    ),
    AutoRoute(
      page: AuthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(page: HomePage, path: 'home'),
        AutoRoute(page: ProfilePage, path: 'profile'),
        AutoRoute(page: UserQRDetailsPage, path: 'user-qr-code'),
        AutoRoute(page: SearchBeneficiaryPage, path: 'search-beneficiary'),
        AutoRoute(page: QRScannerPage, path: 'scanner'),
        AutoRoute(
          page: BeneficiariesReportPage,
          path: 'beneficiary-downsync-report',
        ),

        /// Beneficiary Registration
        AutoRoute(
          page: BeneficiaryRegistrationWrapperPage,
          path: 'beneficiary-registration',
          children: [
            AutoRoute(page: IndividualDetailsPage, path: 'individual-details'),
            AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
            AutoRoute(
              page: HouseholdLocationPage,
              path: 'household-location',
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: BeneficiaryWrapperPage,
          path: 'beneficiary',
          children: [
            AutoRoute(
              page: HouseholdOverviewPage,
              path: 'overview',
              initial: true,
            ),
            AutoRoute(
              page: BeneficiaryDetailsPage,
              path: 'beneficiary-details',
            ),
            AutoRoute(
              page: DeliverInterventionPage,
              path: 'deliver-intervention',
            ),
            AutoRoute<List<TaskModel>>(
              page: SideEffectsPage,
              path: 'side-effects',
            ),
            AutoRoute(
              page: ReferBeneficiaryPage,
              path: 'refer-beneficiary',
            ),
            AutoRoute(
              page: DoseAdministeredPage,
              path: 'dose-administered',
            ),
            AutoRoute(
              page: SplashAcknowledgementPage,
              path: 'splash-acknowledgement',
            ),
            AutoRoute(
              page: ReasonForDeletionPage,
              path: 'reason-for-deletion',
            ),
            AutoRoute(
              page: RecordPastDeliveryDetailsPage,
              path: 'record-past-delivery-details',
            ),
            AutoRoute(
              page: HouseholdAcknowledgementPage,
              path: 'household-acknowledgement',
            ),
            AutoRoute(page: ChecklistViewPage, path: 'view'),
          ],
        ),

        AutoRoute(page: ChecklistWrapperPage, path: 'checklist', children: [
          AutoRoute(
            page: ChecklistPage,
            path: '',
          ),
          AutoRoute(page: ChecklistBoundaryViewPage, path: 'view-boundary'),
          AutoRoute(page: ChecklistViewPage, path: 'view'),
          AutoRoute(page: ChecklistPreviewPage, path: 'preview'),
        ]),
        AutoRoute(
          page: BeneficiaryAcknowledgementPage,
          path: 'beneficiary-acknowledgement',
        ),
        AutoRoute(page: AcknowledgementPage, path: 'acknowledgement'),
        AutoRoute(
          page: ComplaintsAcknowledgementPage,
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
        AutoRoute(page: SearchReferralsPage, path: 'search-referrals'),
        AutoRoute(
          page: HFCreateReferralWrapperPage,
          path: 'hf-referral',
          children: [
            AutoRoute(
              page: ReferralFacilityPage,
              path: 'facility-details',
              initial: true,
            ),
            AutoRoute(
              page: RecordReferralDetailsPage,
              path: 'referral-details',
            ),
            AutoRoute(
              page: ReferralReasonChecklistPage,
              path: 'referral-reason',
            ),
            AutoRoute(
              page: ReferralReasonCheckListPreviewPage,
              path: 'referral-reason-view',
            ),
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
          page: InventoryReportSelectionPage,
          path: 'inventory-report-selection',
        ),
        AutoRoute(
          page: InventoryReportDetailsPage,
          path: 'inventory-report-details',
        ),

        /// Project Selection
        AutoRoute(
          page: ProjectSelectionPage,
          path: 'select-project',
          initial: true,
        ),

        /// Boundary Selection
        AutoRoute(
          page: BoundarySelectionPage,
          path: 'select-boundary',
        ),

        /// Complaints Inbox
        AutoRoute(
          page: ComplaintsInboxWrapperPage,
          path: 'complaints-inbox',
          children: [
            AutoRoute(
              page: ComplaintsInboxPage,
              path: 'complaints-inbox-items',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsInboxFilterPage,
              path: 'complaints-inbox-filter',
            ),
            AutoRoute(
              page: ComplaintsInboxSearchPage,
              path: 'complaints-inbox-search',
            ),
            AutoRoute(
              page: ComplaintsInboxSortPage,
              path: 'complaints-inbox-sort',
            ),
            AutoRoute(
              page: ComplaintsDetailsViewPage,
              path: 'complaints-inbox-view-details',
            ),
          ],
        ),

        /// Complaints registration
        AutoRoute(
          page: ComplaintsRegistrationWrapperPage,
          path: 'complaints-registration',
          children: [
            AutoRoute(
              page: ComplaintTypePage,
              path: 'complaints-type',
              initial: true,
            ),
            AutoRoute(
              page: ComplaintsLocationPage,
              path: 'complaints-location',
            ),
            AutoRoute(
              page: ComplaintsDetailsPage,
              path: 'complaints-details',
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
