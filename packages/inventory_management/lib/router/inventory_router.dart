import 'package:auto_route/auto_route.dart';

import 'inventory_router.gm.dart';

@AutoRouterConfig.module()
class InventoryRoute extends $InventoryRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
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
          AutoRoute(
              page: ViewAllTransactionsRoute.page,
              path: 'view-all-transactions')
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
  ];
}
