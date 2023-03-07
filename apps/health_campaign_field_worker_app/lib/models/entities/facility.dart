// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class FacilitySearchModel extends EntitySearchModel {
  final List<String>? id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  final bool? isDeleted;
  
  FacilitySearchModel({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class FacilityModel extends EntityModel {
  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final AddressModel? address;
  

  FacilityModel({
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.address,
    super.auditDetails,
  }):  super();

  FacilityCompanion get companion {
    return FacilityCompanion(
      id: Value(id),
      isPermanent: Value(isPermanent),
      usage: Value(usage),
      storageCapacity: Value(storageCapacity),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
