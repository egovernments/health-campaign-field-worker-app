import 'package:dart_mappable/dart_mappable.dart';

import 'address.dart';
import 'target.dart';
import 'document.dart';
import 'data_model.dart';

@MappableClass()
class ProjectRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectTypeId;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? description;
  final String? referenceId;
  final String? projectHierarchy;
  final int? rowVersion;
  final String? clientReferenceId;
  final AddressRequestModel? address;
  final List<TargetRequestModel>? targets;
  final List<DocumentRequestModel>? documents;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectRequestModel({
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
    this.clientReferenceId,
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

  int? get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
  
}

@MappableClass()
class ProjectModel extends DataModel implements ProjectRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String projectTypeId;
  
  @override
  final String subProjectTypeId;
  
  @override
  final bool isTaskEnabled;
  
  @override
  final String? parent;
  
  @override
  final String department;
  
  @override
  final String description;
  
  @override
  final String referenceId;
  
  @override
  final String projectHierarchy;
  
  @override
  final int rowVersion;
  
  @override
  final String clientReferenceId;
  
  @override
  final AddressRequestModel address;
  
  @override
  final List<TargetRequestModel> targets;
  
  @override
  final List<DocumentRequestModel> documents;
  
  @override
  final DateTime startDateTime;
  
  @override
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
