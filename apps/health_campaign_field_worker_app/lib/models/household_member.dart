// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdMemberSearchModel extends DataModel {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final String? tenantId;
  
  HouseholdMemberSearchModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdMemberModel extends DataModel implements HouseholdMemberSearchModel {
  
  @override
  final String? id;
  
  @override
  final String householdId;
  
  @override
  final String householdClientReferenceId;
  
  @override
  final String individualId;
  
  @override
  final String individualClientReferenceId;
  
  @override
  final bool isHeadOfHousehold;
  
  @override
  final String tenantId;
  final int rowVersion;
  final String clientReferenceId;
  

  HouseholdMemberModel({
    this.id,
    required this.householdId,
    required this.householdClientReferenceId,
    required this.individualId,
    required this.individualClientReferenceId,
    required this.isHeadOfHousehold,
    required this.tenantId,
    required this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
