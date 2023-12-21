import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class StockLocalRepository
    extends LocalRepository<StockModel, StockSearchModel> {
  StockLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final stockCompanion = entity.companion.copyWith(
      transactionType: Value(entity.companion.transactionType.value),
    );
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
                if (query.receiverId != null)
                  sql.stock.receiverId.equals(query.receiverId),
                if (query.senderId != null)
                  sql.stock.senderId.equals(query.senderId),
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
        receiverId: data.receiverId,
        senderId: data.senderId,
        receiverType: data.receiverType,
        senderType: data.senderType,
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

  @override
  DataModelType get type => DataModelType.stock;
}
