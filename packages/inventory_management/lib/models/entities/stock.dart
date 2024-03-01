
import 'package:dart_mappable/dart_mappable.dart';

import 'transaction_reason.dart';
import 'transaction_type.dart';

part 'stock.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockSearchModel with StockSearchModelMappable {
  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final String? transactingPartyId;
  final String? transactingPartyType;
  final String? receiverId;
  final String? receiverType;
  final String? senderId;
  final String? senderType;
  final List<String>? clientReferenceId;
  final List<TransactionType>? transactionType;
  final List<TransactionReason>? transactionReason;
  
  StockSearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.receiverId,
    this.receiverType,
    this.senderId,
    this.senderType,
    this.clientReferenceId,
    this.transactionType,
    this.transactionReason,
  }):  super();

  @MappableConstructor()
  StockSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.receiverId,
    this.receiverType,
    this.senderId,
    this.senderType,
    this.clientReferenceId,
    this.transactionType,
    this.transactionReason,
  }):  super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockModel with StockModelMappable {

  static const schemaName = 'Stock';

  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final String? transactingPartyId;
  final String? transactingPartyType;
  final String? quantity;
  final String? waybillNumber;
  final String? receiverId;
  final String? receiverType;
  final String? senderId;
  final String? senderType;
  final bool? nonRecoverableError;
  final String? clientReferenceId;
  final int? rowVersion;
  final TransactionType? transactionType;
  final TransactionReason? transactionReason;

  StockModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.quantity,
    this.waybillNumber,
    this.receiverId,
    this.receiverType,
    this.senderId,
    this.senderType,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    this.transactionType,
    this.transactionReason,
  }): super();
}

