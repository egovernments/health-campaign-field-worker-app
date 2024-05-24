// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'household.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdSearchModel extends EntitySearchModel with HouseholdSearchModelMappable {
  final String? id;
  final int? memberCount;
  final double? latitude;
  final double? longitude;
  final double? maxRadius;
  final bool? isProximityEnabled;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  HouseholdSearchModel({
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    this.maxRadius,
    this.isProximityEnabled,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  HouseholdSearchModel.ignoreDeleted({
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    this.maxRadius,
    this.isProximityEnabled,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdModel extends EntityModel with HouseholdModelMappable {

  static const schemaName = 'Household';

  final String? id;
  final int? memberCount;
  final double? latitude;
  final double? longitude;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final HouseholdAdditionalFields? additionalFields;

  HouseholdModel({
    this.additionalFields,
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    this.address,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
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
      memberCount: Value(memberCount),
      latitude: Value(latitude),
      longitude: Value(longitude),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdAdditionalFields extends AdditionalFields with HouseholdAdditionalFieldsMappable {
  HouseholdAdditionalFields({
    super.schema = 'Household',
    required super.version,
    super.fields,
  });
}

