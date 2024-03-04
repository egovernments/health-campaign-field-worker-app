// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'inventory_router.dart';

class _$InventoryRouter extends RootStackRouter {
  _$InventoryRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    RecordStockWrapperPageRoute.name: (routeData) {
      final args = routeData.argsAs<RecordStockWrapperPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RecordStockWrapperPage(
          key: args.key,
          type: args.type,
          projectId: args.projectId,
        )),
      );
    },
    ManageStocksPageRoute.name: (routeData) {
      final args = routeData.argsAs<ManageStocksPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ManageStocksPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          projectId: args.projectId,
          router: args.router,
        ),
      );
    },
    StockReconciliationPageRoute.name: (routeData) {
      final args = routeData.argsAs<StockReconciliationPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StockReconciliationPage(
          projectId: args.projectId,
          isDistributor: args.isDistributor,
          isWareHouseMgr: args.isWareHouseMgr,
          loggedInUserUuid: args.loggedInUserUuid,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    FacilitySelectionPageRoute.name: (routeData) {
      final args = routeData.argsAs<FacilitySelectionPageRouteArgs>();
      return MaterialPageX<InventoryFacilityModel>(
        routeData: routeData,
        child: FacilitySelectionPage(
          key: args.key,
          facilities: args.facilities,
        ),
      );
    },
    InventoryReportSelectionPageRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportSelectionPageRouteArgs>(
          orElse: () => const InventoryReportSelectionPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: InventoryReportSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    InventoryReportDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportDetailsPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: InventoryReportDetailsPage(
          isDistributor: args.isDistributor,
          key: args.key,
          appLocalizations: args.appLocalizations,
          reportType: args.reportType,
          projectId: args.projectId,
        )),
      );
    },
    InventoryAcknowledgementPageRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryAcknowledgementPageRouteArgs>(
          orElse: () => const InventoryAcknowledgementPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: InventoryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    WarehouseDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<WarehouseDetailsPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WarehouseDetailsPage(
          boundaryName: args.boundaryName,
          projectId: args.projectId,
          isDistributor: args.isDistributor,
          isWareHouseMgr: args.isWareHouseMgr,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    StockDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailsPageRouteArgs>(
          orElse: () => const StockDetailsPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StockDetailsPage(
          isWareHouseMgr: args.isWareHouseMgr,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          RecordStockWrapperPageRoute.name,
          path: 'record-stock',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: RecordStockWrapperPageRoute.name,
              redirectTo: 'warehouse-details',
              fullMatch: true,
            ),
            RouteConfig(
              WarehouseDetailsPageRoute.name,
              path: 'warehouse-details',
              parent: RecordStockWrapperPageRoute.name,
            ),
            RouteConfig(
              StockDetailsPageRoute.name,
              path: 'details',
              parent: RecordStockWrapperPageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          ManageStocksPageRoute.name,
          path: 'manage-stocks',
        ),
        RouteConfig(
          StockReconciliationPageRoute.name,
          path: 'stock-reconciliation',
        ),
        RouteConfig(
          FacilitySelectionPageRoute.name,
          path: 'select-facilities',
        ),
        RouteConfig(
          InventoryReportSelectionPageRoute.name,
          path: 'inventory-report-selection',
        ),
        RouteConfig(
          InventoryReportDetailsPageRoute.name,
          path: 'inventory-report-details',
        ),
        RouteConfig(
          InventoryAcknowledgementPageRoute.name,
          path: 'acknowledgement',
        ),
      ];
}

/// generated route for
/// [RecordStockWrapperPage]
class RecordStockWrapperPageRoute
    extends PageRouteInfo<RecordStockWrapperPageRouteArgs> {
  RecordStockWrapperPageRoute({
    Key? key,
    required StockRecordEntryType type,
    required String projectId,
    List<PageRouteInfo>? children,
  }) : super(
          RecordStockWrapperPageRoute.name,
          path: 'record-stock',
          args: RecordStockWrapperPageRouteArgs(
            key: key,
            type: type,
            projectId: projectId,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordStockWrapperPageRoute';
}

class RecordStockWrapperPageRouteArgs {
  const RecordStockWrapperPageRouteArgs({
    this.key,
    required this.type,
    required this.projectId,
  });

  final Key? key;

  final StockRecordEntryType type;

  final String projectId;

  @override
  String toString() {
    return 'RecordStockWrapperPageRouteArgs{key: $key, type: $type, projectId: $projectId}';
  }
}

/// generated route for
/// [ManageStocksPage]
class ManageStocksPageRoute extends PageRouteInfo<ManageStocksPageRouteArgs> {
  ManageStocksPageRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    required String projectId,
    required StackRouter router,
  }) : super(
          ManageStocksPageRoute.name,
          path: 'manage-stocks',
          args: ManageStocksPageRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            projectId: projectId,
            router: router,
          ),
        );

  static const String name = 'ManageStocksPageRoute';
}

