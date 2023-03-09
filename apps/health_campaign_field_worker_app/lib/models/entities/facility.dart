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
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final AddressModel? address;
  final DateTime createdAtTime;
  

  FacilityModel({
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    this.address,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  FacilityCompanion get companion {
    return FacilityCompanion(
      id: Value(id),
      isPermanent: Value(isPermanent),
      usage: Value(usage),
      storageCapacity: Value(storageCapacity),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      );
  }
}
