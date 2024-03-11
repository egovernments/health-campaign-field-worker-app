// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HouseHoldDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HouseHoldDetailsRouteArgs>(
          orElse: () => const HouseHoldDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HouseHoldDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    IndividualDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualDetailsRouteArgs>(
          orElse: () => const IndividualDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: IndividualDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isHeadOfHousehold: args.isHeadOfHousehold,
        ),
      );
    },
    HouseholdOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdOverviewRouteArgs>(
          orElse: () => const HouseholdOverviewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HouseholdOverviewPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    DeliverInterventionRoute.name: (routeData) {
      final args = routeData.argsAs<DeliverInterventionRouteArgs>(
          orElse: () => const DeliverInterventionRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DeliverInterventionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isEditing: args.isEditing,
        ),
      );
    },
    ManageStocksRoute.name: (routeData) {
      final args = routeData.argsAs<ManageStocksRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ManageStocksPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          inventoryListener: args.inventoryListener,
          projectId: args.projectId,
          userId: args.userId,
          boundaryName: args.boundaryName,
          isDistributor: args.isDistributor,
          isWareHouseMgr: args.isWareHouseMgr,
          transportType: args.transportType,
        ),
      );
    },
    StockReconciliationRoute.name: (routeData) {
      final args = routeData.argsAs<StockReconciliationRouteArgs>();
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
    WarehouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WarehouseDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WarehouseDetailsPage(
          entryType: args.entryType,
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HouseHoldDetailsRoute.name,
          path: 'household-details',
        ),
        RouteConfig(
          IndividualDetailsRoute.name,
          path: 'individual-details',
        ),
        RouteConfig(
          HouseholdOverviewRoute.name,
          path: 'household-overview',
        ),
        RouteConfig(
          DeliverInterventionRoute.name,
          path: 'deliver-intervention',
        ),
        RouteConfig(
          ManageStocksRoute.name,
          path: 'manage-stocks',
        ),
        RouteConfig(
          StockReconciliationRoute.name,
          path: 'reconcile-stocks',
        ),
        RouteConfig(
          WarehouseDetailsRoute.name,
          path: 'warehouse-details',
        ),
      ];
}

/// generated route for
/// [HouseHoldDetailsPage]
class HouseHoldDetailsRoute extends PageRouteInfo<HouseHoldDetailsRouteArgs> {
  HouseHoldDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          HouseHoldDetailsRoute.name,
          path: 'household-details',
          args: HouseHoldDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HouseHoldDetailsRoute';
}

class HouseHoldDetailsRouteArgs {
  const HouseHoldDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HouseHoldDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [IndividualDetailsPage]
class IndividualDetailsRoute extends PageRouteInfo<IndividualDetailsRouteArgs> {
  IndividualDetailsRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isHeadOfHousehold = false,
  }) : super(
          IndividualDetailsRoute.name,
          path: 'individual-details',
          args: IndividualDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isHeadOfHousehold: isHeadOfHousehold,
          ),
        );

  static const String name = 'IndividualDetailsRoute';
}

class IndividualDetailsRouteArgs {
  const IndividualDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isHeadOfHousehold;

  @override
  String toString() {
    return 'IndividualDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, isHeadOfHousehold: $isHeadOfHousehold}';
  }
}

/// generated route for
/// [HouseholdOverviewPage]
class HouseholdOverviewRoute extends PageRouteInfo<HouseholdOverviewRouteArgs> {
  HouseholdOverviewRoute({
    Key? key,
    AppLocalizations? appLocalizations,
  }) : super(
          HouseholdOverviewRoute.name,
          path: 'household-overview',
          args: HouseholdOverviewRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'HouseholdOverviewRoute';
}

class HouseholdOverviewRouteArgs {
  const HouseholdOverviewRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  @override
  String toString() {
    return 'HouseholdOverviewRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [DeliverInterventionPage]
class DeliverInterventionRoute
    extends PageRouteInfo<DeliverInterventionRouteArgs> {
  DeliverInterventionRoute({
    Key? key,
    AppLocalizations? appLocalizations,
    bool isEditing = false,
  }) : super(
          DeliverInterventionRoute.name,
          path: 'deliver-intervention',
          args: DeliverInterventionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isEditing: isEditing,
          ),
        );

  static const String name = 'DeliverInterventionRoute';
}

class DeliverInterventionRouteArgs {
  const DeliverInterventionRouteArgs({
    this.key,
    this.appLocalizations,
    this.isEditing = false,
  });

