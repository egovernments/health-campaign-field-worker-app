// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'stock.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockSearchModel extends EntitySearchModel with StockSearchModelMappable {
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
  final List<String>? transactionType;
  final List<String>? transactionReason;
  final DateTime? dateOfEntryTime;

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
    int? dateOfEntry,
    super.boundaryCode,
    super.isDeleted,
  })  : dateOfEntryTime = dateOfEntry == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(dateOfEntry),
        super();

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
    int? dateOfEntry,
    super.boundaryCode,
  })  : dateOfEntryTime = dateOfEntry == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(dateOfEntry),
        super(isDeleted: false);

  int? get dateOfEntry => dateOfEntryTime?.millisecondsSinceEpoch;
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockModel extends EntityModel with StockModelMappable {
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
  final String? wayBillNumber;
  final String? receiverId;
  final String? receiverType;
  final String? senderId;
  final String? senderType;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final String? transactionType;
  final String? transactionReason;
  final StockAdditionalFields? additionalFields;
  final DateTime? dateOfEntryTime;

  StockModel({
    int? dateOfEntry,
    this.additionalFields,
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.transactingPartyId,
    this.transactingPartyType,
    this.quantity,
    this.wayBillNumber,
    this.receiverId,
    this.receiverType,
    this.senderId,
    this.senderType,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    this.transactionType,
    this.transactionReason,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  })  : dateOfEntryTime = dateOfEntry == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(dateOfEntry),
        super();

  int? get dateOfEntry => dateOfEntryTime?.millisecondsSinceEpoch;

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
      id: Value(id),
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      transactingPartyId: Value(transactingPartyId),
      transactingPartyType: Value(transactingPartyType),
      quantity: Value(quantity),
      waybillNumber: Value(wayBillNumber),
      receiverId: Value(receiverId),
      receiverType: Value(receiverType),
      senderId: Value(senderId),
      senderType: Value(senderType),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      transactionType: Value(transactionType),
      transactionReason: Value(transactionReason),
      dateOfEntry: Value(dateOfEntry),
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
