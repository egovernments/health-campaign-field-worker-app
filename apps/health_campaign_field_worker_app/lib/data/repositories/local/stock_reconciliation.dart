import 'dart:async';

import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class StockReconciliationLocalRepository extends LocalRepository<
    HcmStockReconciliationModel, HcmStockReconciliationSearchModel> {
  StockReconciliationLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    HcmStockReconciliationModel entity, {
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
  FutureOr<List<HcmStockReconciliationModel>> search(
    HcmStockReconciliationSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.stockReconciliation).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.stockReconciliationSearchModel!.facilityId != null)
                  sql.stockReconciliation.facilityId.equals(
                      query.stockReconciliationSearchModel!.facilityId!),
                if (query.stockReconciliationSearchModel!.productVariantId !=
                    null)
                  sql.stockReconciliation.productVariantId.equals(
                      query.stockReconciliationSearchModel!.productVariantId!),
                if (query.stockReconciliationSearchModel!.clientReferenceId !=
                    null)
                  sql.stockReconciliation.id.equals(
                    query.stockReconciliationSearchModel!.id!,
                  ),
                if (query.stockReconciliationSearchModel!.productVariantId !=
                    null)
                  sql.stockReconciliation.productVariantId.equals(
                    query.stockReconciliationSearchModel!.productVariantId!,
                  ),
                if (query.stockReconciliationSearchModel!.facilityId != null)
                  sql.stockReconciliation.facilityId.equals(
                    query.stockReconciliationSearchModel!.facilityId!,
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

      return HcmStockReconciliationModel(
        stockReconciliation: StockReconciliationModel(
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
        ),
        additionalFields: data.additionalFields == null
            ? null
            : StockReconciliationAdditionalFieldsMapper.fromJson(
                data.additionalFields!,
              ),
        isDeleted: data.isDeleted,
      );
    }).toList();
  }

  @override
  FutureOr<void> update(
    HcmStockReconciliationModel entity, {
    bool createOpLog = true,
  }) async {
    final stockReconciliationCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.stockReconciliation,
        stockReconciliationCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.stockReconciliation!.clientReferenceId,
        ),
      );
    });

    return super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}
