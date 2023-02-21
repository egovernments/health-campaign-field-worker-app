// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualAddressSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  IndividualAddressSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualAddressModel extends EntityModel {
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final IndividualModel? individual;
  final AddressModel? address;
  

  IndividualAddressModel({
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.individual,
    this.address,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  IndividualAddressCompanion get companion {
    return IndividualAddressCompanion(
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      individual: Value(individual?.clientReferenceId),
    address: Value(address?.clientReferenceId),
    );
  }
}
