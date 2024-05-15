// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class ReferralReconServiceRemoteRepository
    extends RemoteRepository<ServiceModel, ServiceSearchModel> {
  ReferralReconServiceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Service',
  });

  @override
  DataModelType get type => DataModelType.service;
}
