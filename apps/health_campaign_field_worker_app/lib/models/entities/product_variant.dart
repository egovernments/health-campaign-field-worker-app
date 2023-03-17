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
  final bool? isDeleted;
  
  ProductVariantSearchModel({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProductVariantModel extends EntityModel {

  static const schemaName = 'ProductVariant';

  final String id;
  final String? productId;
  final String? sku;
  final String? variation;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  ProductVariantModel({
    required this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    ProductVariantAdditionalFields? additionalFields,
  }): super(additionalFields: additionalFields == null
          ? null
          : Mapper.fromMap<AdditionalFields>(
            additionalFields.toMap(),
          ));

  ProductVariantCompanion get companion {
    return ProductVariantCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      productId: Value(productId),
      sku: Value(sku),
      variation: Value(variation),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
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
