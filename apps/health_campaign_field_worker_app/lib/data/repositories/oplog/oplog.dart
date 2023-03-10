import 'dart:async';

import 'package:isar/isar.dart';

import '../../../models/data_model.dart';
import '../../local_store/no_sql/schema/oplog.dart';

abstract class OpLogManager<T extends EntityModel> {
  final Isar isar;

  const OpLogManager(this.isar);

  FutureOr<void> createEntry(
    OpLogEntry<T> entry,
    DataModelType type,
  ) async =>
      await isar.writeTxn(() async => await isar.opLogs.put(
            OpLog()
              ..operation = entry.operation
              ..isSynced = false
              ..entityType = type
              ..createdOn = entry.dateCreated
              ..entityString = entry.entity.toJson(),
          ));

  FutureOr<List<OpLogEntry<T>>> getPendingSyncedEntries(
    DataModelType type,
  ) async {
    final entries = await isar.opLogs
        .filter()
        .isSyncedEqualTo(false)
        .entityTypeEqualTo(type)
        .findAll();

    return entries
        .map((e) => OpLogEntry<T>(
              Mapper.fromJson<T>(e.entityString),
              e.operation,
              dateCreated: e.createdOn,
              id: e.id,
              type: e.entityType,
              isSynced: e.isSynced,
            ))
        .toList();
  }

  FutureOr<void> markSynced(OpLogEntry<T> entry) async {
    final id = entry.id;
    if (id == null) return;
    await isar.opLogs.put(
      OpLog()
        ..id = id
        ..operation = entry.operation
        ..isSynced = entry.isSynced
        ..entityType = entry.type
        ..createdOn = entry.dateCreated
        ..syncedOn = DateTime.now()
        ..entityString = entry.entity.toJson(),
    );
  }
}

class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);
}

class HouseholdOpLogManager extends OpLogManager<HouseholdModel> {
  HouseholdOpLogManager(super.isar);
}

class HouseholdMemberOpLogManager extends OpLogManager<HouseholdMemberModel> {
  HouseholdMemberOpLogManager(super.isar);
}
