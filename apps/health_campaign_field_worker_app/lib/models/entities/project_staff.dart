// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectStaffSearchModel extends EntitySearchModel {
  final String? id;
  final String? userId;
  final String? projectId;
  final String? clientReferenceId;
  final String? tenantId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectStaffSearchModel({
    this.id,
    this.userId,
    this.projectId,
    this.clientReferenceId,
    this.tenantId,
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

@MappableClass(ignoreNull: true)
class ProjectStaffModel extends EntityModel implements ProjectStaffSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? userId;
  
  @override
  final String? projectId;
  final String? channel;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  
  @override
  final DateTime? startDateTime;
  
  @override
  final DateTime? endDateTime;
  

  ProjectStaffModel({
    this.id,
    this.userId,
    this.projectId,
    this.channel,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
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
      userId: Value(userId),
      projectId: Value(projectId),
      channel: Value(channel),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
