import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary/deliver_intervention.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary/household_overview.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary_registration/household_details.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary_registration/individual_details.dart';

import '';

export 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
    AutoRoute(page: IndividualDetailsPage, path: 'individual-details'),
    AutoRoute(page: HouseholdOverviewPage, path: 'household-overview'),
    AutoRoute(page: DeliverInterventionPage, path: 'deliver-intervention'),
    AutoRoute(page: ManageStocksPage, path: 'manage-stocks'),
    AutoRoute(page: StockReconciliationPage, path: 'reconcile-stocks'),
    AutoRoute(page: WarehouseDetailsPage, path: 'warehouse-details'),
    AutoRoute(page: StockReceivedDetailsPage, path: 'stock-receipt-details'),
    AutoRoute(page: StockIssuedDetailsPage, path: 'stock-issued-details'),
    AutoRoute(page: StockReturnedDetailsPage, path: 'stock-returned-details'),
    AutoRoute(page: StockDamagedDetailsPage, path: 'stock-damaged-details'),
    AutoRoute(page: StockLostDetailsPage, path: 'stock-lost-details'),
  ],
)
class AppRouter extends _$AppRouter {}
