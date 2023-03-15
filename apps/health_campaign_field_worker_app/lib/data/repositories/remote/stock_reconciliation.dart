// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class StockReconciliationRemoteRepository extends RemoteRepository<
    StockReconciliationModel, StockReconciliationSearchModel> {
  StockReconciliationRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'StockReconciliation',
    super.isPlural = false,
  });

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}
