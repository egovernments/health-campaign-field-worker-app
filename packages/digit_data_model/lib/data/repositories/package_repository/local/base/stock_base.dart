import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class StockLocalBaseRepository
    extends LocalRepository<StockModel, StockSearchModel> {
  const StockLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.stock;

  TableInfo get table => sql.stock;
}
