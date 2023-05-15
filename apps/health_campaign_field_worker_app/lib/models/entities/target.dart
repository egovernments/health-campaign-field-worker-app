// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TargetSearchModel extends EntitySearchModel {
  final String? tenantId;
  
  TargetSearchModel({
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  TargetSearchModel.ignoreDeleted({
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class TargetModel extends EntityModel {

  static const schemaName = 'Target';

  final String id;
  final String? beneficiaryType;
  final String? baseline;
  final String? target;
  final String? tenantId;
  final int? rowVersion;
  final TargetAdditionalFields? additionalFields;

  TargetModel({
    this.additionalFields,
    required this.id,
    this.beneficiaryType,
    this.baseline,
    this.target,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  TargetCompanion get companion {
    return TargetCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      beneficiaryType: Value(beneficiaryType),
      baseline: Value(baseline),
      target: Value(target),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class TargetAdditionalFields extends AdditionalFields {
  TargetAdditionalFields({
    super.schema = 'Target',
    required super.version,
    super.fields,
  });
}
