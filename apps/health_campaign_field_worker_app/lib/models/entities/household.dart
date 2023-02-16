// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdSearchModel extends EntitySearchModel {
  final String? id;
  final int? memberCount;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  HouseholdSearchModel({
    this.id,
    this.memberCount,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdModel extends EntityModel {
  final String? id;
  final int? memberCount;
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  final AddressModel? address;
  

  HouseholdModel({
    this.id,
    this.memberCount,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.address,
    super.auditDetails,
  }):  super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      id: Value(id),
      memberCount: Value(memberCount),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
