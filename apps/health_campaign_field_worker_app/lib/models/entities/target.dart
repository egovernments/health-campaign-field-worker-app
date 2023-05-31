// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class TargetSearchModel extends EntitySearchModel {
  final String? tenantId;
  @override
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
  final String? clientReferenceId;
  final double? totalNo;
  final double? targetNo;
  final String? tenantId;
  @override
  final bool? isDeleted;
  final int? rowVersion;
  final BeneficiaryType? beneficiaryType;
  final TargetAdditionalFields? additionalFields;

  TargetModel({
    this.additionalFields,
    required this.id,
    this.clientReferenceId,
    this.totalNo,
    this.targetNo,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.beneficiaryType,
    super.auditDetails,
  }): super();

  TargetCompanion get companion {
    return TargetCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      totalNo: Value(totalNo),
      targetNo: Value(targetNo),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      beneficiaryType: Value(beneficiaryType),
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
