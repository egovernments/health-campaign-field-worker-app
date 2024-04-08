// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_attributes.dart';

part 'referral_recon_service.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceSearchModel
    with ReferralReconServiceSearchModelMappable {
  final String? id;
  final String? clientId;
  final String? serviceDefId;
  final String? accountId;
  final String? createdAt;
  final String? tenantId;

  ReferralReconServiceSearchModel({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.accountId,
    this.createdAt,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  ReferralReconServiceSearchModel.ignoreDeleted({
    this.id,
    this.clientId,
    this.serviceDefId,
    this.accountId,
    this.createdAt,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceModel with ReferralReconServiceModelMappable {
  static const schemaName = 'ReferralReconService';

  final String? id;
  final String clientId;
  final String? serviceDefId;
  final bool? isActive;
  final String? accountId;
  final String? additionalDetails;
  final String? createdAt;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final List<ReferralReconServiceAttributesModel>? attributes;

  ReferralReconServiceModel({
    this.id,
    required this.clientId,
    this.serviceDefId,
    this.isActive,
    this.accountId,
    this.additionalDetails,
    this.createdAt,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.attributes,
  }) : super();
}
