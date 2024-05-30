// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/models/entities/stock.dart';

class StockRemoteRepository extends RemoteRepository<StockModel, StockSearchModel> {
  StockRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'Stock',
      });

  @override
  DataModelType get type => DataModelType.stock;
}