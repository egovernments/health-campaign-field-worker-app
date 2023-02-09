// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class IndividualIdentifierSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  IndividualIdentifierSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualIdentifierModel extends EntityModel implements IndividualIdentifierSearchModel {
  
  @override
  final String clientReferenceId;
  final IndividualModel? individual;
  final IdentifierModel? identifier;
  

  IndividualIdentifierModel({
    required this.clientReferenceId,
    this.individual,
    this.identifier,
    super.auditDetails,
  }):  super();

  IndividualIdentifierCompanion get companion {
    return IndividualIdentifierCompanion(
      clientReferenceId: Value(clientReferenceId),
      individual: Value(individual?.clientReferenceId),
    identifier: Value(identifier?.clientReferenceId),
    );
  }
}
