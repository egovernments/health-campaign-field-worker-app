// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'household_member_relationship.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberRelationShipSearchModel extends EntitySearchModel
    with HouseholdMemberRelationShipSearchModelMappable {
  final String? id;
  final String? selfId;
  final String? selfIdClientReferenceId;
  final String? relativeId;
  final String? relativeClientReferenceId;
  final String? relationshipType;
  final List<String>? clientReferenceIds;

  HouseholdMemberRelationShipSearchModel({
    this.id,
    this.selfId,
    this.selfIdClientReferenceId,
    this.relativeId,
    this.relativeClientReferenceId,
    this.relationshipType,
    this.clientReferenceIds,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HouseholdMemberRelationShipSearchModel.ignoreDeleted({
    this.id,
    this.selfId,
    this.selfIdClientReferenceId,
    this.relativeId,
    this.relativeClientReferenceId,
    this.relationshipType,
    this.clientReferenceIds,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberRelationShipModel extends EntityModel
    with HouseholdMemberRelationShipModelMappable {
  static const schemaName = 'HouseholdMemberRelationShip';

  final String? id;
  final String? selfId;
  final String? selfClientReferenceId;
  final String? relativeId;
  final String? relativeClientReferenceId;
  final String? relationshipType;
  final int? rowVersion;
  final String clientReferenceId;
  final String? tenantId;
  final HouseholdMemberRelationShipAdditionalFields? additionalFields;

  HouseholdMemberRelationShipModel({
    this.additionalFields,
    this.id,
    this.selfId,
    this.selfClientReferenceId,
    required this.clientReferenceId,
    this.relativeId,
    this.relativeClientReferenceId,
    this.relationshipType,
    this.rowVersion,
    this.tenantId,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  HouseholdMemberRelationShipCompanion get companion {
    return HouseholdMemberRelationShipCompanion(
      isDeleted: Value(isDeleted),
      id: Value(id),
      selfId: Value(selfId),
      clientReferenceId: Value(clientReferenceId),
      selfClientReferenceId: Value(selfClientReferenceId),
      relativeId: Value(relativeId),
      relativeClientReferenceId: Value(relativeClientReferenceId),
      relationshipType: Value(relationshipType),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      additionalFields: Value(additionalFields?.toJson()),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberRelationShipAdditionalFields extends AdditionalFields
    with HouseholdMemberRelationShipAdditionalFieldsMappable {
  HouseholdMemberRelationShipAdditionalFields({
    super.schema = 'HouseholdMemberRelationShip',
    required super.version,
    super.fields,
  });
}
