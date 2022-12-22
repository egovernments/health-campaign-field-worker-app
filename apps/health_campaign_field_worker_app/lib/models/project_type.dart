import 'package:dart_mappable/dart_mappable.dart';

import 'project_product_variant.dart';
import 'data_model.dart';

@MappableClass()
class ProjectTypeRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? name;
  final String? code;
  final String? group;
  final String? beneficiaryType;
  final List<String>? eligibilityCriteria;
  final List<String>? taskProcedure;
  final String? clientReferenceId;
  final List<ProjectProductVariantRequestModel>? resources;
  
  ProjectTypeRequestModel({
    this.id,
    this.tenantId,
    this.name,
    this.code,
    this.group,
    this.beneficiaryType,
    this.eligibilityCriteria,
    this.taskProcedure,
    this.clientReferenceId,
    this.resources,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectTypeModel extends DataModel implements ProjectTypeRequestModel {
  
  @override
  final String id;
  
  @override
  final String tenantId;
  
  @override
  final String name;
  
  @override
  final String code;
  
  @override
  final String group;
  
  @override
  final String beneficiaryType;
  
  @override
  final List<String> eligibilityCriteria;
  
  @override
  final List<String> taskProcedure;
  
  @override
  final String clientReferenceId;
  
  @override
  final List<ProjectProductVariantRequestModel> resources;
  

  ProjectTypeModel({
    required this.id,
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
