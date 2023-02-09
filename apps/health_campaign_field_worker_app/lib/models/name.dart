// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class NameSearchModel extends EntitySearchModel {
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
class NameModel extends EntityModel implements NameSearchModel {
  final String? clientReferenceId;
  
  @override
  final String? givenName;
  
  @override
  final String? familyName;
  
  @override
  final String? otherNames;
  

  NameModel({
    this.clientReferenceId,
    this.givenName,
    this.familyName,
    this.otherNames,
    super.auditDetails,
  }):  super();

  NameCompanion get companion {
    return NameCompanion(
      clientReferenceId: Value(clientReferenceId),
      givenName: Value(givenName),
      familyName: Value(familyName),
      otherNames: Value(otherNames),
      );
  }
}
