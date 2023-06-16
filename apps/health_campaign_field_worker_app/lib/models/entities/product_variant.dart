// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProductVariantSearchModel extends EntitySearchModel {
  final List<String>? id;
  final String? productId;
  final String? sku;
  final String? variation;
  final String? tenantId;
  
  ProductVariantSearchModel({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ProductVariantSearchModel.ignoreDeleted({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class ProductVariantModel extends EntityModel {

  static const schemaName = 'ProductVariant';

  final String id;
  final String? productId;
  final String? sku;
  final String? variation;
  final String? tenantId;
  final int? rowVersion;
  final ProductVariantAdditionalFields? additionalFields;

  ProductVariantModel({
    this.additionalFields,
    required this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  ProductVariantCompanion get companion {
    return ProductVariantCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      productId: Value(productId),
      sku: Value(sku),
      variation: Value(variation),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class ProductVariantAdditionalFields extends AdditionalFields {
  ProductVariantAdditionalFields({
    super.schema = 'ProductVariant',
    required super.version,
    super.fields,
  });
}
