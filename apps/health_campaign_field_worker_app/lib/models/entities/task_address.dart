// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskAddressSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  TaskAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TaskAddressModel extends EntityModel {
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final TaskModel? task;
  final AddressModel? address;
  

  TaskAddressModel({
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.task,
    this.address,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  TaskAddressCompanion get companion {
    return TaskAddressCompanion(
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      task: Value(task?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
