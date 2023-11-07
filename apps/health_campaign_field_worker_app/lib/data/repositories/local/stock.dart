import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/stock_base.dart';

class StockLocalRepository extends StockLocalBaseRepository {
  StockLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final stockCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.stock, stockCompanion);
    });
    await super.create(entity);
  }

  @override
  FutureOr<List<StockModel>> search(
    StockSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.stock).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.id != null) sql.stock.id.equals(query.id),
                if (query.facilityId != null)
                  sql.stock.facilityId.equals(query.facilityId),
                if (query.productVariantId != null)
                  sql.stock.productVariantId.equals(query.productVariantId),
                if (query.clientReferenceId != null)
                  sql.stock.clientReferenceId.isIn(query.clientReferenceId!),
                if (userId != null)
                  sql.stock.auditCreatedBy.equals(
                    userId,
                  ),
                if (query.transactionReason != null)
                  query.transactionReason!.isEmpty
                      ? sql.stock.transactionReason.isNull()
                      : sql.stock.transactionReason.isIn(
                          query.transactionReason!.map((e) => e.index),
                        ),
                if (query.transactionType != null)
                  query.transactionType!.isEmpty
                      ? sql.stock.transactionType.isNull()
                      : sql.stock.transactionType.isIn(
                          query.transactionType!.map((e) => e.index),
                        ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.stock);

      final createdBy = data.auditCreatedBy;
      final createdTime = data.auditCreatedTime;

      return StockModel(
        id: data.id,
        tenantId: data.tenantId,
        facilityId: data.facilityId,
        productVariantId: data.productVariantId,
        referenceId: data.referenceId,
        referenceIdType: data.referenceIdType,
        transactionType: data.transactionType,
        transactionReason: data.transactionReason,
        transactingPartyId: data.transactingPartyId,
        transactingPartyType: data.transactingPartyType,
        quantity: data.quantity,
        waybillNumber: data.waybillNumber,
        clientReferenceId: data.clientReferenceId,
        isDeleted: data.isDeleted,
        rowVersion: data.rowVersion,
        dateOfEntry: data.dateOfEntry,
        auditDetails: createdTime == null || createdBy == null
            ? null
            : AuditDetails(createdTime: createdTime, createdBy: createdBy),
        clientAuditDetails: createdTime == null || createdBy == null
            ? null
            : ClientAuditDetails(
                createdTime: data.clientCreatedTime!,
                createdBy: data.clientCreatedBy!,
                lastModifiedBy: data.clientModifiedBy,
                lastModifiedTime: data.clientModifiedTime,
              ),
      );
    }).toList();
  }

  @override
  FutureOr<void> update(
    StockModel entity, {
    bool createOpLog = true,
  }) async {
    final stockCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.stock,
        stockCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.update(entity, createOpLog: createOpLog);
  }
}
