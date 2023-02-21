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
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final DateTime? dateOfRegistrationTime;
  
  ProjectBeneficiarySearchModel({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.beneficiaryClientReferenceId,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    int? dateOfRegistration,
    super.boundaryCode,
  }): dateOfRegistrationTime = dateOfRegistration == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
   super();

  int? get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true)
class ProjectBeneficiaryModel extends EntityModel {
  final String? id;
  final String? projectId;
  final String? beneficiaryId;
  final String? beneficiaryClientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime? dateOfRegistrationTime;
  

  ProjectBeneficiaryModel({
    this.id,
    this.projectId,
    this.beneficiaryId,
    this.beneficiaryClientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    int? dateOfRegistration,
    super.auditDetails,
    super.clientReferenceId,
  }): dateOfRegistrationTime = dateOfRegistration == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(dateOfRegistration),
       super();

  int?  get dateOfRegistration => dateOfRegistrationTime?.millisecondsSinceEpoch;
  

  ProjectBeneficiaryCompanion get companion {
    return ProjectBeneficiaryCompanion(
      id: Value(id),
      projectId: Value(projectId),
      beneficiaryId: Value(beneficiaryId),
      beneficiaryClientReferenceId: Value(beneficiaryClientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      dateOfRegistration: Value(dateOfRegistration),
      );
  }
}
