// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualNameSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  IndividualNameSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualNameModel extends EntityModel {
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final IndividualModel? individual;
  final NameModel? name;
  

  IndividualNameModel({
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.individual,
    this.name,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  IndividualNameCompanion get companion {
    return IndividualNameCompanion(
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    name: Value(name?.clientReferenceId),
    );
  }
}
