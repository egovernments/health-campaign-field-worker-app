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
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime dateOfReconciliationTime;
  final DateTime createdAtTime;
  

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
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    required int dateOfReconciliation,
    required int createdAt,
    super.auditDetails,
  }): dateOfReconciliationTime = DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
      createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get dateOfReconciliation => dateOfReconciliationTime.millisecondsSinceEpoch;
  

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  StockReconciliationCompanion get companion {
    return StockReconciliationCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
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
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      dateOfReconciliation: Value(dateOfReconciliation),
      createdAt: Value(createdAt),
      );
  }
}
