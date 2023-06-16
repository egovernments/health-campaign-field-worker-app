// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectProductVariantSearchModel extends EntitySearchModel {
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

@MappableClass(ignoreNull: true)
class ProjectProductVariantModel extends EntityModel {

  static const schemaName = 'ProjectProductVariant';

  final String productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String? tenantId;
  final int? rowVersion;
  final ProjectProductVariantAdditionalFields? additionalFields;

  ProjectProductVariantModel({
    this.additionalFields,
    required this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class ProjectProductVariantAdditionalFields extends AdditionalFields {
  ProjectProductVariantAdditionalFields({
    super.schema = 'ProjectProductVariant',
    required super.version,
    super.fields,
  });
}
