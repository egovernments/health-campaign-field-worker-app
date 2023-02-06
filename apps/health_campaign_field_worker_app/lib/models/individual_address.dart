// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualAddressSearchModel extends EntitySearchModel {
  
  IndividualAddressSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualAddressModel extends EntityModel implements IndividualAddressSearchModel {
  final String clientReferenceId;
  final IndividualModel individual;
  final AddressModel address;
  

  IndividualAddressModel({
    required this.clientReferenceId,
    required this.individual,
    required this.address,
    super.auditDetails,
  }):  super();
}