class ManageStocksPageRouteArgs {
  const ManageStocksPageRouteArgs({
    this.key,
    this.appLocalizations,
    required this.projectId,
    required this.router,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final String projectId;

  final StackRouter router;

  @override
  String toString() {
    return 'ManageStocksPageRouteArgs{key: $key, appLocalizations: $appLocalizations, projectId: $projectId, router: $router}';
  }
}

/// generated route for
/// [StockReconciliationPage]
class StockReconciliationPageRoute
    extends PageRouteInfo<StockReconciliationPageRouteArgs> {
  StockReconciliationPageRoute({
    required String projectId,
    required bool? isDistributor,
    required bool? isWareHouseMgr,
    required String? loggedInUserUuid,
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          StockReconciliationPageRoute.name,
          path: 'stock-reconciliation',
          args: StockReconciliationPageRouteArgs(
            projectId: projectId,
            isDistributor: isDistributor,
            isWareHouseMgr: isWareHouseMgr,
            loggedInUserUuid: loggedInUserUuid,
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'StockReconciliationPageRoute';
}

class StockReconciliationPageRouteArgs {
  const StockReconciliationPageRouteArgs({
    required this.projectId,
    required this.isDistributor,
    required this.isWareHouseMgr,
    required this.loggedInUserUuid,
    this.key,
    this.appLocalizations,
  });

  final String projectId;

  final bool? isDistributor;

  final bool? isWareHouseMgr;

  final String? loggedInUserUuid;

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockReconciliationPageRouteArgs{projectId: $projectId, isDistributor: $isDistributor, isWareHouseMgr: $isWareHouseMgr, loggedInUserUuid: $loggedInUserUuid, key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [FacilitySelectionPage]
class FacilitySelectionPageRoute
    extends PageRouteInfo<FacilitySelectionPageRouteArgs> {
  FacilitySelectionPageRoute({
    Key? key,
    required List<InventoryFacilityModel> facilities,
  }) : super(
          FacilitySelectionPageRoute.name,
          path: 'select-facilities',
          args: FacilitySelectionPageRouteArgs(
            key: key,
            facilities: facilities,
          ),
        );

  static const String name = 'FacilitySelectionPageRoute';
}

class FacilitySelectionPageRouteArgs {
  const FacilitySelectionPageRouteArgs({
    this.key,
    required this.facilities,
  });

  final Key? key;

  final List<InventoryFacilityModel> facilities;

  @override
  String toString() {
    return 'FacilitySelectionPageRouteArgs{key: $key, facilities: $facilities}';
  }
}

/// generated route for
/// [InventoryReportSelectionPage]
class InventoryReportSelectionPageRoute
    extends PageRouteInfo<InventoryReportSelectionPageRouteArgs> {
  InventoryReportSelectionPageRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          InventoryReportSelectionPageRoute.name,
          path: 'inventory-report-selection',
          args: InventoryReportSelectionPageRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'InventoryReportSelectionPageRoute';
}

class InventoryReportSelectionPageRouteArgs {
  const InventoryReportSelectionPageRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'InventoryReportSelectionPageRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [InventoryReportDetailsPage]
class InventoryReportDetailsPageRoute
    extends PageRouteInfo<InventoryReportDetailsPageRouteArgs> {
  InventoryReportDetailsPageRoute({
    required bool? isDistributor,
    Key? key,
    InventoryLocalization? appLocalizations,
    required InventoryReportType reportType,
    required String projectId,
  }) : super(
          InventoryReportDetailsPageRoute.name,
          path: 'inventory-report-details',
          args: InventoryReportDetailsPageRouteArgs(
            isDistributor: isDistributor,
            key: key,
            appLocalizations: appLocalizations,
            reportType: reportType,
            projectId: projectId,
          ),
        );

  static const String name = 'InventoryReportDetailsPageRoute';
}

class InventoryReportDetailsPageRouteArgs {
  const InventoryReportDetailsPageRouteArgs({
    required this.isDistributor,
    this.key,
    this.appLocalizations,
    required this.reportType,
    required this.projectId,
  });

  final bool? isDistributor;

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final InventoryReportType reportType;

  final String projectId;

  @override
  String toString() {
    return 'InventoryReportDetailsPageRouteArgs{isDistributor: $isDistributor, key: $key, appLocalizations: $appLocalizations, reportType: $reportType, projectId: $projectId}';
  }
}

/// generated route for
/// [InventoryAcknowledgementPage]
class InventoryAcknowledgementPageRoute
    extends PageRouteInfo<InventoryAcknowledgementPageRouteArgs> {
  InventoryAcknowledgementPageRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
  }) : super(
          InventoryAcknowledgementPageRoute.name,
          path: 'acknowledgement',
          args: InventoryAcknowledgementPageRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
        );

  static const String name = 'InventoryAcknowledgementPageRoute';
}

class InventoryAcknowledgementPageRouteArgs {
  const InventoryAcknowledgementPageRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'InventoryAcknowledgementPageRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [WarehouseDetailsPage]
class WarehouseDetailsPageRoute
    extends PageRouteInfo<WarehouseDetailsPageRouteArgs> {
  WarehouseDetailsPageRoute({
    String boundaryName = '',
    required String projectId,
    bool? isDistributor = false,
    bool? isWareHouseMgr = false,
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          WarehouseDetailsPageRoute.name,
          path: 'warehouse-details',
          args: WarehouseDetailsPageRouteArgs(
            boundaryName: boundaryName,
            projectId: projectId,
            isDistributor: isDistributor,
            isWareHouseMgr: isWareHouseMgr,
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'WarehouseDetailsPageRoute';
}

class WarehouseDetailsPageRouteArgs {
  const WarehouseDetailsPageRouteArgs({
    this.boundaryName = '',
    required this.projectId,
    this.isDistributor = false,
    this.isWareHouseMgr = false,
    this.key,
    this.appLocalizations,
  });

  final String boundaryName;

  final String projectId;

  final bool? isDistributor;

  final bool? isWareHouseMgr;

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'WarehouseDetailsPageRouteArgs{boundaryName: $boundaryName, projectId: $projectId, isDistributor: $isDistributor, isWareHouseMgr: $isWareHouseMgr, key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [StockDetailsPage]
class StockDetailsPageRoute extends PageRouteInfo<StockDetailsPageRouteArgs> {
  StockDetailsPageRoute({
    bool? isWareHouseMgr,
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          StockDetailsPageRoute.name,
          path: 'details',
          args: StockDetailsPageRouteArgs(
            isWareHouseMgr: isWareHouseMgr,
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'StockDetailsPageRoute';
}

class StockDetailsPageRouteArgs {
  const StockDetailsPageRouteArgs({
    this.isWareHouseMgr,
    this.key,
    this.appLocalizations,
  });

  final bool? isWareHouseMgr;

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockDetailsPageRouteArgs{isWareHouseMgr: $isWareHouseMgr, key: $key, appLocalizations: $appLocalizations}';
  }
}
