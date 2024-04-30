// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'referral_recon_attributes.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconAttributesSearchModel
    with ReferralReconAttributesSearchModelMappable {
  final String? id;
  final String? dataType;
  final String? referenceId;
  final String? tenantId;
  final String? code;
  final String? isActive;
  final bool? required;
  final String? regex;
  final int? order;

  ReferralReconAttributesSearchModel({
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.isActive,
    this.required,
    this.regex,
    this.order,
  }) : super();

  @MappableConstructor()
  ReferralReconAttributesSearchModel.ignoreDeleted({
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.isActive,
    this.required,
    this.regex,
    this.order,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralReconAttributesModel with ReferralReconAttributesModelMappable {
  static const schemaName = 'ReferralReconAttributes';

  final String? id;
  final String? dataType;
  final String? referenceId;
  final String? tenantId;
  final String? code;
  final List<String>? values;
  final String? isActive;
  final bool? required;
  final String? regex;
  final int? order;
  final bool? nonRecoverableError;
  final int? rowVersion;

  ReferralReconAttributesModel({
    this.id,
    this.dataType,
    this.referenceId,
    this.tenantId,
    this.code,
    this.values,
    this.isActive,
    this.required,
    this.regex,
    this.order,
    this.nonRecoverableError = false,
    this.rowVersion,
  }) : super();
}
