// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TaskResourceSearchModel extends DataModel {
  
  TaskResourceSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class TaskResourceModel extends DataModel implements TaskResourceSearchModel {
  final String? id;
  final String tenantId;
  final String productVariantId;
  final String quantity;
  final bool isDelivered;
  final String? deliveryComment;
  final String clientReferenceId;
  

  TaskResourceModel({
    this.id,
    required this.tenantId,
    required this.productVariantId,
    required this.quantity,
    required this.isDelivered,
    this.deliveryComment,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
