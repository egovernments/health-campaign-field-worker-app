// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdSearchModel extends EntitySearchModel {
  final String? id;
  final int? memberCount;
  final double? latitude;
  final double? longitude;
  final double? maxRadius;
  final bool? isProximityEnabled;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  HouseholdSearchModel({
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    this.maxRadius,
    this.isProximityEnabled,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  HouseholdSearchModel.ignoreDeleted({
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    this.maxRadius,
    this.isProximityEnabled,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class HouseholdModel extends EntityModel {

  static const schemaName = 'Household';

  final String? id;
  final int? memberCount;
  final double? latitude;
  final double? longitude;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final HouseholdAdditionalFields? additionalFields;

  HouseholdModel({
    this.additionalFields,
    this.id,
    this.memberCount,
    this.latitude,
    this.longitude,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    this.address,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      memberCount: Value(memberCount),
      latitude: Value(latitude),
      longitude: Value(longitude),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class HouseholdAdditionalFields extends AdditionalFields {
  HouseholdAdditionalFields({
    super.schema = 'Household',
    required super.version,
    super.fields,
  });
}
