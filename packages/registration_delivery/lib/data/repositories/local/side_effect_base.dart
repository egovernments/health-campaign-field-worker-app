import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/data/local_store/sql_store.dart';

import '../../../models/entities/side_effect.dart';

abstract class SideEffectLocalBaseRepository
    extends LocalRepository<SideEffectModel, SideEffectSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;
  const SideEffectLocalBaseRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  @override
  DataModelType get type => DataModelType.sideEffect;

  @override
  TableInfo get table => registrationLocalSqlDataStore.sideEffect;
}
