// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectProductVariantSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  final String? tenantId;
  
  ProjectProductVariantSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectProductVariantModel extends EntityModel implements ProjectProductVariantSearchModel {
  final String? productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  

  ProjectProductVariantModel({
    this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
