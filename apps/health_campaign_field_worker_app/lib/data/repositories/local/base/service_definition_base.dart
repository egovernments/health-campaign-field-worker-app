import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class ServiceDefinitionLocalBaseRepository
    extends LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  const ServiceDefinitionLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceDefinition;

  @override
  TableInfo get table => sql.serviceDefinition;
}