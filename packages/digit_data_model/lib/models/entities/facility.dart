// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:digit_data_model/data_model.dart';

part 'facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilitySearchModel extends EntitySearchModel
    with FacilitySearchModelMappable {
  final List<String>? id;
  final List<String>? clientReferenceId;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  final String? name;
  FacilitySearchModel({
    this.name,
    this.id,
    this.clientReferenceId,
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
    this.clientReferenceId,
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

  /// App-generated id of a site created on the phone. Until the server
  /// assigns an [id], the app stores the same value in both fields; the
  /// oplog manager treats `id == clientReferenceId` as "not yet synced".
  final String? clientReferenceId;
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
    this.clientReferenceId,
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
        clientReferenceId: Value(clientReferenceId),
        latitude: Value(address?.latitude),
        longitude: Value(address?.longitude),
        locationAccuracy: Value(address?.locationAccuracy),
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
    // Sites added by the planner come down with schema/version null in
    // additionalFields, so the version defaults instead of failing decode.
    super.version = 1,
    super.fields,
  });
}
