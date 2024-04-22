// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'hcm_inventory_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmInventoryFacilitySearchModel extends EntitySearchModel with HcmInventoryFacilitySearchModelMappable {
  final InventoryFacilitySearchModel? facilitySearchModel;

  HcmInventoryFacilitySearchModel({
    this.facilitySearchModel,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  HcmInventoryFacilitySearchModel.ignoreDeleted({
    this.facilitySearchModel,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmInventoryFacilityModel extends EntityModel with HcmInventoryFacilityModelMappable {

  final InventoryFacilityModel? facilityModel;
  final AddressModel? address;
  final FacilityAdditionalFields? additionalFields;

  HcmInventoryFacilityModel({
    this.additionalFields,
    this.facilityModel,
    this.address,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  FacilityCompanion get companion {
    return FacilityCompanion(
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
      id: Value(facilityModel!.id),
      isPermanent: Value(facilityModel!.isPermanent),
      usage: Value(facilityModel!.usage),
      storageCapacity: Value(facilityModel!.storageCapacity),
      nonRecoverableError: Value(facilityModel!.nonRecoverableError),
      tenantId: Value(facilityModel!.tenantId),
      rowVersion: Value(facilityModel!.rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmInventoryFacilityAdditionalFields extends AdditionalFields with HcmInventoryFacilityAdditionalFieldsMappable {
  HcmInventoryFacilityAdditionalFields({
    super.schema = 'HcmInventoryFacility',
    required super.version,
    super.fields,
  });
}

