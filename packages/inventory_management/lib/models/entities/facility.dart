import 'package:dart_mappable/dart_mappable.dart';

part 'facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilitySearchModel with FacilitySearchModelMappable {
  final List<String>? id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;

  FacilitySearchModel({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  }):  super();

  @MappableConstructor()
  FacilitySearchModel.ignoreDeleted({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  }):  super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityModel with FacilityModelMappable {

  static const schemaName = 'Facility';

  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  FacilityModel({
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }): super();
}

