// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectBeneficiaryRequestModel extends DataModel {
  
  ProjectBeneficiaryRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectBeneficiaryModel extends DataModel implements ProjectBeneficiaryRequestModel {
  final String? id;
  final String tenantId;
  final String projectId;
  final String beneficiaryId;
  final int rowVersion;
  final String clientReferenceId;
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
