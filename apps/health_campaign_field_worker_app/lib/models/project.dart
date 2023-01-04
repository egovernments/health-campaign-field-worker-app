// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectRequestModel extends DataModel {
  
  ProjectRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectModel extends DataModel implements ProjectRequestModel {
  final String? id;
  final String tenantId;
  final String projectTypeId;
  final String subProjectTypeId;
  final bool isTaskEnabled;
  final String? parent;
  final String department;
  final String description;
  final String referenceId;
  final String projectHierarchy;
  final int rowVersion;
  final String clientReferenceId;
  final AddressRequestModel address;
  final List<TargetRequestModel> targets;
  final List<DocumentRequestModel> documents;
  final DateTime startDateTime;
  final DateTime endDateTime;
  

  ProjectModel({
    this.id,
    required this.tenantId,
    required this.projectTypeId,
    required this.subProjectTypeId,
    required this.isTaskEnabled,
    this.parent,
    required this.department,
    required this.description,
    required this.referenceId,
    required this.projectHierarchy,
    required this.rowVersion,
    required this.clientReferenceId,
    required this.address,
    required this.targets,
    required this.documents,
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
