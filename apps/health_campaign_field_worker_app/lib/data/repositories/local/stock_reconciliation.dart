import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class StockReconciliationLocalRepository extends LocalRepository<
    StockReconciliationModel, StockReconciliationSearchModel> {
  StockReconciliationLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockReconciliationModel entity, {
    bool createOpLog = true,
  }) async {
    final stockReconCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.stockReconciliation, stockReconCompanion);
    });
    await super.create(entity);
  }

  @override
  FutureOr<List<StockReconciliationModel>> search(
    StockReconciliationSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.stockReconciliation).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.clientReferenceId != null)
              sql.stockReconciliation.id.equals(
                query.id,
              ),
            if (query.productVariantId != null)
              sql.stockReconciliation.productVariantId.equals(
                query.productVariantId!,
              ),
            if (query.facilityId != null)
              sql.stockReconciliation.facilityId.equals(
                query.facilityId!,
              ),
          ])))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.stockReconciliation);

      return StockReconciliationModel(
        id: data.id,
        createdBy: data.createdBy,
        createdAt: data.createdAt,
        tenantId: data.tenantId,
        facilityId: data.facilityId,
        productVariantId: data.productVariantId,
        referenceId: data.referenceId,
        referenceIdType: data.referenceIdType,
        physicalCount: data.physicalCount,
        calculatedCount: data.calculatedCount,
        commentsOnReconciliation: data.commentsOnReconciliation,
        dateOfReconciliation: data.dateOfReconciliation,
        clientReferenceId: data.clientReferenceId,
        isDeleted: data.isDeleted,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}
