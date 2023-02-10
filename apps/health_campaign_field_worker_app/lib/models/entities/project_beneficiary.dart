// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectBeneficiarySearchModel extends EntitySearchModel {
  final String? id;
  final String? projectId;
  final String? beneficiaryId;
  final String? beneficiaryClientReferenceId;
  final String? clientReferenceId;
  final String? tenantId;
  final DateTime? dateOfRegistrationTime;
  
  ProjectBeneficiarySearchModel({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.beneficiaryClientReferenceId,
    this.clientReferenceId,
    this.tenantId,
    int? dateOfRegistration,
    super.boundaryCode,
  }): dateOfRegistrationTime = dateOfRegistration == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
   super();

  int? get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true)
class ProjectBeneficiaryModel extends EntityModel implements ProjectBeneficiarySearchModel {
  
  @override
  final String? id;
  
  @override
  final String? projectId;
  
  @override
  final String? beneficiaryId;
  
  @override
  final String? beneficiaryClientReferenceId;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  
  @override
  final DateTime? dateOfRegistrationTime;
  

  ProjectBeneficiaryModel({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.beneficiaryClientReferenceId,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    int? dateOfRegistration,
    super.auditDetails,
  }): dateOfRegistrationTime = dateOfRegistration == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
       super();

  @override
  int?  get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  

  ProjectBeneficiaryCompanion get companion {
    return ProjectBeneficiaryCompanion(
      id: Value(id),
      projectId: Value(projectId),
      beneficiaryId: Value(beneficiaryId),
      beneficiaryClientReferenceId: Value(beneficiaryClientReferenceId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      dateOfRegistration: Value(dateOfRegistration),
      );
  }
}
