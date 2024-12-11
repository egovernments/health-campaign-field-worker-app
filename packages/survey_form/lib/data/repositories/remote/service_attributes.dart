// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

import '../../../models/entities/service_attributes.dart';

class ServiceAttributesRemoteRepository extends RemoteRepository<
    ServiceAttributesModel, ServiceAttributesSearchModel> {
  ServiceAttributesRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ServiceAttributes',
  });

  @override
  DataModelType get type => DataModelType.serviceAttributes;
}
