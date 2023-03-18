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
  final bool? isDeleted;
  
  HouseholdSearchModel({
    this.id,
    this.memberCount,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdModel extends EntityModel {

  static const schemaName = 'Household';

  final String? id;
  final int? memberCount;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final AddressModel? address;
  final HouseholdAdditionalFields? additionalFields;

  HouseholdModel({
    this.additionalFields,
    this.id,
    this.memberCount,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.address,
    super.auditDetails,
  }): super();

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      id: Value(id),
      memberCount: Value(memberCount),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
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
