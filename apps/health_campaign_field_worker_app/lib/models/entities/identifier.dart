// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IdentifierSearchModel extends EntitySearchModel {
  final String? type;
  final String? id;
  final String? clientReferenceId;
  final String? tenantId;
  
  IdentifierSearchModel({
    this.type,
    this.id,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IdentifierModel extends EntityModel implements IdentifierSearchModel {
  
  @override
  final String? type;
  
  @override
  final String? id;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  

  IdentifierModel({
    this.type,
    this.id,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  IdentifierCompanion get companion {
    return IdentifierCompanion(
      type: Value(type),
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
