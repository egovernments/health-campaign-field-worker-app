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
  final bool? isDeleted;
  
  NameSearchModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
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
  final bool? isDeleted;
  final int rowVersion;
  

  NameModel({
    this.givenName,
    this.familyName,
    this.otherNames,
    required this.clientReferenceId,
    required this.tenantId,
    this.isDeleted,
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
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
