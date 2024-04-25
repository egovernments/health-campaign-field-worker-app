import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../../models/entities/service_definition.dart';
import '../../../data_repository.dart';
import '../../../local_store/sql_store/sql_store.dart';

abstract class ServiceDefinitionLocalBaseRepository
    extends LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  const ServiceDefinitionLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceDefinition;

  @override
  TableInfo get table => sql.serviceDefinition;
}