  final Key? key;

  final AppLocalizations? appLocalizations;

  final bool isEditing;

  @override
  String toString() {
    return 'DeliverInterventionRouteArgs{key: $key, appLocalizations: $appLocalizations, isEditing: $isEditing}';
  }
}

/// generated route for
/// [ManageStocksPage]
class ManageStocksRoute extends PageRouteInfo<ManageStocksRouteArgs> {
  ManageStocksRoute({
    Key? key,
    InventoryLocalization? appLocalizations,
    required InventoryListener inventoryListener,
    required String projectId,
    required String userId,
    required String boundaryName,
    required bool isDistributor,
    required bool isWareHouseMgr,
    required List<InventoryTransportTypes>? transportType,
  }) : super(
          ManageStocksRoute.name,
          path: 'manage-stocks',
          args: ManageStocksRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            inventoryListener: inventoryListener,
            projectId: projectId,
            userId: userId,
            boundaryName: boundaryName,
            isDistributor: isDistributor,
            isWareHouseMgr: isWareHouseMgr,
            transportType: transportType,
          ),
        );

  static const String name = 'ManageStocksRoute';
}

class ManageStocksRouteArgs {
  const ManageStocksRouteArgs({
    this.key,
    this.appLocalizations,
    required this.inventoryListener,
    required this.projectId,
    required this.userId,
    required this.boundaryName,
    required this.isDistributor,
    required this.isWareHouseMgr,
    required this.transportType,
  });

  final Key? key;

  final InventoryLocalization? appLocalizations;

  final InventoryListener inventoryListener;

  final String projectId;

  final String userId;

  final String boundaryName;

  final bool isDistributor;

  final bool isWareHouseMgr;

  final List<InventoryTransportTypes>? transportType;

  @override
  String toString() {
    return 'ManageStocksRouteArgs{key: $key, appLocalizations: $appLocalizations, inventoryListener: $inventoryListener, projectId: $projectId, userId: $userId, boundaryName: $boundaryName, isDistributor: $isDistributor, isWareHouseMgr: $isWareHouseMgr, transportType: $transportType}';
  }
}

/// generated route for
/// [StockReconciliationPage]
class StockReconciliationRoute
    extends PageRouteInfo<StockReconciliationRouteArgs> {
  StockReconciliationRoute({
    required String projectId,
    required bool? isDistributor,
    required bool? isWareHouseMgr,
    required String? loggedInUserUuid,
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          StockReconciliationRoute.name,
          path: 'reconcile-stocks',
          args: StockReconciliationRouteArgs(
            projectId: projectId,
            isDistributor: isDistributor,
            isWareHouseMgr: isWareHouseMgr,
            loggedInUserUuid: loggedInUserUuid,
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'StockReconciliationRoute';
}

class StockReconciliationRouteArgs {
  const StockReconciliationRouteArgs({
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
    return 'StockReconciliationRouteArgs{projectId: $projectId, isDistributor: $isDistributor, isWareHouseMgr: $isWareHouseMgr, loggedInUserUuid: $loggedInUserUuid, key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [WarehouseDetailsPage]
class WarehouseDetailsRoute extends PageRouteInfo<WarehouseDetailsRouteArgs> {
  WarehouseDetailsRoute({
    required StockRecordEntryType entryType,
    Key? key,
    InventoryLocalization? appLocalizations,
  }) : super(
          WarehouseDetailsRoute.name,
          path: 'warehouse-details',
          args: WarehouseDetailsRouteArgs(
            entryType: entryType,
            key: key,
            appLocalizations: appLocalizations,
          ),
        );

  static const String name = 'WarehouseDetailsRoute';
}

class WarehouseDetailsRouteArgs {
  const WarehouseDetailsRouteArgs({
    required this.entryType,
    this.key,
    this.appLocalizations,
  });

  final StockRecordEntryType entryType;

  final Key? key;

  final InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'WarehouseDetailsRouteArgs{entryType: $entryType, key: $key, appLocalizations: $appLocalizations}';
  }
}
