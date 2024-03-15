import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class StockReconciliationLocalBaseRepository
    extends LocalRepository<HcmStockReconciliationModel, HcmStockReconciliationSearchModel> {
  const StockReconciliationLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.stockReconciliation;

  @override
  TableInfo get table => sql.stockReconciliation;
}