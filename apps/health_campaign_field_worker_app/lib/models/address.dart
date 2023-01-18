// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class AddressSearchModel extends DataModel {
  
  AddressSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class AddressModel extends DataModel implements AddressSearchModel {
  final String? id;
  final String tenantId;
  final String clientReferenceId;
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
  final BoundaryModel locality;
  final AddressType type;
  

  AddressModel({
    this.id,
    required this.tenantId,
    required this.clientReferenceId,
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
    required this.locality,
    required this.type,
    super.auditDetails,
  }):  super();
}
