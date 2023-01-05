// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdSearchModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final int? memberCount;
  
  HouseholdSearchModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.memberCount,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdModel extends DataModel implements HouseholdSearchModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String clientReferenceId;
  
  @override
  final int memberCount;
  final int rowVersion;
  final AddressSearchModel address;
  

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
