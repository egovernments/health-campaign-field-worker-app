// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import 'household_member_relationship.dart';

part 'household_member.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberSearchModel extends EntitySearchModel
    with HouseholdMemberSearchModelMappable {
  final String? id;
  final List<String>? individualClientReferenceIds;
  final List<String>? householdClientReferenceIds;
  final List<String>? householdId;
  final List<String>? householdClientReferenceId;
  final List<String>? individualId;
  final List<String>? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final List<String>? clientReferenceId;
  final String? tenantId;
  int? offset;
  int? limit;

  HouseholdMemberSearchModel({
    this.id,
    this.individualClientReferenceIds,
    this.householdClientReferenceIds,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.clientReferenceId,
    this.tenantId,
    this.limit,
    this.offset,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HouseholdMemberSearchModel.ignoreDeleted({
    this.id,
    this.individualClientReferenceIds,
    this.householdClientReferenceIds,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberModel extends EntityModel
    with HouseholdMemberModelMappable {
  static const schemaName = 'HouseholdMember';

  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool isHeadOfHousehold;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final List<HouseholdMemberRelationShipModel>? memberRelationships;
  final HouseholdMemberAdditionalFields? additionalFields;

  HouseholdMemberModel({
    this.additionalFields,
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.memberRelationships,
    required this.isHeadOfHousehold,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  HouseholdMemberCompanion get companion {
    return HouseholdMemberCompanion(
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
      householdId: Value(householdId),
      householdClientReferenceId: Value(householdClientReferenceId),
      individualId: Value(individualId),
      individualClientReferenceId: Value(individualClientReferenceId),
      isHeadOfHousehold: Value(isHeadOfHousehold),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HouseholdMemberAdditionalFields extends AdditionalFields
    with HouseholdMemberAdditionalFieldsMappable {
  HouseholdMemberAdditionalFields({
    super.schema = 'HouseholdMember',
    required super.version,
    super.fields,
  });
}
