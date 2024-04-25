import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/individual.dart';
import '../../local_store/sql_store.dart';

abstract class IndividualLocalBaseRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;
  const IndividualLocalBaseRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  @override
  DataModelType get type => DataModelType.individual;

  @override
  TableInfo get table => registrationLocalSqlDataStore.individual;
}
