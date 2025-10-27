import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class StockReconciliationLocalBaseRepository extends LocalRepository<
    StockReconciliationModel, StockReconciliationSearchModel> {
  const StockReconciliationLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.stockReconciliation;

  TableInfo get table => sql.stockReconciliation;
}
