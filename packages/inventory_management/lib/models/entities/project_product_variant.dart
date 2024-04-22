// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'project_product_variant.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantSearchModel
    with ProjectProductVariantSearchModelMappable {
  final String? productVariantId;
  final String? tenantId;

  ProjectProductVariantSearchModel({
    this.productVariantId,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  ProjectProductVariantSearchModel.ignoreDeleted({
    this.productVariantId,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantModel with ProjectProductVariantModelMappable {
  static const schemaName = 'ProjectProductVariant';

  final String productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProjectProductVariantAdditionalFields? additionalFields;

  ProjectProductVariantModel({
    this.additionalFields,
    required this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantAdditionalFields
    with ProjectProductVariantAdditionalFieldsMappable {
  ProjectProductVariantAdditionalFields();
}
