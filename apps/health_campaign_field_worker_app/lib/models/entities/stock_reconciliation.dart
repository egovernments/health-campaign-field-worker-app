// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'stock_reconciliation.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationSearchModel extends EntitySearchModel with StockReconciliationSearchModelMappable {
  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final List<String>? clientReferenceId;
  final DateTime? dateOfReconciliationTime;
  
  StockReconciliationSearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.clientReferenceId,
    int? dateOfReconciliation,
    super.boundaryCode,
    super.isDeleted,
  }): dateOfReconciliationTime = dateOfReconciliation == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
   super();

  @MappableConstructor()
  StockReconciliationSearchModel.ignoreDeleted({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.clientReferenceId,
    int? dateOfReconciliation,
    super.boundaryCode,
  }): dateOfReconciliationTime = dateOfReconciliation == null
  ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
   super(isDeleted: false);

  int? get dateOfReconciliation => dateOfReconciliationTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationModel extends EntityModel with StockReconciliationModelMappable {

  static const schemaName = 'StockReconciliation';

  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final String? referenceId;
  final String? referenceIdType;
  final int? physicalCount;
  final int? calculatedCount;
  final String? commentsOnReconciliation;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final DateTime dateOfReconciliationTime;
  final StockReconciliationAdditionalFields? additionalFields;

  StockReconciliationModel({
    this.additionalFields,
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.physicalCount,
    this.calculatedCount,
    this.commentsOnReconciliation,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    required int dateOfReconciliation,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): dateOfReconciliationTime = DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
      super();

  int  get dateOfReconciliation => dateOfReconciliationTime.millisecondsSinceEpoch;
  

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
      id: Value(id),
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      physicalCount: Value(physicalCount),
      calculatedCount: Value(calculatedCount),
      commentsOnReconciliation: Value(commentsOnReconciliation),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      dateOfReconciliation: Value(dateOfReconciliation),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationAdditionalFields extends AdditionalFields with StockReconciliationAdditionalFieldsMappable {
  StockReconciliationAdditionalFields({
    super.schema = 'StockReconciliation',
    required super.version,
    super.fields,
  });
}

