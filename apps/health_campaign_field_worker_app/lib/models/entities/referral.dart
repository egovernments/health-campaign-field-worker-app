// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'referral.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralSearchModel extends EntitySearchModel with ReferralSearchModelMappable {
  final String? id;
  final List<String>? projectBeneficiaryClientReferenceId;
  final String? projectId;
  final String? referrerId;
  final String? recipientType;
  final String? recipientId;
  final List<String>? reasons;
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  ReferralSearchModel({
    this.id,
    this.projectBeneficiaryClientReferenceId,
    this.projectId,
    this.referrerId,
    this.recipientType,
    this.recipientId,
    this.reasons,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ReferralSearchModel.ignoreDeleted({
    this.id,
    this.projectBeneficiaryClientReferenceId,
    this.projectId,
    this.referrerId,
    this.recipientType,
    this.recipientId,
    this.reasons,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralModel extends EntityModel with ReferralModelMappable {

  static const schemaName = 'Referral';

  final String? id;
  final String? projectId;
  final String? projectBeneficiaryClientReferenceId;
  final String? referrerId;
  final String? recipientType;
  final String? recipientId;
  final List<String>? reasons;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final ReferralAdditionalFields? additionalFields;

  ReferralModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.projectBeneficiaryClientReferenceId,
    this.referrerId,
    this.recipientType,
    this.recipientId,
    this.reasons,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ReferralCompanion get companion {
    return ReferralCompanion(
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
      projectId: Value(projectId),
      projectBeneficiaryClientReferenceId: Value(projectBeneficiaryClientReferenceId),
      referrerId: Value(referrerId),
      recipientType: Value(recipientType),
      recipientId: Value(recipientId),
      reasons: Value(reasons?.toString()),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralAdditionalFields extends AdditionalFields with ReferralAdditionalFieldsMappable {
  ReferralAdditionalFields({
    super.schema = 'Referral',
    required super.version,
    super.fields,
  });
}

