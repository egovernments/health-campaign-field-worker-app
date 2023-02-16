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
  
  HouseholdMemberSearchModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdMemberModel extends EntityModel {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  

  HouseholdMemberModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  HouseholdMemberCompanion get companion {
    return HouseholdMemberCompanion(
      id: Value(id),
      householdId: Value(householdId),
      householdClientReferenceId: Value(householdClientReferenceId),
      individualId: Value(individualId),
      individualClientReferenceId: Value(individualClientReferenceId),
      isHeadOfHousehold: Value(isHeadOfHousehold),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
