// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskSearchModel extends EntitySearchModel {
  final String? id;
  final String? projectId;
  final String? projectBeneficiaryId;
  final String? projectBeneficiaryClientReferenceId;
  final String? createdBy;
  final String? status;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final DateTime? plannedStartDateTime;
  final DateTime? plannedEndDateTime;
  final DateTime? actualStartDateTime;
  final DateTime? actualEndDateTime;
  
  TaskSearchModel({
    this.id,
    this.projectId,
    this.projectBeneficiaryId,
    this.projectBeneficiaryClientReferenceId,
    this.createdBy,
    this.status,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    int? plannedStartDate,
    int? plannedEndDate,
    int? actualStartDate,
    int? actualEndDate,
    super.boundaryCode,
  }): plannedStartDateTime = plannedStartDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(plannedStartDate),
  plannedEndDateTime = plannedEndDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(plannedEndDate),
  actualStartDateTime = actualStartDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(actualStartDate),
  actualEndDateTime = actualEndDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(actualEndDate),
   super();

  int? get plannedStartDate => plannedStartDateTime?.millisecondsSinceEpoch;
  

  int? get plannedEndDate => plannedEndDateTime?.millisecondsSinceEpoch;
  

  int? get actualStartDate => actualStartDateTime?.millisecondsSinceEpoch;
  

  int? get actualEndDate => actualEndDateTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true)
class TaskModel extends EntityModel {
  final String? id;
  final String? projectId;
  final String? projectBeneficiaryId;
  final String? projectBeneficiaryClientReferenceId;
  final String? createdBy;
  final String? status;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final List<TaskResourceModel>? taskResource;
  final AddressModel? address;
  final DateTime? plannedStartDateTime;
  final DateTime? plannedEndDateTime;
  final DateTime? actualStartDateTime;
  final DateTime? actualEndDateTime;
  final DateTime? createdDateTime;
  

  TaskModel({
    this.id,
    this.projectId,
    this.projectBeneficiaryId,
    this.projectBeneficiaryClientReferenceId,
    this.createdBy,
    this.status,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.taskResource,
    this.address,
    int? plannedStartDate,
    int? plannedEndDate,
    int? actualStartDate,
    int? actualEndDate,
    int? createdDate,
    super.auditDetails,
  }): plannedStartDateTime = plannedStartDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(plannedStartDate),
      plannedEndDateTime = plannedEndDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(plannedEndDate),
      actualStartDateTime = actualStartDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(actualStartDate),
      actualEndDateTime = actualEndDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(actualEndDate),
      createdDateTime = createdDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(createdDate),
       super();

  int?  get plannedStartDate => plannedStartDateTime?.millisecondsSinceEpoch;
  

  int?  get plannedEndDate => plannedEndDateTime?.millisecondsSinceEpoch;
  

  int?  get actualStartDate => actualStartDateTime?.millisecondsSinceEpoch;
  

  int?  get actualEndDate => actualEndDateTime?.millisecondsSinceEpoch;
  

  int?  get createdDate => createdDateTime?.millisecondsSinceEpoch;
  

  TaskCompanion get companion {
    return TaskCompanion(
      id: Value(id),
      projectId: Value(projectId),
      projectBeneficiaryId: Value(projectBeneficiaryId),
      projectBeneficiaryClientReferenceId: Value(projectBeneficiaryClientReferenceId),
      createdBy: Value(createdBy),
      status: Value(status),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      plannedStartDate: Value(plannedStartDate),
      plannedEndDate: Value(plannedEndDate),
      actualStartDate: Value(actualStartDate),
      actualEndDate: Value(actualEndDate),
      createdDate: Value(createdDate),
      );
  }
}
