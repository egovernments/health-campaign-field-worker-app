import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdMemberRequestModel extends DataModel {
  final String? id;
  final String? householdId;
  final String? householdClientReferenceId;
  final String? individualId;
  final String? individualClientReferenceId;
  final bool? isHeadOfHousehold;
  final String? tenantId;
  final int? rowVersion;
  final String? clientReferenceId;
  
  HouseholdMemberRequestModel({
    this.id,
    this.householdId,
    this.householdClientReferenceId,
    this.individualId,
    this.individualClientReferenceId,
    this.isHeadOfHousehold,
    this.tenantId,
    this.rowVersion,
    this.clientReferenceId,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class HouseholdMemberModel extends DataModel implements HouseholdMemberRequestModel {
  
  @override
  final String id;
  
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
  
  @override
  final int rowVersion;
  
  @override
  final String clientReferenceId;
  

  HouseholdMemberModel({
    required this.id,
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
