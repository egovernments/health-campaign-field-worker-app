import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class SideEffectLocalBaseRepository
    extends LocalRepository<SideEffectModel, SideEffectSearchModel> {
  const SideEffectLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.sideEffect;

  @override
  TableInfo get table => sql.sideEffect;
}