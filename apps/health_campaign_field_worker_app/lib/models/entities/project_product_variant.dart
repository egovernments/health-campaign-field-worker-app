// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectProductVariantSearchModel extends EntitySearchModel {
  final String? productVariantId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectProductVariantSearchModel({
    this.productVariantId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectProductVariantModel extends EntityModel {

  static const schemaName = 'ProjectProductVariant';

  final String productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  ProjectProductVariantModel({
    required this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    ProjectProductVariantAdditionalFields? additionalFields,
  }): super(additionalFields: additionalFields == null
          ? null
          : Mapper.fromMap<AdditionalFields>(
            additionalFields.toMap(),
          ));

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
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
