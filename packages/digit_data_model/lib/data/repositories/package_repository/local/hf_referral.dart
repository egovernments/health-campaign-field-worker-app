import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:drift/drift.dart';

class HFReferralLocalRepository
    extends LocalRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HFReferralModel>> search(
    HFReferralSearchModel query, [
    String? userId,
  ]) async {
    throw UnimplementedError(
      'search() is not supported. Use the new search implementation.',
    );
  }

  @override
  FutureOr<void> create(
    HFReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion;
      await sql.batch((batch) async {
        batch.insert(sql.hFReferral, referralCompanion);
        await super.create(entity, createOpLog: createOpLog);
      });
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HFReferralModel> entities,
  ) async {
    return retryLocalCallOperation(() async {

      final referralCompanions = entities
          .map(
            (e) => e.companion.copyWith(
          name: Value(e.name),
        ),
      )
          .toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.hFReferral,
          referralCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  FutureOr<void> update(
    HFReferralModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.update,
  }) async {

    return retryLocalCallOperation(() async {
        final referralCompanion = entity.companion.copyWith(
          name: Value(entity.name),
        );

      await sql.batch((batch) {
        batch.update(
          sql.hFReferral,
          referralCompanion,
          where: (table) => table.clientReferenceId.equals(
            entity.clientReferenceId,
          ),
        );
      });

      await super.update(entity,
          createOpLog: createOpLog, dataOperation: dataOperation);
    });
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}
