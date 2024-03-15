// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class StockReconciliationRemoteRepository extends RemoteRepository<
    HcmStockReconciliationModel, HcmStockReconciliationSearchModel> {
  StockReconciliationRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'StockReconciliation',
  });

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}
