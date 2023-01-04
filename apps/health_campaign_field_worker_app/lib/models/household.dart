// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdRequestModel extends DataModel {
  
  HouseholdRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class HouseholdModel extends DataModel implements HouseholdRequestModel {
  final String? id;
  final String tenantId;
  final String clientReferenceId;
  final int memberCount;
  final int rowVersion;
  final AddressRequestModel address;
  

  HouseholdModel({
    this.id,
    required this.tenantId,
    required this.clientReferenceId,
    required this.memberCount,
    required this.rowVersion,
    required this.address,
    super.auditDetails,
  }):  super();
}
