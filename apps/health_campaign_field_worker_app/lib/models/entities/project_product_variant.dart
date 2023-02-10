// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectProductVariantSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  ProjectProductVariantSearchModel({
    this.clientReferenceId,
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
