// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IdentifierRequestModel extends DataModel {
  
  IdentifierRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class IdentifierModel extends DataModel implements IdentifierRequestModel {
  final String type;
  final String id;
  final String clientReferenceId;
  

  IdentifierModel({
    required this.type,
    required this.id,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
