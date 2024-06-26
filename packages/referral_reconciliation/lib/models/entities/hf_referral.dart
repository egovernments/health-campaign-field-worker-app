// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'hf_referral.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralSearchModel extends EntitySearchModel
    with HFReferralSearchModelMappable {
  final List<String>? id;
  final String? tenantId;
  final String? name;
  final List<String>? projectId;
  final List<String>? projectFacilityId;
  final List<String>? symptomSurveyId;
  final List<String>? beneficiaryId;
  final List<String>? referralCode;
  final List<String>? nationalLevelId;
  final List<String>? symptom;
  final List<String>? clientReferenceId;

  HFReferralSearchModel({
    this.id,
    this.tenantId,
    this.name,
    this.projectId,
    this.projectFacilityId,
    this.symptomSurveyId,
    this.beneficiaryId,
    this.referralCode,
    this.nationalLevelId,
    this.symptom,
    this.clientReferenceId,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HFReferralSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.name,
    this.projectId,
    this.projectFacilityId,
    this.symptomSurveyId,
    this.beneficiaryId,
    this.referralCode,
    this.nationalLevelId,
    this.symptom,
    this.clientReferenceId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralModel extends EntityModel with HFReferralModelMappable {
  static const schemaName = 'HFReferral';

  final String? id;
  final String? tenantId;
  final String? name;
  final String? projectId;
  final String? projectFacilityId;
  final String? symptomSurveyId;
  final String? beneficiaryId;
  final String? referralCode;
  final String? nationalLevelId;
  final String? symptom;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final HFReferralAdditionalFields? additionalFields;

  HFReferralModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.name,
    this.projectId,
    this.projectFacilityId,
    this.symptomSurveyId,
    this.beneficiaryId,
    this.referralCode,
    this.nationalLevelId,
    this.symptom,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  HFReferralCompanion get companion {
    return HFReferralCompanion(
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
      tenantId: Value(tenantId),
      name: Value(name),
      projectId: Value(projectId),
      projectFacilityId: Value(projectFacilityId),
      symptomSurveyId: Value(symptomSurveyId),
      beneficiaryId: Value(beneficiaryId),
      referralCode: Value(referralCode),
      nationalLevelId: Value(nationalLevelId),
      symptom: Value(symptom),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralAdditionalFields extends AdditionalFields
    with HFReferralAdditionalFieldsMappable {
  HFReferralAdditionalFields({
    super.schema = 'HFReferral',
    required super.version,
    super.fields,
  });
}
