// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'h_f_referral.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralSearchModel with HFReferralSearchModelMappable {
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
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralModel with HFReferralModelMappable {
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

  HFReferralModel({
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
  }) : super();
}
