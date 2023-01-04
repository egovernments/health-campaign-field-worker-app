// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class AddressRequestModel extends DataModel {
  
  AddressRequestModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class AddressModel extends DataModel implements AddressRequestModel {
  final String? id;
  final String tenantId;
  final String doorNo;
  final double latitude;
  final double longitude;
  final double locationAccuracy;
  final String addressLine1;
  final String addressLine2;
  final String? landmark;
  final String city;
  final String pincode;
  final String? buildingName;
  final String? street;
  final String clientReferenceId;
  final BoundaryRequestModel locality;
  final AddressType type;
  

  AddressModel({
    this.id,
    required this.tenantId,
    required this.doorNo,
    required this.latitude,
    required this.longitude,
    required this.locationAccuracy,
    required this.addressLine1,
    required this.addressLine2,
    this.landmark,
    required this.city,
    required this.pincode,
    this.buildingName,
    this.street,
    required this.clientReferenceId,
    required this.locality,
    required this.type,
    super.auditDetails,
  }):  super();
}
