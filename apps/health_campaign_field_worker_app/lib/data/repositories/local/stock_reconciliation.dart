import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/stock_reconciliation_base.dart';

class StockReconciliationLocalRepository
    extends StockReconciliationLocalBaseRepository {
  StockReconciliationLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockReconciliationModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final stockReconCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.stockReconciliation, stockReconCompanion);
    });
    await super.create(entity);
  }

  @override
  FutureOr<List<StockReconciliationModel>> search(
    StockReconciliationSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.stockReconciliation).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.facilityId != null)
                  sql.stockReconciliation.facilityId.equals(query.facilityId),
                if (query.productVariantId != null)
                  sql.stockReconciliation.productVariantId
                      .equals(query.productVariantId),
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
                if (userId != null)
                  sql.stockReconciliation.auditCreatedBy.equals(
                    userId,
                  ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.stockReconciliation);

      return StockReconciliationModel(
        id: data.id,
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
        additionalFields: data.additionalFields == null
            ? null
            : Mapper.fromJson<StockReconciliationAdditionalFields>(
                data.additionalFields!,
              ),
        isDeleted: data.isDeleted,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }

  @override
  FutureOr<void> update(
    StockReconciliationModel entity, {
    bool createOpLog = true,
  }) async {
    final stockReconciliationCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.stockReconciliation,
        stockReconciliationCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.update(entity, createOpLog: createOpLog);
  }
}
