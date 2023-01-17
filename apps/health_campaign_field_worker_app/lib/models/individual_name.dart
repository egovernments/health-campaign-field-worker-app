// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualNameSearchModel extends DataModel {
  
  IndividualNameSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualNameModel extends DataModel implements IndividualNameSearchModel {
  final String clientReferenceId;
  final IndividualModel individual;
  final NameModel name;
  

  IndividualNameModel({
    required this.clientReferenceId,
    required this.individual,
    required this.name,
    super.auditDetails,
  }):  super();
}
