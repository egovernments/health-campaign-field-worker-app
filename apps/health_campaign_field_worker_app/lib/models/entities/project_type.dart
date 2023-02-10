// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectTypeSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  final String? tenantId;
  
  ProjectTypeSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectTypeModel extends EntityModel implements ProjectTypeSearchModel {
  final String? id;
  final String? name;
  final String? code;
  final String? group;
  final String? beneficiaryType;
  final List<String>? eligibilityCriteria;
  final List<String>? taskProcedure;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  final List<ProjectProductVariantModel>? resources;
  

  ProjectTypeModel({
    this.id,
    this.name,
    this.code,
    this.group,
    this.beneficiaryType,
    this.eligibilityCriteria,
    this.taskProcedure,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.resources,
    super.auditDetails,
  }):  super();

  ProjectTypeCompanion get companion {
    return ProjectTypeCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      group: Value(group),
      beneficiaryType: Value(beneficiaryType),
      eligibilityCriteria: Value(eligibilityCriteria?.toString()),
      taskProcedure: Value(taskProcedure?.toString()),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
