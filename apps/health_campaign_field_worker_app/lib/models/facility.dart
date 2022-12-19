import 'package:dart_mappable/dart_mappable.dart';

import 'address.dart';
import 'data_model.dart';

@MappableClass()
class FacilityRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final int? rowVersion;
  
  final AddressRequestModel? address;
  
  
  FacilityRequestModel({
    this.id,
    this.tenantId,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.rowVersion,
    this.address,
    super.auditDetails,
  }):  super();

  
}

@MappableClass()
class FacilityModel extends DataModel implements FacilityRequestModel {
  
  @override
  final String id;
  
  @override
  final String tenantId;
  
  @override
  final bool isPermanent;
  
  @override
  final String usage;
  
  @override
  final int storageCapacity;
  
  @override
  final int rowVersion;
  
  
  @override
  final AddressRequestModel address;
  
  

  FacilityModel({
    required this.id,
    required this.tenantId,
    required this.isPermanent,
    required this.usage,
    required this.storageCapacity,
    required this.rowVersion,
    required this.address,
    super.auditDetails,
  }):  super();

  
}
