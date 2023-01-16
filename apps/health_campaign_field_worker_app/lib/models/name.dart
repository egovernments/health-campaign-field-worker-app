// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class NameSearchModel extends DataModel {
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  
  NameSearchModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class NameModel extends DataModel implements NameSearchModel {
  
  @override
  final String givenName;
  
  @override
  final String familyName;
  
  @override
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
