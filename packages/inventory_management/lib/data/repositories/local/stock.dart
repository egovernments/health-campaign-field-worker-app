import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/stock.dart';

class StockLocalRepository
    extends LocalRepository<StockModel, StockSearchModel> {
  StockLocalRepository(
      super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    StockModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    try {
      final stockCompanion = entity.companion.copyWith(
        transactionType: Value(entity.companion.transactionType.value),
      );
      await sql.batch((batch) {
        batch.insert(sql.stock, stockCompanion);
      });
    } catch (e) {
      print('Error in stock create: $e');
    }
    await super.create(entity);
  }

  @override
  FutureOr<List<StockModel>> search(
    StockSearchModel query, [
    String? userId,
  ]) async {
    var results = [];
    try {
      final selectQuery = sql
          .select(sql.stock)
          .join([]);
      results = await (selectQuery
            ..where(
              buildAnd(
                [
                  if (query.id != null)
                    sql.stock.id.equals(query.id!),
                  if (query.receiverId != null)
                    sql.stock.receiverId
                        .equals(query.receiverId!),
                  if (query.senderId != null)
                    sql.stock.senderId
                        .equals(query.senderId!),
                  if (query.productVariantId != null)
                    sql.stock.productVariantId.equals(
                      query.productVariantId!,
                    ),
                  if (query.clientReferenceId != null)
                    sql.stock.clientReferenceId.isIn(
                      query.clientReferenceId!,
                    ),
                  if (userId != null)
                    sql.stock.auditCreatedBy.equals(
                      userId,
                    ),
                  if (query.transactionReason != null)
                    query.transactionReason!.isEmpty
                        ? sql.stock.transactionReason
                            .isNull()
                        : sql.stock.transactionReason
                            .isIn(
                            query.transactionReason!.map((e) => e.index),
                          ),
                ],
              ),
            ))
          .get();
    } catch (e) {
      print('Error in stock search: $e');
    }
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
