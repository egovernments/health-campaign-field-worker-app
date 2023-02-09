// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class ProductVariantSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? productId;
  final String? sku;
  final String? variation;
  
  ProductVariantSearchModel({
    this.id,
    this.tenantId,
    this.productId,
    this.sku,
    this.variation,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProductVariantModel extends EntityModel implements ProductVariantSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? productId;
  
  @override
  final String? sku;
  
  @override
  final String? variation;
  final int? rowVersion;
  final String clientReferenceId;
  

  ProductVariantModel({
    this.id,
    this.tenantId,
    this.productId,
    this.sku,
    this.variation,
    this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  ProductVariantCompanion get companion {
    return ProductVariantCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      productId: Value(productId),
      sku: Value(sku),
      variation: Value(variation),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
