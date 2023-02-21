// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectSearchModel extends EntitySearchModel {
  final String? id;
  final String? projectTypeId;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? referenceId;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectSearchModel({
    this.id,
    this.projectTypeId,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    int? startDate,
    int? endDate,
    super.boundaryCode,
  })  : startDateTime = startDate == null
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
class ProjectModel extends EntityModel {
  final String? id;
  final String? projectTypeId;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? description;
  final String? referenceId;
  final String? projectHierarchy;
  final String clientReferenceId;
  final String tenantId;
  final bool? isDeleted;
  final int rowVersion;
  final AddressModel? address;
  final List<TargetModel>? targets;
  final List<DocumentModel>? documents;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectModel({
    this.id,
    this.projectTypeId,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.description,
    this.referenceId,
    this.projectHierarchy,
    required this.clientReferenceId,
    required this.tenantId,
    this.isDeleted,
    required this.rowVersion,
    this.address,
    this.targets,
    this.documents,
    int? startDate,
    int? endDate,
    super.auditDetails,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate),
        super();

  int? get startDate => startDateTime?.millisecondsSinceEpoch;

  int? get endDate => endDateTime?.millisecondsSinceEpoch;

  ProjectCompanion get companion {
    return ProjectCompanion(
      id: Value(id),
      projectTypeId: Value(projectTypeId),
      subProjectTypeId: Value(subProjectTypeId),
      isTaskEnabled: Value(isTaskEnabled),
      parent: Value(parent),
      department: Value(department),
      description: Value(description),
      referenceId: Value(referenceId),
      projectHierarchy: Value(projectHierarchy),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }
}
