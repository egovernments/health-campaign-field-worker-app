// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data/sql_store/sql_store.dart';
import 'package:drift/drift.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

import 'package:digit_data_model/data_model.dart';

part 'hcm_hf_referral.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmHFReferralSearchModel extends EntitySearchModel
    with HcmHFReferralSearchModelMappable {
  final HFReferralSearchModel? hFReferral;

  HcmHFReferralSearchModel({
    this.hFReferral,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HcmHFReferralSearchModel.ignoreDeleted(
    this.hFReferral, {
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmHFReferralModel extends EntityModel with HcmHFReferralModelMappable {
  final HFReferralModel? hFReferral;
  final HFReferralAdditionalFields? additionalFields;

  HcmHFReferralModel({
    this.additionalFields,
    this.hFReferral,
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
      id: Value(hFReferral?.id),
      tenantId: Value(hFReferral?.tenantId),
      name: Value(hFReferral?.name),
      projectId: Value(hFReferral?.projectId),
      projectFacilityId: Value(hFReferral?.projectFacilityId),
      symptomSurveyId: Value(hFReferral?.symptomSurveyId),
      beneficiaryId: Value(hFReferral?.beneficiaryId),
      referralCode: Value(hFReferral?.referralCode),
      nationalLevelId: Value(hFReferral?.nationalLevelId),
      symptom: Value(hFReferral?.symptom),
      nonRecoverableError: Value(hFReferral?.nonRecoverableError),
      clientReferenceId: Value(hFReferral!.clientReferenceId),
      rowVersion: Value(hFReferral?.rowVersion),
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
