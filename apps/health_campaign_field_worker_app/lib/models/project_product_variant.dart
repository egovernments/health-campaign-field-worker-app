// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectProductVariantSearchModel extends EntitySearchModel {
  
  ProjectProductVariantSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectProductVariantModel extends EntityModel implements ProjectProductVariantSearchModel {
  final String productVariantId;
  final String type;
  final bool isBaseUnitVariant;
  final String clientReferenceId;
  

  ProjectProductVariantModel({
    required this.productVariantId,
    required this.type,
    required this.isBaseUnitVariant,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
