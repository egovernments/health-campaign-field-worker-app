// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualNameSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  IndividualNameSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualNameModel extends EntityModel {
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  final IndividualModel? individual;
  final NameModel? name;
  

  IndividualNameModel({
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.individual,
    this.name,
    super.auditDetails,
  }):  super();

  IndividualNameCompanion get companion {
    return IndividualNameCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    name: Value(name?.clientReferenceId),
    );
  }
}
