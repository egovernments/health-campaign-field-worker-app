import 'package:dart_mappable/dart_mappable.dart';

import 'address.dart';
import 'data_model.dart';

@MappableClass()
class HouseholdRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final int? memberCount;
  final int? rowVersion;
  final AddressRequestModel? address;
  
  HouseholdRequestModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.memberCount,
    this.rowVersion,
    this.address,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class HouseholdModel extends DataModel implements HouseholdRequestModel {
  
  @override
  final String id;
  
  @override
  final String tenantId;
  
  @override
  final String clientReferenceId;
  
  @override
  final int memberCount;
  
  @override
  final int rowVersion;
  
  @override
  final AddressRequestModel address;
  

  HouseholdModel({
    required this.id,
    required this.tenantId,
    required this.clientReferenceId,
    required this.memberCount,
    required this.rowVersion,
    required this.address,
    super.auditDetails,
  }):  super();
}
