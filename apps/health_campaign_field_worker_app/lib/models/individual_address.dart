// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
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
  final IndividualModel? individual;
  final AddressModel? address;
  

  IndividualAddressModel({
    required this.clientReferenceId,
    this.individual,
    this.address,
    super.auditDetails,
  }):  super();

  IndividualAddressCompanion get companion {
    return IndividualAddressCompanion(
      clientReferenceId: Value(clientReferenceId),
      individual: Value(individual?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
