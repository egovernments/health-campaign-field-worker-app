// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/service.dart';

class ServiceRemoteRepository
    extends RemoteRepository<ServiceModel, ServiceSearchModel> {
  ServiceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Service',
  });

  @override
  DataModelType get type => DataModelType.service;
}
