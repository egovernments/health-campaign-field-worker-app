// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualIdentifierSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  final String? tenantId;
  
  IndividualIdentifierSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualIdentifierModel extends EntityModel implements IndividualIdentifierSearchModel {
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  final IndividualModel? individual;
  final IdentifierModel? identifier;
  

  IndividualIdentifierModel({
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.individual,
    this.identifier,
    super.auditDetails,
  }):  super();

  IndividualIdentifierCompanion get companion {
    return IndividualIdentifierCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    identifier: Value(identifier?.clientReferenceId),
    );
  }
}
