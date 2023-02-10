// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final int? memberCount;
  final String? clientReferenceId;
  
  HouseholdSearchModel({
    this.id,
    this.tenantId,
    this.memberCount,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdModel extends EntityModel implements HouseholdSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final int? memberCount;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  final AddressModel? address;
  

  HouseholdModel({
    this.id,
    this.tenantId,
    this.memberCount,
    this.rowVersion,
    required this.clientReferenceId,
    this.address,
    super.auditDetails,
  }):  super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      memberCount: Value(memberCount),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
