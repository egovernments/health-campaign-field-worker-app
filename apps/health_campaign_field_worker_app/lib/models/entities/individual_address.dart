// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualAddressSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  
  IndividualAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualAddressModel extends EntityModel {
  final String clientReferenceId;
  final String tenantId;
  final int rowVersion;
  final IndividualModel? individual;
  final AddressModel? address;
  

  IndividualAddressModel({
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.individual,
    this.address,
    super.auditDetails,
  }):  super();

  IndividualAddressCompanion get companion {
    return IndividualAddressCompanion(
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
