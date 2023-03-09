// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class StockRemoteRepository extends RemoteRepository<StockModel, StockSearchModel> {
  StockRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Stock',
  });

  @override
  DataModelType get type => DataModelType.stock;
}
