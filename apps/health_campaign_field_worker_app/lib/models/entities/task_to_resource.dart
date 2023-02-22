// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskToResourceSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  TaskToResourceSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TaskToResourceModel extends EntityModel {
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final TaskModel? task;
  final TaskResourceModel? taskResource;
  

  TaskToResourceModel({
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.task,
    this.taskResource,
    super.auditDetails,
  }):  super();

  TaskToResourceCompanion get companion {
    return TaskToResourceCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      task: Value(task?.clientReferenceId),
    taskResource: Value(taskResource?.clientReferenceId),
    );
  }
}
