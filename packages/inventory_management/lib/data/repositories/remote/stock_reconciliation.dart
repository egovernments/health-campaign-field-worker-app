// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';


class StockReconciliationRemoteRepository extends RemoteRepository<StockReconciliationModel, StockReconciliationSearchModel> {
  StockReconciliationRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'StockReconciliation',
      });

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}