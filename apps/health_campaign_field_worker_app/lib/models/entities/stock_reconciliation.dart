// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class StockReconciliationSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? productVariantId;
  final List<String>? clientReferenceId;
  final bool? isDeleted;
  final DateTime? dateOfReconciliationTime;
  
  StockReconciliationSearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.clientReferenceId,
    this.isDeleted,
    int? dateOfReconciliation,
    super.boundaryCode,
  }): dateOfReconciliationTime = dateOfReconciliation == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
   super();

  int? get dateOfReconciliation => dateOfReconciliationTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true)
class StockReconciliationModel extends EntityModel {

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
  final String clientReferenceId;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime dateOfReconciliationTime;
  

  StockReconciliationModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.referenceId,
    this.referenceIdType,
    this.physicalCount,
    this.calculatedCount,
    this.commentsOnReconciliation,
    required this.clientReferenceId,
    this.isDeleted,
    this.rowVersion,
    required int dateOfReconciliation,
    super.auditDetails,
    super.additionalFields,
  }): dateOfReconciliationTime = DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
       super();

  int  get dateOfReconciliation => dateOfReconciliationTime.millisecondsSinceEpoch;
  

  StockReconciliationCompanion get companion {
    return StockReconciliationCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      physicalCount: Value(physicalCount),
      calculatedCount: Value(calculatedCount),
      commentsOnReconciliation: Value(commentsOnReconciliation),
      clientReferenceId: Value(clientReferenceId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      dateOfReconciliation: Value(dateOfReconciliation),
      );
  }
}
