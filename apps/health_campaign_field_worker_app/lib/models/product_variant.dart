// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProductVariantRequestModel extends DataModel {
  
  ProductVariantRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProductVariantModel extends DataModel implements ProductVariantRequestModel {
  final String? id;
  final String tenantId;
  final String productId;
  final String sku;
  final String variation;
  final int rowVersion;
  final String clientReferenceId;
  

  ProductVariantModel({
    this.id,
    required this.tenantId,
    required this.productId,
    required this.sku,
    required this.variation,
    required this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
