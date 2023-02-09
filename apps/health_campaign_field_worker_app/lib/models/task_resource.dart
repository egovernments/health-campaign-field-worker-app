// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class TaskResourceSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  TaskResourceSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class TaskResourceModel extends EntityModel implements TaskResourceSearchModel {
  final String? id;
  final String? tenantId;
  final String? productVariantId;
  final String? quantity;
  final bool? isDelivered;
  final String? deliveryComment;
  
  @override
  final String clientReferenceId;
  

  TaskResourceModel({
    this.id,
    this.tenantId,
    this.productVariantId,
    this.quantity,
    this.isDelivered,
    this.deliveryComment,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  TaskResourceCompanion get companion {
    return TaskResourceCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      productVariantId: Value(productVariantId),
      quantity: Value(quantity),
      isDelivered: Value(isDelivered),
      deliveryComment: Value(deliveryComment),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
