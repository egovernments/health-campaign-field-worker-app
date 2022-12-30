import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class TargetRequestModel extends DataModel {
  final String? id;
  final String? beneficiaryType;
  final String? baseline;
  final String? target;
  final String? clientReferenceId;
  
  TargetRequestModel({
    this.id,
    this.beneficiaryType,
    this.baseline,
    this.target,
    this.clientReferenceId,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class TargetModel extends DataModel implements TargetRequestModel {
  
  @override
  final String? id;
  
  @override
  final String beneficiaryType;
  
  @override
  final String baseline;
  
  @override
  final String target;
  
  @override
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
