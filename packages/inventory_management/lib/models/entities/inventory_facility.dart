import 'package:dart_mappable/dart_mappable.dart';

part 'inventory_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class InventoryFacilitySearchModel with InventoryFacilitySearchModelMappable {
  final List<String>? id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;

  InventoryFacilitySearchModel({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  InventoryFacilitySearchModel.ignoreDeleted({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class InventoryFacilityModel with InventoryFacilityModelMappable {
  static const schemaName = 'InventoryFacility';

  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  InventoryFacilityModel({
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
