// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'hcm_stock_recon.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockReconciliationSearchModel extends EntitySearchModel
    with HcmStockReconciliationSearchModelMappable {
  final StockReconciliationSearchModel? stockReconciliationSearchModel;

  HcmStockReconciliationSearchModel({
    this.stockReconciliationSearchModel,
    int? dateOfReconciliation,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HcmStockReconciliationSearchModel.ignoreDeleted({
    this.stockReconciliationSearchModel,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockReconciliationModel extends EntityModel
    with HcmStockReconciliationModelMappable {

  final StockReconciliationModel? stockReconciliation;
  final StockReconciliationAdditionalFields? additionalFields;

  HcmStockReconciliationModel({
    this.additionalFields,
    this.stockReconciliation,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  StockReconciliationCompanion get companion {
    return StockReconciliationCompanion(
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
      id: Value(stockReconciliation!.id),
      tenantId: Value(stockReconciliation!.tenantId),
      facilityId: Value(stockReconciliation!.facilityId),
      productVariantId: Value(stockReconciliation!.productVariantId),
      referenceId: Value(stockReconciliation!.referenceId),
      referenceIdType: Value(stockReconciliation!.referenceIdType),
      physicalCount: Value(stockReconciliation!.physicalCount),
      calculatedCount: Value(stockReconciliation!.calculatedCount),
      commentsOnReconciliation:
          Value(stockReconciliation!.commentsOnReconciliation),
      nonRecoverableError: Value(stockReconciliation!.nonRecoverableError),
      clientReferenceId: Value(stockReconciliation!.clientReferenceId),
      rowVersion: Value(stockReconciliation!.rowVersion),
      dateOfReconciliation: Value(stockReconciliation!.dateOfReconciliation),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationAdditionalFields extends AdditionalFields
    with StockReconciliationAdditionalFieldsMappable {
  StockReconciliationAdditionalFields({
    super.schema = 'StockReconciliation',
    required super.version,
    super.fields,
  });
}
