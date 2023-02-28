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
  
  StockReconciliationSearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.productVariantId,
    this.clientReferenceId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
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
  final DateTime? dateOfReconciliation;
  final String clientReferenceId;
  final bool? isDeleted;
  final int? rowVersion;
  

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
    int? dateOfReconciliation,
    required this.clientReferenceId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
  })  : dateOfReconciliation = dateOfReconciliation == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
        super();

  int? get dateOfReconciliationTime =>
      dateOfReconciliation?.millisecondsSinceEpoch;

  StockReconciliationCompanion get companion {
    return StockReconciliationCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      facilityId: Value(facilityId),
      productVariantId: Value(productVariantId),
      referenceId: Value(referenceId),
      referenceIdType: Value(referenceIdType),
      physicalCount: Value(physicalCount),
      calculatedCount: Value(calculatedCount),
      commentsOnReconciliation: Value(commentsOnReconciliation),
      dateOfReconciliation: Value(dateOfReconciliationTime),
      clientReferenceId: Value(clientReferenceId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
