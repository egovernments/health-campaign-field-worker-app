import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/unique_id_pool.dart';

class UniqueIdPoolLocalRepository
    extends LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> {
  UniqueIdPoolLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    UniqueIdPoolModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final uniqueIdCompanion = entity.companion;

      await sql.batch((batch) async {
        batch.insert(
          sql.uniqueIdPool,
          uniqueIdCompanion,
          mode: InsertMode.insertOrReplace,
        );
      });

      await super.create(entity);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<UniqueIdPoolModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final uniqueIdCompanions = entities.map((e) => e.companion).toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.uniqueIdPool,
          uniqueIdCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<List<UniqueIdPoolModel>> search(
      UniqueIdPoolSearchModel query) async {
    return retryLocalCallOperation<List<UniqueIdPoolModel>>(() async {
      final selectQuery = sql
          .select(
        sql.uniqueIdPool,
        distinct: true,
      )
          .join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              if (query.status != null)
                sql.uniqueIdPool.status.equals(query.status!)
            ])))
          .get();

      return results
          .map((row) {
            final uniqueIdPool = row.readTableOrNull(sql.uniqueIdPool);
            if (uniqueIdPool == null) return null;

            return UniqueIdPoolModel(
              id: uniqueIdPool.id!,
              status: uniqueIdPool.status!,
              userUuid: uniqueIdPool.userUuid,
              deviceUuid: uniqueIdPool.deviceUuid,
              tenantId: uniqueIdPool.tenantId,
              rowVersion: uniqueIdPool.rowVersion,
              additionalFields: uniqueIdPool.additionalFields != null
                  ? UniqueIdPoolAdditionalFieldsMapper.fromJson(
                      uniqueIdPool.additionalFields.toString())
                  : null,
              auditDetails: (uniqueIdPool.auditCreatedBy != null &&
                      uniqueIdPool.auditCreatedBy != null)
                  ? AuditDetails(
                      createdBy: uniqueIdPool.auditCreatedBy!,
                      createdTime: uniqueIdPool.auditCreatedTime!,
                      lastModifiedBy: uniqueIdPool.auditModifiedBy,
                      lastModifiedTime: uniqueIdPool.auditModifiedTime,
                    )
                  : null,
            );
          })
          .whereNotNull()
          .toList();
    });
  }

  @override
  FutureOr<void> update(
    UniqueIdPoolModel entity, {
    bool createOpLog = false,
  }) async {
    return retryLocalCallOperation(() async {
      final uniqueIdCompanion = entity.companion;

      await sql.batch((batch) {
        batch.update(
          sql.uniqueIdPool,
          uniqueIdCompanion,
          where: (table) => table.id.equals(
            entity.id,
          ),
        );
      });

      await super.update(entity, createOpLog: createOpLog);
    });
  }

  @override
  DataModelType get type => DataModelType.uniqueId;
}
