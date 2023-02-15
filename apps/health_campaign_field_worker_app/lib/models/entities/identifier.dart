// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IdentifierSearchModel extends EntitySearchModel {
  final String? identifierType;
  final String? identifierId;
  final String? clientReferenceId;
  final String? tenantId;

  IdentifierSearchModel({
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class IdentifierModel extends EntityModel implements IdentifierSearchModel {
  @override
  final String? identifierType;

  @override
  final String? identifierId;

  @override
  final String clientReferenceId;

  @override
  final String tenantId;
  final int rowVersion;

  IdentifierModel({
    this.identifierType,
    this.identifierId,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }) : super();

  IdentifierCompanion get companion {
    return IdentifierCompanion(
      identifierType: Value(identifierType),
      identifierId: Value(identifierId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
    );
  }
}
