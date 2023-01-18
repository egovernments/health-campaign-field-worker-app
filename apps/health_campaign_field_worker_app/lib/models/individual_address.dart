// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualAddressSearchModel extends DataModel {
  
  IndividualAddressSearchModel({
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualAddressModel extends DataModel implements IndividualAddressSearchModel {
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
