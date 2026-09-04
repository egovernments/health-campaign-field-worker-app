import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

abstract class SideEffectLocalBaseRepository
    extends LocalRepository<SideEffectModel, SideEffectSearchModel> {
  const SideEffectLocalBaseRepository(
    super.sql,
    super.opLogManager,
  );

  @override
  DataModelType get type => DataModelType.sideEffect;

  TableInfo get table => sql.sideEffect;
}
