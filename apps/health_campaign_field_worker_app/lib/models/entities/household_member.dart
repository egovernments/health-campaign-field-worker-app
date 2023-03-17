// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdMemberSearchModel extends EntitySearchModel {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  HouseholdMemberSearchModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdMemberModel extends EntityModel {

  static const schemaName = 'HouseholdMember';

  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool isHeadOfHousehold;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  HouseholdMemberModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    required this.isHeadOfHousehold,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    HouseholdMemberAdditionalFields? additionalFields,
  }): super(additionalFields: additionalFields == null
          ? null
          : Mapper.fromMap<AdditionalFields>(
            additionalFields.toMap(),
          ));

  HouseholdMemberCompanion get companion {
    return HouseholdMemberCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      householdId: Value(householdId),
      householdClientReferenceId: Value(householdClientReferenceId),
      individualId: Value(individualId),
      individualClientReferenceId: Value(individualClientReferenceId),
      isHeadOfHousehold: Value(isHeadOfHousehold),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class HouseholdMemberAdditionalFields extends AdditionalFields {
  HouseholdMemberAdditionalFields({
    super.schema = 'HouseholdMember',
    required super.version,
    super.fields,
  });
}
