// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectProductVariantRequestModel extends DataModel {
  
  ProjectProductVariantRequestModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectProductVariantModel extends DataModel implements ProjectProductVariantRequestModel {
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
