import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import '../../../models/hf_referral_downsync/hf_referral_downsync.dart';

class HFReferralDownsyncLocalRepository
    extends LocalRepository<HFReferralDownsyncModel,
        HFReferralDownsyncSearchModel> {
  HFReferralDownsyncLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<void> create(
    HFReferralDownsyncModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final downSyncCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(
        sql.hFReferralDownsync,
        downSyncCompanion,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  FutureOr<void> update(
    HFReferralDownsyncModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.update,
  }) async {
    final downSyncCompanion = entity.companion;

    await sql.batch((batch) async {
      batch.update(
        sql.hFReferralDownsync,
        downSyncCompanion,
        where: (table) => table.locality.equals(
          entity.locality!,
        ),
      );
    });

    await super.update(entity, createOpLog: false);
  }

  @override
  DataModelType get type => DataModelType.hFReferral;

  @override
  FutureOr<List<HFReferralDownsyncModel>> search(
    HFReferralDownsyncSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.hFReferralDownsync).join([]);

    final results = await (selectQuery
          ..where(
            buildAnd([
              if (query.locality != null)
                sql.hFReferralDownsync.locality.equals(query.locality!),
            ]),
          ))
        .get();

    return results.map((e) {
      final data = e.readTable(sql.hFReferralDownsync);

      return HFReferralDownsyncModel(
        locality: data.locality,
        offset: data.offset,
        limit: data.offset,
        boundaryName: data.boundaryName,
        lastSyncedTime: data.lastSyncedTime,
        totalCount: data.totalCount,
        tenantId: data.tenantId,
        rowVersion: data.rowVersion,
      );
    }).toList();
  }
}
