import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

class StockReconciliationLocalRepository extends LocalRepository<
    StockReconciliationModel, StockReconciliationSearchModel> {
  StockReconciliationLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockReconciliationModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final stockReconCompanion = entity.companion;
      await sql.batch((batch) {
        batch.insert(sql.stockReconciliation, stockReconCompanion);
      });
      await super.create(entity);
    });
  }

  @override
  FutureOr<List<StockReconciliationModel>> search(
    StockReconciliationSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation(() async {
      final selectQuery = sql.select(sql.stockReconciliation).join([]);
      final results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.facilityId != null)
                    sql.stockReconciliation.facilityId
                        .equals(query.facilityId!),
                  if (query.productVariantId != null)
                    sql.stockReconciliation.productVariantId
                        .equals(query.productVariantId!),
                  if (query.clientReferenceId != null)
                    sql.stockReconciliation.id.equals(
                      query.id!,
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
          rowVersion: data.rowVersion,
          additionalFields: data.additionalFields == null
              ? null
              : StockReconciliationAdditionalFieldsMapper.fromJson(
                  data.additionalFields!,
                ),
          isDeleted: data.isDeleted,
        );
      }).toList();
    });
  }

  @override
  FutureOr<void> update(
    StockReconciliationModel entity, {
    bool createOpLog = true,
        DataOperation dataOperation = DataOperation.update,
  }) async {
    return retryLocalCallOperation(() async {
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
    });
  }

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}
