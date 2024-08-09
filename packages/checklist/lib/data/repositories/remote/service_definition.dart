// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/service_definition.dart'as svc_def;

class ServiceDefinitionRemoteRepository extends RemoteRepository<svc_def.ServiceDefinitionModel, svc_def.ServiceDefinitionSearchModel> {
  ServiceDefinitionRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'ServiceDefinition',
      });

  @override
  DataModelType get type => DataModelType.serviceDefinition;
}
