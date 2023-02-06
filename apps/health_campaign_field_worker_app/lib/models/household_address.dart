// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class HouseholdAddressSearchModel extends EntitySearchModel {
  
  HouseholdAddressSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class HouseholdAddressModel extends EntityModel implements HouseholdAddressSearchModel {
  final String clientReferenceId;
  final HouseholdModel household;
  final AddressModel address;
  

  HouseholdAddressModel({
    required this.clientReferenceId,
    required this.household,
    required this.address,
    super.auditDetails,
  }):  super();
}
