import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/service_definition.dart';

abstract class ServiceDefinitionLocalBaseRepository
    extends LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  const ServiceDefinitionLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceDefinition;

  @override
  TableInfo get table => sql.serviceDefinition;
}
