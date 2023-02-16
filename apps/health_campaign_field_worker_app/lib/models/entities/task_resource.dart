// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TaskResourceSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  TaskResourceSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TaskResourceModel extends EntityModel {
  final String? id;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  

  TaskResourceModel({
    this.id,
    this.productVariantId,
    this.quantity,
    this.isDelivered,
    this.deliveryComment,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  TaskResourceCompanion get companion {
    return TaskResourceCompanion(
      id: Value(id),
      productVariantId: Value(productVariantId),
      quantity: Value(quantity),
      isDelivered: Value(isDelivered),
      deliveryComment: Value(deliveryComment),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
