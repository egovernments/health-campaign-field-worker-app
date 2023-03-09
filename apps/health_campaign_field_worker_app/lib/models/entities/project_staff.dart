// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectStaffSearchModel extends EntitySearchModel {
  final String? id;
  final String? staffId;
  final String? userId;
  final String? projectId;
  final String? tenantId;
  final bool? isDeleted;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectStaffSearchModel({
    this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.tenantId,
    this.isDeleted,
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
class ProjectStaffModel extends EntityModel {
  final String id;
  final String? staffId;
  final String? userId;
  final String? projectId;
  final String? channel;
  final String? tenantId;
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final DateTime createdAtTime;
  

  ProjectStaffModel({
    required this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.channel,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    int? startDate,
    int? endDate,
    required int createdAt,
    super.auditDetails,
  }): startDateTime = startDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = endDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(endDate),
      createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int?  get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int?  get endDate => endDateTime?.millisecondsSinceEpoch;
  

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  ProjectStaffCompanion get companion {
    return ProjectStaffCompanion(
      id: Value(id),
      staffId: Value(staffId),
      userId: Value(userId),
      projectId: Value(projectId),
      channel: Value(channel),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      startDate: Value(startDate),
      endDate: Value(endDate),
      createdAt: Value(createdAt),
      );
  }
}
