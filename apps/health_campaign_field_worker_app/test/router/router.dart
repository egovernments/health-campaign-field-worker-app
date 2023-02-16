import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary_registration/household_details.dart';
import 'package:health_campaign_field_worker_app/pages/beneficiary_registration/individual_details.dart';
import 'package:health_campaign_field_worker_app/pages/deliver_intervention.dart';
import 'package:health_campaign_field_worker_app/pages/household_overview.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/stock_damaged_details.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/stock_issued_details.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/stock_lost_details.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/stock_received_details.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/stock_returned_details.dart';
import 'package:health_campaign_field_worker_app/pages/manage_stocks.dart';
import 'package:health_campaign_field_worker_app/pages/stock_reconciliation.dart';
import 'package:health_campaign_field_worker_app/pages/warehouse_details.dart';

export 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
    AutoRoute(page: IndividualDetailsPage, path: 'individual-details'),
    AutoRoute(page: HouseholdOverViewPage, path: 'household-overview'),
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
