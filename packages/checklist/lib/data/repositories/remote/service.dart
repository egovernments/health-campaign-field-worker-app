// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/service.dart' as service;

class ServiceRemoteRepository extends RemoteRepository<service.ServiceModel, service.ServiceSearchModel> {
  ServiceRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'Service',
      });

  @override
  DataModelType get type => DataModelType.service;
}
