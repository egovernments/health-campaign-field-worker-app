// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TargetSearchModel extends EntitySearchModel {
  final String? tenantId;
  final bool? isDeleted;
  
  TargetSearchModel({
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class TargetModel extends EntityModel {

  static const schemaName = 'Target';

  final String id;
  final String? beneficiaryType;
  final String? baseline;
  final String? target;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  TargetModel({
    required this.id,
    this.beneficiaryType,
    this.baseline,
    this.target,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    TargetAdditionalFields? additionalFields,
  }): super(additionalFields: additionalFields == null
          ? null
          : Mapper.fromMap<AdditionalFields>(
            additionalFields.toMap(),
          ));

  TargetCompanion get companion {
    return TargetCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      beneficiaryType: Value(beneficiaryType),
      baseline: Value(baseline),
      target: Value(target),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
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
