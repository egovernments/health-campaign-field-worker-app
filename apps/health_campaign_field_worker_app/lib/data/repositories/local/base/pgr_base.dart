import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class PgrServiceLocalBaseRepository
    extends LocalRepository<PgrServiceModel, PgrServiceSearchModel> {
  PgrServiceLocalBaseRepository(super.sql, super.opLogManager);

  @override
  TableInfo<Table, dynamic> get table => sql.pgrService;

  @override
  DataModelType get type => DataModelType.complaints;
}
