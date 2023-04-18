import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/record_stock/record_stock.dart';
import '../blocs/search_households/search_households.dart';
import '../models/data_model.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/beneficiary/beneficiary_wrapper.dart';
import '../pages/beneficiary/deliver_intervention.dart';
import '../pages/beneficiary/household_overview.dart';
import '../pages/beneficiary_registration/beneficiary_registration_wrapper.dart';
import '../pages/beneficiary_registration/household_details.dart';
import '../pages/beneficiary_registration/household_location.dart';
import '../pages/beneficiary_registration/individual_details.dart';
import '../pages/checklist/checklist.dart';
import '../pages/checklist/checklist_boundary_view.dart';
import '../pages/checklist/checklist_preview.dart';
import '../pages/checklist/checklist_view.dart';
import '../pages/checklist/checklist_wrapper.dart';
import '../pages/home.dart';
import '../pages/inventory/facility_selection.dart';
import '../pages/inventory/manage_stocks.dart';
import '../pages/inventory/record_stock/record_stock_wrapper.dart';
import '../pages/inventory/record_stock/stock_details.dart';
import '../pages/inventory/record_stock/warehouse_details.dart';
import '../pages/inventory/stock_reconciliation/stock_reconciliation.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/project_selection.dart';
import '../pages/search_beneficiary.dart';
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
        AutoRoute(page: SearchBeneficiaryPage, path: 'search-beneficiary'),

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
              page: DeliverInterventionPage,
              path: 'deliver-intervention',
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
        AutoRoute(page: AcknowledgementPage, path: 'acknowledgement'),

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

        /// Project Selection
        AutoRoute(
          page: ProjectSelectionPage,
          path: 'select-project',
          initial: true,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
