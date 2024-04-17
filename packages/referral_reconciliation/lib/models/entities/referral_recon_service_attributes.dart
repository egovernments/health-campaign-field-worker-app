// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'referral_recon_service_attributes.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceAttributesSearchModel
    with ReferralReconServiceAttributesSearchModelMappable {
  final List<String>? clientReferenceId;
  final String? tenantId;

  ReferralReconServiceAttributesSearchModel({
    this.clientReferenceId,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  ReferralReconServiceAttributesSearchModel.ignoreDeleted({
    this.clientReferenceId,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceAttributesModel
    with ReferralReconServiceAttributesModelMappable {
  static const schemaName = 'ReferralReconServiceAttributes';

  final String? attributeCode;
  final dynamic? value;
  final String? dataType;
  final String? referenceId;
  final dynamic? additionalDetails;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;

  ReferralReconServiceAttributesModel({
    this.attributeCode,
    this.value,
    this.dataType,
    this.referenceId,
    this.additionalDetails,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
