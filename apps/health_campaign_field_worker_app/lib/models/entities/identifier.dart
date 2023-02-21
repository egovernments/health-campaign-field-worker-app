// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IdentifierSearchModel extends EntitySearchModel {
  final String? identifierType;
  final String? identifierId;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  IdentifierSearchModel({
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IdentifierModel extends EntityModel {
  final String? identifierType;
  final String? identifierId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  IdentifierModel({
    this.identifierType,
    this.identifierId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  IdentifierCompanion get companion {
    return IdentifierCompanion(
      identifierType: Value(identifierType),
      identifierId: Value(identifierId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
