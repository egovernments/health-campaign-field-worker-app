// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class ProjectProductVariantSearchModel extends EntitySearchModel {
  
  ProjectProductVariantSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectProductVariantModel extends EntityModel implements ProjectProductVariantSearchModel {
  final String? productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String clientReferenceId;
  

  ProjectProductVariantModel({
    this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  ProjectProductVariantCompanion get companion {
    return ProjectProductVariantCompanion(
      productVariantId: Value(productVariantId),
      type: Value(type),
      isBaseUnitVariant: Value(isBaseUnitVariant),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
