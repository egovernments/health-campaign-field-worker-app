// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'project_product_variant.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantSearchModel extends EntitySearchModel with ProjectProductVariantSearchModelMappable {
  final String? productVariantId;
  final String? tenantId;
  
  ProjectProductVariantSearchModel({
    this.productVariantId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ProjectProductVariantSearchModel.ignoreDeleted({
    this.productVariantId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantModel extends EntityModel with ProjectProductVariantModelMappable {

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
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
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
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectProductVariantAdditionalFields extends AdditionalFields with ProjectProductVariantAdditionalFieldsMappable {
  ProjectProductVariantAdditionalFields({
    super.schema = 'ProjectProductVariant',
    required super.version,
    super.fields,
  });
}

