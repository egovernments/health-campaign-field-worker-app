// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class NameSearchModel extends EntitySearchModel {
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String? clientReferenceId;
  
  NameSearchModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class NameModel extends EntityModel implements NameSearchModel {
  
  @override
  final String? givenName;
  
  @override
  final String? familyName;
  
  @override
  final String? otherNames;
  
  @override
  final String clientReferenceId;
  

  NameModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  NameCompanion get companion {
    return NameCompanion(
      givenName: Value(givenName),
      familyName: Value(familyName),
      otherNames: Value(otherNames),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
