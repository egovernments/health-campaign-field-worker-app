// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'target.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TargetSearchModel extends EntitySearchModel
    with TargetSearchModelMappable {
  final String? tenantId;

  TargetSearchModel({
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  TargetSearchModel.ignoreDeleted({
    this.tenantId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TargetModel extends EntityModel with TargetModelMappable {
  static const schemaName = 'Target';

  final String id;
  final String? clientReferenceId;
  final double? totalNo;
  final double? targetNo;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final String? beneficiaryType;
  final TargetAdditionalFields? additionalFields;

  TargetModel({
    this.additionalFields,
    required this.id,
    this.clientReferenceId,
    this.totalNo,
    this.targetNo,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.beneficiaryType,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  TargetCompanion get companion {
    return TargetCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      totalNo: Value(totalNo),
      targetNo: Value(targetNo),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      beneficiaryType: Value(beneficiaryType),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class TargetAdditionalFields extends AdditionalFields
    with TargetAdditionalFieldsMappable {
  TargetAdditionalFields({
    super.schema = 'Target',
    required super.version,
    super.fields,
  });
}
