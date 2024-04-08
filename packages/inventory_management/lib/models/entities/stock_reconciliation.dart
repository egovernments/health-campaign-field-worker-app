// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'stock_reconciliation.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationSearchModel with StockReconciliationSearchModelMappable {
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
  }): dateOfReconciliationTime = dateOfReconciliation == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
        super();

  int? get dateOfReconciliation => dateOfReconciliationTime?.millisecondsSinceEpoch;

}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class StockReconciliationModel with StockReconciliationModelMappable {

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
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    required int dateOfReconciliation,
  }): dateOfReconciliationTime = DateTime.fromMillisecondsSinceEpoch(dateOfReconciliation),
        super();

  int  get dateOfReconciliation => dateOfReconciliationTime.millisecondsSinceEpoch;
}