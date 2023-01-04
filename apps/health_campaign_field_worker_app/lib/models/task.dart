// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TaskRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final String? projectBeneficiaryId;
  final String? createdBy;
  final String? status;
  final DateTime? plannedStartDateTime;
  final DateTime? plannedEndDateTime;
  final DateTime? actualStartDateTime;
  final DateTime? actualEndDateTime;
  
  TaskRequestModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.projectBeneficiaryId,
    this.createdBy,
    this.status,
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

@MappableClass()
class TaskModel extends DataModel implements TaskRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String projectId;
  
  @override
  final String projectBeneficiaryId;
  
  @override
  final String createdBy;
  final int rowVersion;
  
  @override
  final String status;
  final String clientReferenceId;
  final List<TaskResourceRequestModel> resources;
  final AddressRequestModel address;
  
  @override
  final DateTime plannedStartDateTime;
  
  @override
  final DateTime plannedEndDateTime;
  
  @override
  final DateTime actualStartDateTime;
  
  @override
  final DateTime actualEndDateTime;
  final DateTime createdDateTime;
  

  TaskModel({
    this.id,
    required this.tenantId,
    required this.projectId,
    required this.projectBeneficiaryId,
    required this.createdBy,
    required this.rowVersion,
    required this.status,
    required this.clientReferenceId,
    required this.resources,
    required this.address,
    required int plannedStartDate,
    required int plannedEndDate,
    required int actualStartDate,
    required int actualEndDate,
    required int createdDate,
    super.auditDetails,
  }): plannedStartDateTime = DateTime.fromMillisecondsSinceEpoch(plannedStartDate),
      plannedEndDateTime = DateTime.fromMillisecondsSinceEpoch(plannedEndDate),
      actualStartDateTime = DateTime.fromMillisecondsSinceEpoch(actualStartDate),
      actualEndDateTime = DateTime.fromMillisecondsSinceEpoch(actualEndDate),
      createdDateTime = DateTime.fromMillisecondsSinceEpoch(createdDate),
       super();

  @override
  int  get plannedStartDate => plannedStartDateTime .millisecondsSinceEpoch;
  

  @override
  int  get plannedEndDate => plannedEndDateTime .millisecondsSinceEpoch;
  

  @override
  int  get actualStartDate => actualStartDateTime .millisecondsSinceEpoch;
  

  @override
  int  get actualEndDate => actualEndDateTime .millisecondsSinceEpoch;
  

  @override
  int  get createdDate => createdDateTime .millisecondsSinceEpoch;
  
}
