@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library inventory_management;

import 'package:dart_mappable/dart_mappable.dart';

export 'data/repositories/local/base/stock_base.dart';
export 'data/repositories/local/base/stock_reconciliation_base.dart';
export 'data/repositories/local/stock.dart';
export 'data/repositories/local/stock_reconciliation.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/remote/stock.dart';
export 'data/repositories/remote/stock_reconciliation.dart';
export 'inventory_management.init.dart';
export 'models/entities/inventory_enums.dart';
export 'models/entities/inventory_transport_type.dart';
export 'models/entities/transaction_reason.dart';
export 'models/entities/transaction_type.dart';
export 'pages/acknowledgement.dart';
export 'pages/facility_selection.dart';
export 'pages/manage_stocks.dart';
export 'pages/record_stock/record_stock_wrapper.dart';
export 'pages/record_stock/stock_details.dart';
export 'pages/record_stock/warehouse_details.dart';
export 'pages/reports/report_details.dart';
export 'pages/reports/report_selection.dart';
export 'pages/stock_reconciliation/stock_reconciliation.dart';
export 'router/inventory_router.dart';
export 'utils/utils.dart';
