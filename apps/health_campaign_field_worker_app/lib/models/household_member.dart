// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdMemberRequestModel extends DataModel {
  
  HouseholdMemberRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class HouseholdMemberModel extends DataModel implements HouseholdMemberRequestModel {
  final String? id;
  final String householdId;
  final String householdClientReferenceId;
  final String individualId;
  final String individualClientReferenceId;
  final bool isHeadOfHousehold;
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
