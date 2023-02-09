// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class FacilitySearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? clientReferenceId;
  
  FacilitySearchModel({
    this.id,
    this.tenantId,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class FacilityModel extends EntityModel implements FacilitySearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final bool? isPermanent;
  
  @override
  final String? usage;
  
  @override
  final int? storageCapacity;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  final AddressModel? address;
  

  FacilityModel({
    this.id,
    this.tenantId,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.rowVersion,
    required this.clientReferenceId,
    this.address,
    super.auditDetails,
  }):  super();

  FacilityCompanion get companion {
    return FacilityCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      isPermanent: Value(isPermanent),
      usage: Value(usage),
      storageCapacity: Value(storageCapacity),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
