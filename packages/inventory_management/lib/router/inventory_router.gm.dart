// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:inventory_management/blocs/app_localization.dart' as _i11;
import 'package:inventory_management/blocs/inventory_report.dart' as _i12;
import 'package:inventory_management/blocs/record_stock.dart' as _i13;
import 'package:inventory_management/pages/acknowledgement.dart' as _i1;
import 'package:inventory_management/pages/manage_stocks.dart' as _i4;
import 'package:inventory_management/pages/record_stock/record_stock_wrapper.dart'
    as _i5;
import 'package:inventory_management/pages/record_stock/stock_details.dart'
    as _i6;
import 'package:inventory_management/pages/record_stock/warehouse_details.dart'
    as _i8;
import 'package:inventory_management/pages/reports/report_details.dart' as _i2;
import 'package:inventory_management/pages/reports/report_selection.dart'
    as _i3;
import 'package:inventory_management/pages/stock_reconciliation/stock_reconciliation.dart'
    as _i7;

abstract class $InventoryRoute extends _i9.AutoRouterModule {
  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    InventoryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryAcknowledgementRouteArgs>(
          orElse: () => const InventoryAcknowledgementRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.InventoryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
        ),
      );
    },
    InventoryReportDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.InventoryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          reportType: args.reportType,
        ),
      );
    },
    InventoryReportSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportSelectionRouteArgs>(
          orElse: () => const InventoryReportSelectionRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.InventoryReportSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ManageStocksRoute.name: (routeData) {
      final args = routeData.argsAs<ManageStocksRouteArgs>(
          orElse: () => const ManageStocksRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ManageStocksPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    RecordStockWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<RecordStockWrapperRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i5.RecordStockWrapperPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    StockDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailsRouteArgs>(
          orElse: () => const StockDetailsRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.StockDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    StockReconciliationRoute.name: (routeData) {
      final args = routeData.argsAs<StockReconciliationRouteArgs>(
          orElse: () => const StockReconciliationRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.StockReconciliationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    WarehouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WarehouseDetailsRouteArgs>(
          orElse: () => const WarehouseDetailsRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WarehouseDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.InventoryAcknowledgementPage]
class InventoryAcknowledgementRoute
    extends _i9.PageRouteInfo<InventoryAcknowledgementRouteArgs> {
  InventoryAcknowledgementRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          InventoryAcknowledgementRoute.name,
          args: InventoryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryAcknowledgementRoute';

  static const _i9.PageInfo<InventoryAcknowledgementRouteArgs> page =
      _i9.PageInfo<InventoryAcknowledgementRouteArgs>(name);
}

class InventoryAcknowledgementRouteArgs {
  const InventoryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  @override
  String toString() {
    return 'InventoryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData}';
  }
}

/// generated route for
/// [_i2.InventoryReportDetailsPage]
class InventoryReportDetailsRoute
    extends _i9.PageRouteInfo<InventoryReportDetailsRouteArgs> {
  InventoryReportDetailsRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    required _i12.InventoryReportType reportType,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          InventoryReportDetailsRoute.name,
          args: InventoryReportDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            reportType: reportType,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryReportDetailsRoute';

  static const _i9.PageInfo<InventoryReportDetailsRouteArgs> page =
      _i9.PageInfo<InventoryReportDetailsRouteArgs>(name);
}

class InventoryReportDetailsRouteArgs {
  const InventoryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.reportType,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  final _i12.InventoryReportType reportType;

  @override
  String toString() {
    return 'InventoryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, reportType: $reportType}';
  }
}

/// generated route for
/// [_i3.InventoryReportSelectionPage]
class InventoryReportSelectionRoute
    extends _i9.PageRouteInfo<InventoryReportSelectionRouteArgs> {
  InventoryReportSelectionRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          InventoryReportSelectionRoute.name,
          args: InventoryReportSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryReportSelectionRoute';

  static const _i9.PageInfo<InventoryReportSelectionRouteArgs> page =
      _i9.PageInfo<InventoryReportSelectionRouteArgs>(name);
}

class InventoryReportSelectionRouteArgs {
  const InventoryReportSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'InventoryReportSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ManageStocksPage]
class ManageStocksRoute extends _i9.PageRouteInfo<ManageStocksRouteArgs> {
  ManageStocksRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ManageStocksRoute.name,
          args: ManageStocksRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ManageStocksRoute';

  static const _i9.PageInfo<ManageStocksRouteArgs> page =
      _i9.PageInfo<ManageStocksRouteArgs>(name);
}

class ManageStocksRouteArgs {
  const ManageStocksRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'ManageStocksRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.RecordStockWrapperPage]
class RecordStockWrapperRoute
    extends _i9.PageRouteInfo<RecordStockWrapperRouteArgs> {
  RecordStockWrapperRoute({
    _i10.Key? key,
    required _i13.StockRecordEntryType type,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RecordStockWrapperRoute.name,
          args: RecordStockWrapperRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordStockWrapperRoute';

  static const _i9.PageInfo<RecordStockWrapperRouteArgs> page =
      _i9.PageInfo<RecordStockWrapperRouteArgs>(name);
}

class RecordStockWrapperRouteArgs {
  const RecordStockWrapperRouteArgs({
    this.key,
    required this.type,
  });

  final _i10.Key? key;

  final _i13.StockRecordEntryType type;

  @override
  String toString() {
    return 'RecordStockWrapperRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i6.StockDetailsPage]
class StockDetailsRoute extends _i9.PageRouteInfo<StockDetailsRouteArgs> {
  StockDetailsRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          StockDetailsRoute.name,
          args: StockDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'StockDetailsRoute';

  static const _i9.PageInfo<StockDetailsRouteArgs> page =
      _i9.PageInfo<StockDetailsRouteArgs>(name);
}

class StockDetailsRouteArgs {
  const StockDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.StockReconciliationPage]
class StockReconciliationRoute
    extends _i9.PageRouteInfo<StockReconciliationRouteArgs> {
  StockReconciliationRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          StockReconciliationRoute.name,
          args: StockReconciliationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'StockReconciliationRoute';

  static const _i9.PageInfo<StockReconciliationRouteArgs> page =
      _i9.PageInfo<StockReconciliationRouteArgs>(name);
}

class StockReconciliationRouteArgs {
  const StockReconciliationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockReconciliationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i8.WarehouseDetailsPage]
class WarehouseDetailsRoute
    extends _i9.PageRouteInfo<WarehouseDetailsRouteArgs> {
  WarehouseDetailsRoute({
    _i10.Key? key,
    _i11.InventoryLocalization? appLocalizations,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WarehouseDetailsRoute.name,
          args: WarehouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'WarehouseDetailsRoute';

  static const _i9.PageInfo<WarehouseDetailsRouteArgs> page =
      _i9.PageInfo<WarehouseDetailsRouteArgs>(name);
}

class WarehouseDetailsRouteArgs {
  const WarehouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i10.Key? key;

  final _i11.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'WarehouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
