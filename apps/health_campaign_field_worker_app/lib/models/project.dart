// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class ProjectSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? projectTypeId;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? referenceId;
  final String? clientReferenceId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectSearchModel({
    this.id,
    this.tenantId,
    this.projectTypeId,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
    this.clientReferenceId,
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
class ProjectModel extends EntityModel implements ProjectSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? projectTypeId;
  
  @override
  final String? subProjectTypeId;
  
  @override
  final bool? isTaskEnabled;
  
  @override
  final String? parent;
  
  @override
  final String? department;
  final String? description;
  
  @override
  final String? referenceId;
  final String? projectHierarchy;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  final AddressModel? address;
  final List<TargetModel>? targets;
  final List<DocumentModel>? documents;
  
  @override
  final DateTime? startDateTime;
  
  @override
  final DateTime? endDateTime;
  

  ProjectModel({
    this.id,
    this.tenantId,
    this.projectTypeId,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.description,
    this.referenceId,
    this.projectHierarchy,
    this.rowVersion,
    required this.clientReferenceId,
    this.address,
    this.targets,
    this.documents,
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
  

  ProjectCompanion get companion {
    return ProjectCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      projectTypeId: Value(projectTypeId),
      subProjectTypeId: Value(subProjectTypeId),
      isTaskEnabled: Value(isTaskEnabled),
      parent: Value(parent),
      department: Value(department),
      description: Value(description),
      referenceId: Value(referenceId),
      projectHierarchy: Value(projectHierarchy),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
