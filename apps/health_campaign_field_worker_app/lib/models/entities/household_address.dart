// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdAddressSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  HouseholdAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdAddressModel extends EntityModel {
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final HouseholdModel? household;
  final AddressModel? address;
  

  HouseholdAddressModel({
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.household,
    this.address,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  HouseholdAddressCompanion get companion {
    return HouseholdAddressCompanion(
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      household: Value(household?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
