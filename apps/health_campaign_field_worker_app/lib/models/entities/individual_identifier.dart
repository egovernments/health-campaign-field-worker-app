// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualIdentifierSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  IndividualIdentifierSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualIdentifierModel extends EntityModel {
  final String clientReferenceId;
  final String tenantId;
  final bool? isDeleted;
  final int rowVersion;
  final IndividualModel? individual;
  final IdentifierModel? identifier;
  

  IndividualIdentifierModel({
    required this.clientReferenceId,
    required this.tenantId,
    this.isDeleted,
    required this.rowVersion,
    this.individual,
    this.identifier,
    super.auditDetails,
  }):  super();

  IndividualIdentifierCompanion get companion {
    return IndividualIdentifierCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    identifier: Value(identifier?.clientReferenceId),
    );
  }
}
