// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectTypeSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectTypeSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectTypeModel extends EntityModel {
  final String? id;
  final String? name;
  final String? code;
  final String? group;
  final String? beneficiaryType;
  final List<String>? eligibilityCriteria;
  final List<String>? taskProcedure;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final List<ProjectProductVariantModel>? resources;
  

  ProjectTypeModel({
    this.id,
    this.name,
    this.code,
    this.group,
    this.beneficiaryType,
    this.eligibilityCriteria,
    this.taskProcedure,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.resources,
    super.auditDetails,
    super.clientReferenceId,
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
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
