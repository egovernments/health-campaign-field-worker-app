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
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  NameSearchModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class NameModel extends EntityModel {
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  

  NameModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  NameCompanion get companion {
    return NameCompanion(
      givenName: Value(givenName),
      familyName: Value(familyName),
      otherNames: Value(otherNames),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
