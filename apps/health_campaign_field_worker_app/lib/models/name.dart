// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class NameRequestModel extends DataModel {
  
  NameRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class NameModel extends DataModel implements NameRequestModel {
  final String givenName;
  final String familyName;
  final String? otherNames;
  final String clientReferenceId;
  

  NameModel({
    required this.givenName,
    required this.familyName,
    this.otherNames,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
