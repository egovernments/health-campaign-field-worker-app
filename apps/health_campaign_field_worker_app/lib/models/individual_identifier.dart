// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualIdentifierSearchModel extends EntitySearchModel {
  
  IndividualIdentifierSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualIdentifierModel extends EntityModel implements IndividualIdentifierSearchModel {
  final String clientReferenceId;
  final IndividualModel individual;
  final IdentifierModel identifier;
  

  IndividualIdentifierModel({
    required this.clientReferenceId,
    required this.individual,
    required this.identifier,
    super.auditDetails,
  }):  super();
}
