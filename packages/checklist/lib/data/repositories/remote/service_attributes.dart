// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/service_attributes.dart' as svc_att;

class ServiceAttributesRemoteRepository extends RemoteRepository<svc_att.ServiceAttributesModel, svc_att.ServiceAttributesSearchModel> {
  ServiceAttributesRemoteRepository(
      super.dio, {
        required super.actionMap,
        super.entityName = 'ServiceAttributes',
      });

  @override
  DataModelType get type => DataModelType.serviceAttributes;
}
