// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'product_variant.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductVariantSearchModel with ProductVariantSearchModelMappable {
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
  }) : super();

  @MappableConstructor()
  ProductVariantSearchModel.ignoreDeleted({
    this.id,
    this.productId,
    this.sku,
    this.variation,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProductVariantModel with ProductVariantModelMappable {
  static const schemaName = 'ProductVariant';

  final String id;
  final String? productId;
  final String? sku;
  final String? variation;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  ProductVariantModel({
    required this.id,
    this.productId,
    this.sku,
    this.variation,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
