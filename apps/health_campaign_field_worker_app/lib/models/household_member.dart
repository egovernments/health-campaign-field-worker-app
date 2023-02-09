// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class HouseholdMemberSearchModel extends EntitySearchModel {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final String? tenantId;
  final String? clientReferenceId;
  
  HouseholdMemberSearchModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.tenantId,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdMemberModel extends EntityModel implements HouseholdMemberSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? householdId;
  
  @override
  final String? householdClientReferenceId;
  
  @override
  final String? individualId;
  
  @override
  final String? individualClientReferenceId;
  
  @override
  final bool? isHeadOfHousehold;
  
  @override
  final String? tenantId;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  

  HouseholdMemberModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.tenantId,
    this.rowVersion,
    required this.clientReferenceId,
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
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
