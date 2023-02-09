// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class AddressSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  AddressSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class AddressModel extends EntityModel implements AddressSearchModel {
  final String? id;
  final String? tenantId;
  final String? doorNo;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final String? addressLine1;
  final String? addressLine2;
  final String? landmark;
  final String? city;
  final String? pincode;
  final String? buildingName;
  final String? street;
  
  @override
  final String clientReferenceId;
  final BoundaryModel? locality;
  final AddressType? type;
  

  AddressModel({
    this.id,
    this.tenantId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.buildingName,
    this.street,
    required this.clientReferenceId,
    this.locality,
    this.type,
    super.auditDetails,
  }):  super();

  AddressCompanion get companion {
    return AddressCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      doorNo: Value(doorNo),
      latitude: Value(latitude),
      longitude: Value(longitude),
      locationAccuracy: Value(locationAccuracy),
      addressLine1: Value(addressLine1),
      addressLine2: Value(addressLine2),
      landmark: Value(landmark),
      city: Value(city),
      pincode: Value(pincode),
      buildingName: Value(buildingName),
      street: Value(street),
      clientReferenceId: Value(clientReferenceId),
      type: Value(type),
      locality: Value(locality?.clientReferenceId),
    );
  }
}
