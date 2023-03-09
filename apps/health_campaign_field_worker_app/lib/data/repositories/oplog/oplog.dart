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

  FutureOr<List<OpLogEntry<T>>> getSyncedCreateEntries(
    DataModelType type,
  ) async {
    final entries = await isar.opLogs
        .filter()
        .isSyncedEqualTo(true)
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
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
        .where((element) => element.id != null)
        .toList();
  }

  FutureOr<void> update(OpLogEntry<EntityModel> entry) async {
    final id = entry.id;
    if (id == null) return;
    await isar.writeTxn(() async {
      await isar.opLogs.put(
        OpLog()
          ..id = id
          ..operation = entry.operation
          ..isSynced = entry.isSynced
          ..entityType = entry.type
          ..createdOn = entry.dateCreated
          ..syncedOn = entry.syncedOn
          ..entityString = entry.entity.toJson(),
      );
    });
  }
}

class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);
}

class HouseholdOpLogManager extends OpLogManager<HouseholdModel> {
  HouseholdOpLogManager(super.isar);
}

class FacilityOpLogManager extends OpLogManager<FacilityModel> {
  FacilityOpLogManager(super.isar);
}

class HouseholdMemberOpLogManager extends OpLogManager<HouseholdMemberModel> {
  HouseholdMemberOpLogManager(super.isar);
}

class ProjectBeneficiaryOpLogManager
    extends OpLogManager<ProjectBeneficiaryModel> {
  ProjectBeneficiaryOpLogManager(super.isar);
}

class ProjectFacilityOpLogManager extends OpLogManager<ProjectFacilityModel> {
  ProjectFacilityOpLogManager(super.isar);
}

class TaskOpLogManager extends OpLogManager<TaskModel> {
  TaskOpLogManager(super.isar);
}

class ProjectStaffOpLogManager extends OpLogManager<ProjectStaffModel> {
  ProjectStaffOpLogManager(super.isar);
}

class ProjectOpLogManager extends OpLogManager<ProjectModel> {
  ProjectOpLogManager(super.isar);
}

class StockOpLogManager extends OpLogManager<StockModel> {
  StockOpLogManager(super.isar);
}

class StockReconciliationOpLogManager
    extends OpLogManager<StockReconciliationModel> {
  StockReconciliationOpLogManager(super.isar);
}
