import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/record_stock/stock_details.dart';

import '../../blocs/record_stock.dart';

class RecordStockWrapperPage extends StatelessWidget with AutoRouteWrapper {
  final StockRecordEntryType type;
  final String projectId;

  const RecordStockWrapperPage({
    super.key,
    required this.type,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return projectId.isEmpty
        ? const Center(
            child: Text('No project selected'),
          )
        : const StockDetailsPage(isWareHouseMgr: true,);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return projectId.isEmpty
        ? const Center(
            child: Text('No project selected'),
          )
        : const StockDetailsPage(isWareHouseMgr: true,);
  }
}
