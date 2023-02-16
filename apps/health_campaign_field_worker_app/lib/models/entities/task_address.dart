// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskAddressSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  TaskAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TaskAddressModel extends EntityModel {
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  final TaskModel? task;
  final AddressModel? address;
  

  TaskAddressModel({
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.task,
    this.address,
    super.auditDetails,
  }):  super();

  TaskAddressCompanion get companion {
    return TaskAddressCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      task: Value(task?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
