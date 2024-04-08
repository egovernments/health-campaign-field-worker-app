import 'package:dart_mappable/dart_mappable.dart';

part 'referral_project_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralProjectFacilitySearchModel
    with ReferralProjectFacilitySearchModelMappable {
  final String? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;

  ReferralProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  ReferralProjectFacilitySearchModel.ignoreDeleted({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ReferralProjectFacilityModel with ReferralProjectFacilityModelMappable {
  static const schemaName = 'ReferralProjectFacility';

  final String id;
  final String? facilityId;
  final List<String>? projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  ReferralProjectFacilityModel({
    required this.id,
    this.facilityId,
    this.projectId,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
