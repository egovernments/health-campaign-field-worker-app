// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:digit_data_model/data_model.dart';

part 'facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilitySearchModel extends EntitySearchModel
    with FacilitySearchModelMappable {
  final List<String>? id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  final String? name;
  FacilitySearchModel({
    this.name,
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  FacilitySearchModel.ignoreDeleted({
    this.name,
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityModel extends EntityModel with FacilityModelMappable {
  static const schemaName = 'Facility';

  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final FacilityAdditionalFields? additionalFields;
  final String? name;

  FacilityModel({
    this.additionalFields,
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.address,
    this.name,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

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
        isPermanent: Value(isPermanent),
        usage: Value(usage),
        storageCapacity: Value(storageCapacity),
        nonRecoverableError: Value(nonRecoverableError),
        tenantId: Value(tenantId),
        rowVersion: Value(rowVersion),
        name: Value(name));
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityAdditionalFields extends AdditionalFields
    with FacilityAdditionalFieldsMappable {
  FacilityAdditionalFields({
    super.schema = 'Facility',
    required super.version,
    super.fields,
  });
}
