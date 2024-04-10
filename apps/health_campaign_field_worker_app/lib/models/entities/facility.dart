// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilitySearchModel extends EntitySearchModel with FacilitySearchModelMappable {
  final List<String>? id;
  final String? name;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  
  FacilitySearchModel({
    this.id,
    this.name,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  FacilitySearchModel.ignoreDeleted({
    this.id,
    this.name,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityModel extends EntityModel with FacilityModelMappable {

  static const schemaName = 'Facility';

  final String id;
  final String? name;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final FacilityAdditionalFields? additionalFields;

  FacilityModel({
    this.additionalFields,
    required this.id,
    this.name,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.address,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  FacilityCompanion get companion {
    return FacilityCompanion(
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
      name: Value(name),
      isPermanent: Value(isPermanent),
      usage: Value(usage),
      storageCapacity: Value(storageCapacity),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityAdditionalFields extends AdditionalFields with FacilityAdditionalFieldsMappable {
  FacilityAdditionalFields({
    super.schema = 'Facility',
    required super.version,
    super.fields,
  });
}

