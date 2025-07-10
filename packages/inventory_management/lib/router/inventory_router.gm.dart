// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:digit_data_model/data_model.dart' as _i19;
import 'package:flutter/material.dart' as _i15;
import 'package:inventory_management/blocs/app_localization.dart' as _i16;
import 'package:inventory_management/blocs/inventory_report.dart' as _i20;
import 'package:inventory_management/blocs/record_stock.dart' as _i18;
import 'package:inventory_management/models/entities/stock.dart' as _i17;
import 'package:inventory_management/pages/acknowledgement.dart' as _i1;
import 'package:inventory_management/pages/facility_selection.dart' as _i2;
import 'package:inventory_management/pages/manage_stocks.dart' as _i6;
import 'package:inventory_management/pages/record_stock/mange_stock_wrapper.dart'
    as _i5;
import 'package:inventory_management/pages/record_stock/min_number_page.dart'
    as _i7;
import 'package:inventory_management/pages/record_stock/record_stock_wrapper.dart'
    as _i8;
import 'package:inventory_management/pages/record_stock/stock_details.dart'
    as _i9;
import 'package:inventory_management/pages/record_stock/view_all_transaction_page.dart'
    as _i11;
import 'package:inventory_management/pages/record_stock/view_stock_record.dart'
    as _i12;
import 'package:inventory_management/pages/record_stock/warehouse_details.dart'
    as _i13;
import 'package:inventory_management/pages/reports/report_details.dart' as _i3;
import 'package:inventory_management/pages/reports/report_selection.dart'
    as _i4;
import 'package:inventory_management/pages/stock_reconciliation/stock_reconciliation.dart'
    as _i10;

