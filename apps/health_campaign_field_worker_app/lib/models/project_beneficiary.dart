// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectBeneficiarySearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final String? beneficiaryId;
  final DateTime? dateOfRegistrationTime;
  
  ProjectBeneficiarySearchModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.beneficiaryId,
    int? dateOfRegistration,
    super.boundaryCode,
  }): dateOfRegistrationTime = dateOfRegistration == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
   super();

  int? get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  
}

@MappableClass()
class ProjectBeneficiaryModel extends EntityModel implements ProjectBeneficiarySearchModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String projectId;
  
  @override
  final String beneficiaryId;
  final int rowVersion;
  final String clientReferenceId;
  
  @override
  final DateTime dateOfRegistrationTime;
  

  ProjectBeneficiaryModel({
    this.id,
    required this.tenantId,
    required this.projectId,
    required this.beneficiaryId,
    required this.rowVersion,
    required this.clientReferenceId,
    required int dateOfRegistration,
    super.auditDetails,
  }): dateOfRegistrationTime = DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
       super();

  @override
  int  get dateOfRegistration => dateOfRegistrationTime .millisecondsSinceEpoch;
  
}
