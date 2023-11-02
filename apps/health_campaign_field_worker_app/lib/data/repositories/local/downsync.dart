import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class DownsyncLocalRepository
    extends LocalRepository<DownsyncModel, DownsyncSearchModel> {
  DownsyncLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    DownsyncModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final downSyncCompanion = entity.companion;

    // final offset = entity.offset;
    // final limit = entity.limit;
    // final localityCode = entity.locality;
    // final totalCount = entity.totalCount;
    await sql.batch((batch) {
      batch.insert(
        sql.downsync,
        downSyncCompanion,
        mode: InsertMode.insertOrReplace,
      );
    });

    await super.create(entity, createOpLog: createOpLog);
  }

  @override
  DataModelType get type => DataModelType.project;

  @override
  FutureOr<List<DownsyncModel>> search(
    DownsyncSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.downsync).join([]);

    final results = await (selectQuery
          ..where(
            buildAnd([
              if (query.locality != null)
                sql.downsync.locality.equals(query.locality),
            ]),
          ))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.downsync);

      return DownsyncModel(
        locality: data.locality,
        offset: data.offset,
        limit: data.offset,
        lastSyncedTime: data.lastSyncedTime,
        totalCount: data.totalCount,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }
}
