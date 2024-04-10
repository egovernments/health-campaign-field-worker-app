import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class BoundaryLocalBaseRepository
    extends LocalRepository<BoundaryModel, BoundarySearchModel> {
  BoundaryLocalBaseRepository(super.sql, super.opLogManager);

  @override
  TableInfo<Table, dynamic> get table => sql.boundary;

  @override
  DataModelType get type => DataModelType.boundary;
}
