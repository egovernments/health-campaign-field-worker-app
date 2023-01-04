// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class FacilityRequestModel extends DataModel {
  
  FacilityRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class FacilityModel extends DataModel implements FacilityRequestModel {
  final String? id;
  final String tenantId;
  final bool isPermanent;
  final String usage;
  final int storageCapacity;
  final int rowVersion;
  final String clientReferenceId;
  final AddressRequestModel address;
  

  FacilityModel({
    this.id,
    required this.tenantId,
    required this.isPermanent,
    required this.usage,
    required this.storageCapacity,
    required this.rowVersion,
    required this.clientReferenceId,
    required this.address,
    super.auditDetails,
  }):  super();
}
