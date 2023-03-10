// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class TargetSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  TargetSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class TargetModel extends EntityModel implements TargetSearchModel {
  final String? id;
  final String? beneficiaryType;
  final String? baseline;
  final String? target;
  
  @override
  final String clientReferenceId;
  

  TargetModel({
    this.id,
    this.beneficiaryType,
    this.baseline,
    this.target,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  TargetCompanion get companion {
    return TargetCompanion(
      id: Value(id),
      beneficiaryType: Value(beneficiaryType),
      baseline: Value(baseline),
      target: Value(target),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
