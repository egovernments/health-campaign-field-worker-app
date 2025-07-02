import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';

class SideEffectLocalRepository
    extends LocalRepository<SideEffectModel, SideEffectSearchModel> {
  SideEffectLocalRepository(
    super.sql,
    super.opLogManager,
  );

  void listenToChanges({
    required SideEffectSearchModel query,
    required void Function(List<SideEffectModel> data) listener,
  }) async {
    return retryLocalCallOperation(() async {
      final select = sql.select(sql.sideEffect).join([])
        ..where(
          buildOr([
            if (query.id != null)
              sql.sideEffect.id.isIn(
                query.id!,
              ),
          ]),
        );

      select.watch().listen((results) {
        final data = results
            .map((e) {
              final sideEffect = e.readTableOrNull(sql.sideEffect);
              if (sideEffect == null) return null;

              return SideEffectModel(
                id: sideEffect.id,
                clientReferenceId: sideEffect.clientReferenceId,
                taskClientReferenceId: sideEffect.taskClientReferenceId,
                reAttempts: sideEffect.reAttempts,
                rowVersion: sideEffect.rowVersion,
                tenantId: sideEffect.tenantId,
                isDeleted: sideEffect.isDeleted,
              );
            })
            .whereNotNull()
            .where((element) => element.isDeleted != true)
            .toList();

        listener(data);
      });
    });
  }

  @override
  FutureOr<List<SideEffectModel>> search(
    SideEffectSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation(() async {
      final selectQuery = sql.select(sql.sideEffect).join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              if (query.clientReferenceId != null)
                sql.sideEffect.clientReferenceId.isIn(
                  query.clientReferenceId!,
                ),
              if (query.taskClientReferenceId != null)
                sql.sideEffect.taskClientReferenceId.isIn(
                  query.taskClientReferenceId!,
                ),
              if (userId != null)
                sql.sideEffect.auditCreatedBy.equals(
                  userId,
                ),
            ])))
          .get();

      return results
          .map((e) {
            final sideEffect = e.readTableOrNull(sql.sideEffect);
            if (sideEffect == null) return null;

            return SideEffectModel(
              id: sideEffect.id,
              clientReferenceId: sideEffect.clientReferenceId,
              rowVersion: sideEffect.rowVersion,
              tenantId: sideEffect.tenantId,
              isDeleted: sideEffect.isDeleted,
              taskClientReferenceId: sideEffect.taskClientReferenceId,
              auditDetails: AuditDetails(
                createdBy: sideEffect.auditCreatedBy!,
                createdTime: sideEffect.auditCreatedTime!,
                lastModifiedBy: sideEffect.auditModifiedBy,
                lastModifiedTime: sideEffect.auditModifiedTime,
              ),
              clientAuditDetails: sideEffect.clientCreatedTime == null ||
                      sideEffect.clientCreatedBy == null
                  ? null
                  : ClientAuditDetails(
                      createdTime: sideEffect.clientCreatedTime!,
                      createdBy: sideEffect.clientCreatedBy!,
                      lastModifiedBy: sideEffect.clientModifiedBy,
                      lastModifiedTime: sideEffect.clientModifiedTime,
                    ),
            );
          })
          .whereNotNull()
          .where((element) => element.isDeleted != true)
          .toList();
    });
  }

  @override
  FutureOr<void> create(
    SideEffectModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final sideEffectsCompanion = entity.companion;
      await sql.batch((batch) async {
        batch.insert(sql.sideEffect, sideEffectsCompanion);
        await super.create(entity);
      });
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<SideEffectModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final sideEffectCompanions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.sideEffect,
          sideEffectCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    SideEffectModel entity, {
    bool createOpLog = true,
  }) async {
    return retryLocalCallOperation(() async {
      final sideEffectsCompanion = entity.companion;

      await sql.batch((batch) {
        batch.update(
          sql.sideEffect,
          sideEffectsCompanion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  DataModelType get type => DataModelType.sideEffect;
}
