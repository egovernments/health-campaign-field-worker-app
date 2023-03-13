// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ServiceDefinitionRemoteRepository extends RemoteRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  ServiceDefinitionRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ServiceDefinition',
  });

  @override
  DataModelType get type => DataModelType.serviceDefinition;
}