abstract class $InventoryRoute extends _i14.AutoRouterModule {
  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    InventoryAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryAcknowledgementRouteArgs>(
          orElse: () => const InventoryAcknowledgementRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.InventoryAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          isDataRecordSuccess: args.isDataRecordSuccess,
          label: args.label,
          description: args.description,
          descriptionTableData: args.descriptionTableData,
          mrrnNumber: args.mrrnNumber,
          stockRecords: args.stockRecords,
          entryType: args.entryType,
        ),
      );
    },
    InventoryFacilitySelectionRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryFacilitySelectionRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.InventoryFacilitySelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          facilities: args.facilities,
        ),
      );
    },
    InventoryReportDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.InventoryReportDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          reportType: args.reportType,
        ),
      );
    },
    InventoryReportSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryReportSelectionRouteArgs>(
          orElse: () => const InventoryReportSelectionRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.InventoryReportSelectionPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ManageStockWrapperRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(child: const _i5.ManageStockWrapperPage()),
      );
    },
    ManageStocksRoute.name: (routeData) {
      final args = routeData.argsAs<ManageStocksRouteArgs>(
          orElse: () => const ManageStocksRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ManageStocksPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    MinNumberRoute.name: (routeData) {
      final args = routeData.argsAs<MinNumberRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MinNumberPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          type: args.type,
        ),
      );
    },
    RecordStockWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<RecordStockWrapperRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(
            child: _i8.RecordStockWrapperPage(
          key: args.key,
          type: args.type,
        )),
      );
    },
    StockDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailsRouteArgs>(
          orElse: () => const StockDetailsRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.StockDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    StockReconciliationRoute.name: (routeData) {
      final args = routeData.argsAs<StockReconciliationRouteArgs>(
          orElse: () => const StockReconciliationRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.StockReconciliationPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ViewAllTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAllTransactionsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ViewAllTransactionsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          warehouseId: args.warehouseId,
        ),
      );
    },
    ViewStockRecordsRoute.name: (routeData) {
      final args = routeData.argsAs<ViewStockRecordsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ViewStockRecordsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          mrnNumber: args.mrnNumber,
          stockRecords: args.stockRecords,
        ),
      );
    },
    WarehouseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WarehouseDetailsRouteArgs>(
          orElse: () => const WarehouseDetailsRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WarehouseDetailsPage(
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
    extends _i14.PageRouteInfo<InventoryAcknowledgementRouteArgs> {
  InventoryAcknowledgementRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    bool isDataRecordSuccess = false,
    String? label,
    String? description,
    Map<String, dynamic>? descriptionTableData,
    String? mrrnNumber,
    List<_i17.StockModel>? stockRecords,
    _i18.StockRecordEntryType? entryType,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          InventoryAcknowledgementRoute.name,
          args: InventoryAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            isDataRecordSuccess: isDataRecordSuccess,
            label: label,
            description: description,
            descriptionTableData: descriptionTableData,
            mrrnNumber: mrrnNumber,
            stockRecords: stockRecords,
            entryType: entryType,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryAcknowledgementRoute';

  static const _i14.PageInfo<InventoryAcknowledgementRouteArgs> page =
      _i14.PageInfo<InventoryAcknowledgementRouteArgs>(name);
}

class InventoryAcknowledgementRouteArgs {
  const InventoryAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
    this.mrrnNumber,
    this.stockRecords,
    this.entryType,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final bool isDataRecordSuccess;

  final String? label;

  final String? description;

  final Map<String, dynamic>? descriptionTableData;

  final String? mrrnNumber;

  final List<_i17.StockModel>? stockRecords;

  final _i18.StockRecordEntryType? entryType;

  @override
  String toString() {
    return 'InventoryAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations, isDataRecordSuccess: $isDataRecordSuccess, label: $label, description: $description, descriptionTableData: $descriptionTableData, mrrnNumber: $mrrnNumber, stockRecords: $stockRecords, entryType: $entryType}';
  }
}

/// generated route for
/// [_i2.InventoryFacilitySelectionPage]
class InventoryFacilitySelectionRoute
    extends _i14.PageRouteInfo<InventoryFacilitySelectionRouteArgs> {
  InventoryFacilitySelectionRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    required List<_i19.FacilityModel> facilities,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          InventoryFacilitySelectionRoute.name,
          args: InventoryFacilitySelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            facilities: facilities,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryFacilitySelectionRoute';

  static const _i14.PageInfo<InventoryFacilitySelectionRouteArgs> page =
      _i14.PageInfo<InventoryFacilitySelectionRouteArgs>(name);
}

class InventoryFacilitySelectionRouteArgs {
  const InventoryFacilitySelectionRouteArgs({
    this.key,
    this.appLocalizations,
    required this.facilities,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final List<_i19.FacilityModel> facilities;

  @override
  String toString() {
    return 'InventoryFacilitySelectionRouteArgs{key: $key, appLocalizations: $appLocalizations, facilities: $facilities}';
  }
}

/// generated route for
/// [_i3.InventoryReportDetailsPage]
class InventoryReportDetailsRoute
    extends _i14.PageRouteInfo<InventoryReportDetailsRouteArgs> {
  InventoryReportDetailsRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    required _i20.InventoryReportType reportType,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<InventoryReportDetailsRouteArgs> page =
      _i14.PageInfo<InventoryReportDetailsRouteArgs>(name);
}

class InventoryReportDetailsRouteArgs {
  const InventoryReportDetailsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.reportType,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final _i20.InventoryReportType reportType;

  @override
  String toString() {
    return 'InventoryReportDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations, reportType: $reportType}';
  }
}

/// generated route for
/// [_i4.InventoryReportSelectionPage]
class InventoryReportSelectionRoute
    extends _i14.PageRouteInfo<InventoryReportSelectionRouteArgs> {
  InventoryReportSelectionRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          InventoryReportSelectionRoute.name,
          args: InventoryReportSelectionRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryReportSelectionRoute';

  static const _i14.PageInfo<InventoryReportSelectionRouteArgs> page =
      _i14.PageInfo<InventoryReportSelectionRouteArgs>(name);
}

class InventoryReportSelectionRouteArgs {
  const InventoryReportSelectionRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'InventoryReportSelectionRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i5.ManageStockWrapperPage]
class ManageStockWrapperRoute extends _i14.PageRouteInfo<void> {
  const ManageStockWrapperRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ManageStockWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageStockWrapperRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ManageStocksPage]
class ManageStocksRoute extends _i14.PageRouteInfo<ManageStocksRouteArgs> {
  ManageStocksRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ManageStocksRoute.name,
          args: ManageStocksRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ManageStocksRoute';

  static const _i14.PageInfo<ManageStocksRouteArgs> page =
      _i14.PageInfo<ManageStocksRouteArgs>(name);
}

class ManageStocksRouteArgs {
  const ManageStocksRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'ManageStocksRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i7.MinNumberPage]
class MinNumberRoute extends _i14.PageRouteInfo<MinNumberRouteArgs> {
  MinNumberRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    required dynamic type,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MinNumberRoute.name,
          args: MinNumberRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'MinNumberRoute';

  static const _i14.PageInfo<MinNumberRouteArgs> page =
      _i14.PageInfo<MinNumberRouteArgs>(name);
}

class MinNumberRouteArgs {
  const MinNumberRouteArgs({
    this.key,
    this.appLocalizations,
    required this.type,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final dynamic type;

  @override
  String toString() {
    return 'MinNumberRouteArgs{key: $key, appLocalizations: $appLocalizations, type: $type}';
  }
}

/// generated route for
/// [_i8.RecordStockWrapperPage]
class RecordStockWrapperRoute
    extends _i14.PageRouteInfo<RecordStockWrapperRouteArgs> {
  RecordStockWrapperRoute({
    _i15.Key? key,
    required _i18.StockRecordEntryType type,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RecordStockWrapperRoute.name,
          args: RecordStockWrapperRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordStockWrapperRoute';

  static const _i14.PageInfo<RecordStockWrapperRouteArgs> page =
      _i14.PageInfo<RecordStockWrapperRouteArgs>(name);
}

class RecordStockWrapperRouteArgs {
  const RecordStockWrapperRouteArgs({
    this.key,
    required this.type,
  });

  final _i15.Key? key;

  final _i18.StockRecordEntryType type;

  @override
  String toString() {
    return 'RecordStockWrapperRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i9.StockDetailsPage]
class StockDetailsRoute extends _i14.PageRouteInfo<StockDetailsRouteArgs> {
  StockDetailsRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          StockDetailsRoute.name,
          args: StockDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'StockDetailsRoute';

  static const _i14.PageInfo<StockDetailsRouteArgs> page =
      _i14.PageInfo<StockDetailsRouteArgs>(name);
}

class StockDetailsRouteArgs {
  const StockDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i10.StockReconciliationPage]
class StockReconciliationRoute
    extends _i14.PageRouteInfo<StockReconciliationRouteArgs> {
  StockReconciliationRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          StockReconciliationRoute.name,
          args: StockReconciliationRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'StockReconciliationRoute';

  static const _i14.PageInfo<StockReconciliationRouteArgs> page =
      _i14.PageInfo<StockReconciliationRouteArgs>(name);
}

class StockReconciliationRouteArgs {
  const StockReconciliationRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'StockReconciliationRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i11.ViewAllTransactionsPage]
class ViewAllTransactionsRoute
    extends _i14.PageRouteInfo<ViewAllTransactionsRouteArgs> {
  ViewAllTransactionsRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    required String? warehouseId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewAllTransactionsRoute.name,
          args: ViewAllTransactionsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            warehouseId: warehouseId,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewAllTransactionsRoute';

  static const _i14.PageInfo<ViewAllTransactionsRouteArgs> page =
      _i14.PageInfo<ViewAllTransactionsRouteArgs>(name);
}

class ViewAllTransactionsRouteArgs {
  const ViewAllTransactionsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.warehouseId,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final String? warehouseId;

  @override
  String toString() {
    return 'ViewAllTransactionsRouteArgs{key: $key, appLocalizations: $appLocalizations, warehouseId: $warehouseId}';
  }
}

/// generated route for
/// [_i12.ViewStockRecordsPage]
class ViewStockRecordsRoute
    extends _i14.PageRouteInfo<ViewStockRecordsRouteArgs> {
  ViewStockRecordsRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    required String mrnNumber,
    required List<_i17.StockModel> stockRecords,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewStockRecordsRoute.name,
          args: ViewStockRecordsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            mrnNumber: mrnNumber,
            stockRecords: stockRecords,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewStockRecordsRoute';

  static const _i14.PageInfo<ViewStockRecordsRouteArgs> page =
      _i14.PageInfo<ViewStockRecordsRouteArgs>(name);
}

class ViewStockRecordsRouteArgs {
  const ViewStockRecordsRouteArgs({
    this.key,
    this.appLocalizations,
    required this.mrnNumber,
    required this.stockRecords,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  final String mrnNumber;

  final List<_i17.StockModel> stockRecords;

  @override
  String toString() {
    return 'ViewStockRecordsRouteArgs{key: $key, appLocalizations: $appLocalizations, mrnNumber: $mrnNumber, stockRecords: $stockRecords}';
  }
}

/// generated route for
/// [_i13.WarehouseDetailsPage]
class WarehouseDetailsRoute
    extends _i14.PageRouteInfo<WarehouseDetailsRouteArgs> {
  WarehouseDetailsRoute({
    _i15.Key? key,
    _i16.InventoryLocalization? appLocalizations,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          WarehouseDetailsRoute.name,
          args: WarehouseDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'WarehouseDetailsRoute';

  static const _i14.PageInfo<WarehouseDetailsRouteArgs> page =
      _i14.PageInfo<WarehouseDetailsRouteArgs>(name);
}

class WarehouseDetailsRouteArgs {
  const WarehouseDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i15.Key? key;

  final _i16.InventoryLocalization? appLocalizations;

  @override
  String toString() {
    return 'WarehouseDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
