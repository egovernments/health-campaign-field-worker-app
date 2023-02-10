// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdAddressSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  final String? tenantId;
  
  HouseholdAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdAddressModel extends EntityModel implements HouseholdAddressSearchModel {
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  final HouseholdModel? household;
  final AddressModel? address;
  

  HouseholdAddressModel({
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.household,
    this.address,
    super.auditDetails,
  }):  super();

  HouseholdAddressCompanion get companion {
    return HouseholdAddressCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      household: Value(household?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
