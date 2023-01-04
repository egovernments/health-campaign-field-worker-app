// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TaskRequestModel extends DataModel {
  
  TaskRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class TaskModel extends DataModel implements TaskRequestModel {
  final String? id;
  final String tenantId;
  final String projectId;
  final String projectBeneficiaryId;
  final String createdBy;
  final int rowVersion;
  final String status;
  final String clientReferenceId;
  final List<TaskResourceRequestModel> resources;
  final AddressRequestModel address;
  final DateTime plannedStartDateTime;
  final DateTime plannedEndDateTime;
  final DateTime actualStartDateTime;
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
