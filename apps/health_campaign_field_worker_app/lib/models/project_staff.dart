// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class ProjectStaffSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? userId;
  final String? projectId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectStaffSearchModel({
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
class ProjectStaffModel extends EntityModel implements ProjectStaffSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? userId;
  
  @override
  final String? projectId;
  final String? channel;
  final int? rowVersion;
  final String clientReferenceId;
  
  @override
  final DateTime? startDateTime;
  
  @override
  final DateTime? endDateTime;
  

  ProjectStaffModel({
    this.id,
    this.tenantId,
    this.userId,
    this.projectId,
    this.channel,
    this.rowVersion,
    required this.clientReferenceId,
    int? startDate,
    int? endDate,
    super.auditDetails,
  }): startDateTime = startDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = endDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(endDate),
       super();

  @override
  int?  get startDate => startDateTime?.millisecondsSinceEpoch;
  

  @override
  int?  get endDate => endDateTime?.millisecondsSinceEpoch;
  

  ProjectStaffCompanion get companion {
    return ProjectStaffCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      userId: Value(userId),
      projectId: Value(projectId),
      channel: Value(channel),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
