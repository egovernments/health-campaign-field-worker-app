import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/record_stock/record_stock_wrapper.dart';

import '../blocs/app_localization.dart';
import '../blocs/inventory_report.dart';
import '../blocs/record_stock.dart';
import '../models/entities/inventory_facility.dart';
import '../pages/acknowledgement.dart';
import '../pages/facility_selection.dart';
import '../pages/manage_stocks.dart';
import '../pages/record_stock/stock_details.dart';
import '../pages/record_stock/warehouse_details.dart';
import '../pages/reports/report_details.dart';
import '../pages/reports/report_selection.dart';
import '../pages/stock_reconciliation/stock_reconciliation.dart';

export 'package:auto_route/auto_route.dart';

part 'inventory_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
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
    AutoRoute<InventoryFacilityModel>(
      page: FacilitySelectionPage,
      path: 'select-facilities',
    ),
    AutoRoute(
      page: InventoryReportSelectionPage,
      path: 'inventory-report-selection',
    ),
    AutoRoute(
      page: InventoryReportDetailsPage,
      path: 'inventory-report-details',
    ),
    AutoRoute(page: InventoryAcknowledgementPage, path: 'acknowledgement'),
  ],
)
class InventoryRouter extends _$InventoryRouter {}
