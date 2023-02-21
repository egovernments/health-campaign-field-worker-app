// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectProductVariantSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectProductVariantSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectProductVariantModel extends EntityModel {
  final String? productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  ProjectProductVariantModel({
    this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
