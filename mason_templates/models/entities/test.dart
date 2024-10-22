// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import 'package:digit_data_model/data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'test.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TestSearchModel extends EntitySearchModel with TestSearchModelMappable {
  final String? id;
  final double? latitude;
  final double? longitude;
  final String? tenantId;
  final List<String>? clientReferenceId;
  
  TestSearchModel({
    this.id,
    this.latitude,
    this.longitude,
    this.tenantId,
    this.clientReferenceId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  TestSearchModel.ignoreDeleted({
    this.id,
    this.latitude,
    this.longitude,
    this.tenantId,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TestModel extends EntityModel with TestModelMappable {

  static const schemaName = 'Test';

  final String? id;
  final String? relatedClientReferenceId;
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
  final String? boundaryType;
  final String? boundary;
  final bool nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final LocalityModel? locality;
  final TestType? type;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final TestType? type;
  final LocalityModel? locality;
  final TestAdditionalFields? additionalFields;

  TestModel({
    this.additionalFields,
    this.id,
    this.relatedClientReferenceId,
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
    this.boundaryType,
    this.boundary,
    required this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.locality,
    this.type,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.type,
    this.locality,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  TestCompanion get companion {
    return TestCompanion(
      localityBoundaryCode: Value(locality?.code),
      localityBoundaryName: Value(locality?.name),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      relatedClientReferenceId: Value(relatedClientReferenceId),
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
      boundaryType: Value(boundaryType),
      boundary: Value(boundary),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      type: Value(type),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      type: Value(type),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TestAdditionalFields extends AdditionalFields with TestAdditionalFieldsMappable {
  TestAdditionalFields({
    super.schema = 'Test',
    required super.version,
    super.fields,
  });
}

