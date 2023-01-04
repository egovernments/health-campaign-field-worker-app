// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectProductVariantRequestModel extends DataModel {
  final String? productVariantId;
  final String? type;
  final bool? isBaseUnitVariant;
  final String? clientReferenceId;
  
  ProjectProductVariantRequestModel({
    this.productVariantId,
    this.type,
    this.isBaseUnitVariant,
    this.clientReferenceId,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectProductVariantModel extends DataModel implements ProjectProductVariantRequestModel {
  
  @override
  final String productVariantId;
  
  @override
  final String type;
  
  @override
  final bool isBaseUnitVariant;
  
  @override
  final String clientReferenceId;
  

  ProjectProductVariantModel({
    required this.productVariantId,
    required this.type,
    required this.isBaseUnitVariant,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
