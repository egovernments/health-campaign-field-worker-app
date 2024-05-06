import 'package:drift/drift.dart';
import 'package:digit_data_model/data_model.dart';

import '../../../../models/entities/stock_reconciliation.dart';

abstract class StockReconciliationLocalBaseRepository extends LocalRepository<
    StockReconciliationModel, StockReconciliationSearchModel> {
  const StockReconciliationLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.stockReconciliation;

  @override
  TableInfo get table => sql.stockReconciliation;
}
