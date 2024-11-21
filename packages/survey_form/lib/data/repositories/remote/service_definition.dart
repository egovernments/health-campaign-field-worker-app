// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class ServiceDefinitionRemoteRepository extends RemoteRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel> {
  ServiceDefinitionRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'ServiceDefinition',
      });

  @override
  DataModelType get type => DataModelType.serviceDefinition;
}
