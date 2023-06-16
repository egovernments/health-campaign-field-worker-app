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
  
  FacilitySearchModel({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  FacilitySearchModel.ignoreDeleted({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class FacilityModel extends EntityModel {

  static const schemaName = 'Facility';

  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final FacilityAdditionalFields? additionalFields;

  FacilityModel({
    this.additionalFields,
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
    this.rowVersion,
    this.address,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  FacilityCompanion get companion {
    return FacilityCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      isPermanent: Value(isPermanent),
      usage: Value(usage),
      storageCapacity: Value(storageCapacity),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class FacilityAdditionalFields extends AdditionalFields {
  FacilityAdditionalFields({
    super.schema = 'Facility',
    required super.version,
    super.fields,
  });
}
