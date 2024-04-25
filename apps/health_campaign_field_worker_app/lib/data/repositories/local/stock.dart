import 'dart:async';

import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/stock.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class StockLocalRepository
    extends LocalRepository<HcmStockModel, HcmStockSearchModel> {
  StockLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    HcmStockModel entity, {
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
  FutureOr<List<HcmStockModel>> search(
    HcmStockSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.stock).join([]);
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.stock!.id != null)
                  sql.stock.id.equals(query.stock!.id!),
                if (query.stock!.receiverId != null)
                  sql.stock.receiverId.equals(query.stock!.receiverId!),
                if (query.stock!.senderId != null)
                  sql.stock.senderId.equals(query.stock!.senderId!),
                if (query.stock!.productVariantId != null)
                  sql.stock.productVariantId
                      .equals(query.stock!.productVariantId!),
                if (query.stock!.clientReferenceId != null)
                  sql.stock.clientReferenceId
                      .isIn(query.stock!.clientReferenceId!),
                if (userId != null)
                  sql.stock.auditCreatedBy.equals(
                    userId,
                  ),
                if (query.stock!.transactionReason != null)
                  query.stock!.transactionReason!.isEmpty
                      ? sql.stock.transactionReason.isNull()
                      : sql.stock.transactionReason.isIn(
                          query.stock!.transactionReason!.map((e) => e.index),
                        ),
                if (query.stock!.transactionType != null)
                  query.stock!.transactionType!.isEmpty
                      ? sql.stock.transactionType.isNull()
                      : sql.stock.transactionType.isIn(
                          query.stock!.transactionType!.map((e) => e.index),
                        ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.stock);

      final createdBy = data.auditCreatedBy;
      final createdTime = data.auditCreatedTime;

      return HcmStockModel(
        stock: StockModel(
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
          rowVersion: data.rowVersion,
        ),
        isDeleted: data.isDeleted,
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
    HcmStockModel entity, {
    bool createOpLog = true,
  }) async {
    final stockCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.stock,
        stockCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.stock!.clientReferenceId!,
        ),
      );
    });

    return super.update(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.stock;
}
