// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectTypeSearchModel extends EntitySearchModel {
  
  ProjectTypeSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectTypeModel extends EntityModel implements ProjectTypeSearchModel {
  final String? id;
  final String tenantId;
  final String name;
  final String code;
  final String group;
  final String beneficiaryType;
  final List<String> eligibilityCriteria;
  final List<String> taskProcedure;
  final String clientReferenceId;
  final List<ProjectProductVariantModel> resources;
  

  ProjectTypeModel({
    this.id,
    required this.tenantId,
    required this.name,
    required this.code,
    required this.group,
    required this.beneficiaryType,
    required this.eligibilityCriteria,
    required this.taskProcedure,
    required this.clientReferenceId,
    required this.resources,
    super.auditDetails,
  }):  super();
}
