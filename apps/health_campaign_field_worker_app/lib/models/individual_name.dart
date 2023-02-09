// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class IndividualNameSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  IndividualNameSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualNameModel extends EntityModel implements IndividualNameSearchModel {
  
  @override
  final String clientReferenceId;
  final IndividualModel? individual;
  final NameModel? name;
  

  IndividualNameModel({
    required this.clientReferenceId,
    this.individual,
    this.name,
    super.auditDetails,
  }):  super();

  IndividualNameCompanion get companion {
    return IndividualNameCompanion(
      clientReferenceId: Value(clientReferenceId),
      individual: Value(individual?.clientReferenceId),
    name: Value(name?.clientReferenceId),
    );
  }
}
