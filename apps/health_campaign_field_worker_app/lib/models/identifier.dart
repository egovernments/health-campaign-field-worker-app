// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IdentifierSearchModel extends DataModel {
  final String? type;
  final String? id;
  
  IdentifierSearchModel({
    this.type,
    this.id,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IdentifierModel extends DataModel implements IdentifierSearchModel {
  
  @override
  final String type;
  final String clientReferenceId;
  
  @override
  final String id;
  

  IdentifierModel({
    required this.type,
    required this.clientReferenceId,
    required this.id,
    super.auditDetails,
  }):  super();
}
