import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:checklist/checklist.dart';

abstract class ServiceDefinitionLocalBaseRepository
    extends LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  const ServiceDefinitionLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.serviceDefinition;

  TableInfo get table => sql.serviceDefinition;
}
