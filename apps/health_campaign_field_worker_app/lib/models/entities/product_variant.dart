// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'product_variant.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductVariantSearchModel extends EntitySearchModel with ProductVariantSearchModelMappable {
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

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductVariantModel extends EntityModel with ProductVariantModelMappable {

  static const schemaName = 'ProductVariant';

  final String id;
  final String? productId;
  final String? sku;
  final String? variation;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProductVariantAdditionalFields? additionalFields;

  ProductVariantModel({
    this.additionalFields,
    required this.id,
    this.productId,
    this.sku,
    this.variation,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ProductVariantCompanion get companion {
    return ProductVariantCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      productId: Value(productId),
      sku: Value(sku),
      variation: Value(variation),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductVariantAdditionalFields extends AdditionalFields with ProductVariantAdditionalFieldsMappable {
  ProductVariantAdditionalFields({
    super.schema = 'ProductVariant',
    required super.version,
    super.fields,
  });
}

