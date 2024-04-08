// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/stock.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'hcm_stock.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockSearchModel extends EntitySearchModel
    with HcmStockSearchModelMappable {
  final StockSearchModel? stock;

  HcmStockSearchModel({
    this.stock,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HcmStockSearchModel.ignoreDeleted(
    this.stock, {
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockModel extends EntityModel with HcmStockModelMappable {
  final StockModel? stock;
  final StockAdditionalFields? additionalFields;

  HcmStockModel({
    this.additionalFields,
    this.stock,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  StockCompanion get companion {
    return StockCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(stock!.id),
      tenantId: Value(stock!.tenantId),
      facilityId: Value(stock!.facilityId),
      productVariantId: Value(stock!.productVariantId),
      referenceId: Value(stock!.referenceId),
      referenceIdType: Value(stock!.referenceIdType),
      transactingPartyId: Value(stock!.transactingPartyId),
      transactingPartyType: Value(stock!.transactingPartyType),
      quantity: Value(stock!.quantity),
      waybillNumber: Value(stock!.waybillNumber),
      receiverId: Value(stock!.receiverId),
      receiverType: Value(stock!.receiverType),
      senderId: Value(stock!.senderId),
      senderType: Value(stock!.senderType),
      nonRecoverableError: Value(stock!.nonRecoverableError),
      clientReferenceId: Value(stock!.clientReferenceId!),
      rowVersion: Value(stock!.rowVersion),
      transactionType: Value(stock!.transactionType),
      transactionReason: Value(stock!.transactionReason),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockAdditionalFields extends AdditionalFields
    with StockAdditionalFieldsMappable {
  StockAdditionalFields({
    super.schema = 'Stock',
    required super.version,
    super.fields,
  });
}
