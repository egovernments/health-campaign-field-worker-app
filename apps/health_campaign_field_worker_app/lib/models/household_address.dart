// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class HouseholdAddressSearchModel extends EntitySearchModel {
  final String? clientReferenceId;
  
  HouseholdAddressSearchModel({
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdAddressModel extends EntityModel implements HouseholdAddressSearchModel {
  
  @override
  final String clientReferenceId;
  final HouseholdModel? household;
  final AddressModel? address;
  

  HouseholdAddressModel({
    required this.clientReferenceId,
    this.household,
    this.address,
    super.auditDetails,
  }):  super();

  HouseholdAddressCompanion get companion {
    return HouseholdAddressCompanion(
      clientReferenceId: Value(clientReferenceId),
      household: Value(household?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
