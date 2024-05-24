import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'dart:convert';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'pgr_address.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class PgrAddressModel extends EntityModel with PgrAddressModelMappable {
  final String? tenantId;
  final String? relatedClientReferenceId;
  final String? doorNo;
  final String? plotNo;
  final String? id;
  final String? landmark;
  final String? city;
  final String? district;
  final String? region;
  final String? state;
  final String? country;
  final String? pincode;
  final String? buildingName;
  final String? street;
  final LocalityModel? locality;
  final GeoLocation? geoLocation;
  final Map<String, dynamic>? additionDetails;
  @override
  final bool? isDeleted;
  final int? rowVersion;

  PgrAddressModel({
    this.tenantId,
    this.relatedClientReferenceId,
    this.doorNo,
    this.plotNo,
    this.id,
    this.landmark,
    this.city,
    this.district,
    this.region,
    this.state,
    this.country,
    this.pincode,
    this.buildingName,
    this.street,
    this.locality,
    this.geoLocation,
    this.additionDetails,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    
  }) : super(isDeleted: false);


  AddressCompanion get companion {
    return AddressCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(json.encode(additionDetails)),
      id: Value(id),
      relatedClientReferenceId: Value(relatedClientReferenceId),
      doorNo: Value(doorNo),
      latitude: Value(geoLocation?.latitude),
      longitude: Value(geoLocation?.longitude),
      addressLine1: Value(buildingName),
      addressLine2: Value(street),
      landmark: Value(landmark),
      city: Value(city),
      pincode: Value(pincode),
      buildingName: Value(buildingName),
      street: Value(street),
      boundary: Value(locality?.name),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      localityBoundaryCode: Value(locality?.code),
      localityBoundaryName: Value(locality?.name),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class GeoLocation with GeoLocationMappable {
  double? latitude;
  double? longitude;
  Map<String, dynamic>? additionalDetails;

  GeoLocation({
    this.latitude,
    this.longitude,
    this.additionalDetails,
  });
}
