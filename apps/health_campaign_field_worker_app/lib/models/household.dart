// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class HouseholdSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final int? memberCount;
  
  HouseholdSearchModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.memberCount,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdModel extends EntityModel implements HouseholdSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? clientReferenceId;
  
  @override
  final int? memberCount;
  final int? rowVersion;
  final AddressModel? address;
  

  HouseholdModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.memberCount,
    this.rowVersion,
    this.address,
    super.auditDetails,
  }):  super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      clientReferenceId: Value(clientReferenceId),
      memberCount: Value(memberCount),
      rowVersion: Value(rowVersion),
      );
  }
}
