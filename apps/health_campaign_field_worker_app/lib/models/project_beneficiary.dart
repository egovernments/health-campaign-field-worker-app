// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectBeneficiaryRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final String? beneficiaryId;
  final int? rowVersion;
  final String? clientReferenceId;
  final DateTime? dateOfRegistrationTime;
  
  ProjectBeneficiaryRequestModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.beneficiaryId,
    this.rowVersion,
    this.clientReferenceId,
    int? dateOfRegistration,
    super.auditDetails,
  }): dateOfRegistrationTime = dateOfRegistration == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
   super();

  int? get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  
}

@MappableClass()
class ProjectBeneficiaryModel extends DataModel implements ProjectBeneficiaryRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String projectId;
  
  @override
  final String beneficiaryId;
  
  @override
  final int rowVersion;
  
  @override
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
