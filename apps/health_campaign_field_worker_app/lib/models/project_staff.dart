// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectStaffRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? userId;
  final String? projectId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectStaffRequestModel({
    this.id,
    this.tenantId,
    this.userId,
    this.projectId,
    int? startDate,
    int? endDate,
    super.boundaryCode,
  }): startDateTime = startDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(startDate),
  endDateTime = endDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(endDate),
   super();

  int? get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
  
}

@MappableClass()
class ProjectStaffModel extends DataModel implements ProjectStaffRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String userId;
  
  @override
  final String projectId;
  final String channel;
  final int rowVersion;
  final String clientReferenceId;
  
  @override
  final DateTime startDateTime;
  
  @override
  final DateTime endDateTime;
  

  ProjectStaffModel({
    this.id,
    required this.tenantId,
    required this.userId,
    required this.projectId,
    required this.channel,
    required this.rowVersion,
    required this.clientReferenceId,
    required int startDate,
    required int endDate,
    super.auditDetails,
  }): startDateTime = DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = DateTime.fromMillisecondsSinceEpoch(endDate),
       super();

  @override
  int  get startDate => startDateTime .millisecondsSinceEpoch;
  

  @override
  int  get endDate => endDateTime .millisecondsSinceEpoch;
  
}
