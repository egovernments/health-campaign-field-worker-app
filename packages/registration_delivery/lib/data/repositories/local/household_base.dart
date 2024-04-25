import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/data/local_store/sql_store.dart';

import '../../../models/entities/household.dart';

abstract class HouseholdLocalBaseRepository
    extends LocalRepository<HouseholdModel, HouseholdSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;

  const HouseholdLocalBaseRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  @override
  DataModelType get type => DataModelType.household;

  @override
  TableInfo get table => registrationLocalSqlDataStore.household;
}
