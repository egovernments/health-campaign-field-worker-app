// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart';

part 'referral_recon_service_definition.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceDefinitionSearchModel
    with ReferralReconServiceDefinitionSearchModelMappable {
  final String? id;
  final String? tenantId;
  final List<String>? code;
  final bool? isActive;

  ReferralReconServiceDefinitionSearchModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
  }) : super();

  @MappableConstructor()
  ReferralReconServiceDefinitionSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconServiceDefinitionModel
    with ReferralReconServiceDefinitionModelMappable {
  static const schemaName = 'ServiceDefinition';

  final String? id;
  final String? tenantId;
  final String? code;
  final bool? isActive;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final List<ReferralReconAttributesModel>? attributes;

  ReferralReconServiceDefinitionModel({
    this.id,
    this.tenantId,
    this.code,
    this.isActive,
    this.nonRecoverableError = false,
    this.rowVersion,
    this.attributes,
  }) : super();
}
