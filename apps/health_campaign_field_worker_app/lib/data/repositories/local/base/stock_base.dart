import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class StockLocalBaseRepository
    extends LocalRepository<StockModel, StockSearchModel> {
  const StockLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.stock;

  @override
  TableInfo get table => sql.stock;
}