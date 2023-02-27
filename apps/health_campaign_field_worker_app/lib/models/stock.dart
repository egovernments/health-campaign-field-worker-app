// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class StockSearchModel extends EntitySearchModel {
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final String? transactionType;
  final String? transactionReason;
  final String? transactingPartyId;
  final String? transactingPartyType;
  final String? clientReferenceId;
  
  StockSearchModel({
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactionType,
    this.transactionReason,
    this.transactingPartyId,
    this.transactingPartyType,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class StockModel extends EntityModel implements StockSearchModel {
  
  @override
  final String? tenantId;
  
  @override
  final String? facilityId;
  
  @override
  final String? productVariantId;
  
  @override
  final String? referenceId;
  
  @override
  final String? referenceIdType;
  
  @override
  final String? transactionType;
  
  @override
  final String? transactionReason;
  
  @override
  final String? transactingPartyId;
  
  @override
  final String? transactingPartyType;
  final String? quantity;
  final String? waybillNumber;
  
  @override
  final String clientReferenceId;
  

  StockModel({
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactionType,
    this.transactionReason,
    this.transactingPartyId,
    this.transactingPartyType,
    this.quantity,
    this.waybillNumber,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();

  StockCompanion get companion {
    return StockCompanion(
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      transactionType: Value(transactionType),
      transactionReason: Value(transactionReason),
      transactingPartyId: Value(transactingPartyId),
      transactingPartyType: Value(transactingPartyType),
      quantity: Value(quantity),
      waybillNumber: Value(waybillNumber),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
