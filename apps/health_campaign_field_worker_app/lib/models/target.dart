// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TargetSearchModel extends EntitySearchModel {
  
  TargetSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class TargetModel extends EntityModel implements TargetSearchModel {
  final String? id;
  final String beneficiaryType;
  final String baseline;
  final String target;
  final String clientReferenceId;
  

  TargetModel({
    this.id,
    required this.beneficiaryType,
    required this.baseline,
    required this.target,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
