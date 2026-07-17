import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class FaceAuthEventOpLogManager extends OpLogManager<FaceAuthEventModel> {
  FaceAuthEventOpLogManager(super.isar);

  @override
  FaceAuthEventModel applyServerGeneratedIdToEntity(
    FaceAuthEventModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(FaceAuthEventModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(FaceAuthEventModel entity) {
    return entity.id;
  }

  @override
  int? getRowVersion(FaceAuthEventModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(FaceAuthEventModel entity) =>
      entity.nonRecoverableError;

  @override
  Future<List<OpLogEntry<FaceAuthEventModel>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final allFaceAuthEvents = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .findAll();
    final allOplogsEverywhere = await isar.opLogs.where().findAll();
    debugPrint(
      'FaceAuthEventOpLog: getPendingUpSync queriedCreatedBy=$createdBy '
      'totalOplogsForType=${allFaceAuthEvents.length} '
      'totalOplogsAll=${allOplogsEverywhere.length}',
    );
    final typeCounts = <String, int>{};
    for (final o in allOplogsEverywhere) {
      typeCounts[o.entityType.name] =
          (typeCounts[o.entityType.name] ?? 0) + 1;
    }
    debugPrint('FaceAuthEventOpLog: oplog type breakdown=$typeCounts');
    for (final o in allFaceAuthEvents) {
      debugPrint(
        'FaceAuthEventOpLog: oplog id=${o.id} op=${o.operation} '
        'createdBy=${o.createdBy} syncedUp=${o.syncedUp} '
        'syncedDown=${o.syncedDown} serverId=${o.serverGeneratedId}',
      );
    }

    final createEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final updateEntries = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .sortByCreatedAt()
        .findAll();

    final allEntries = [...createEntries, ...updateEntries];
    debugPrint(
      'FaceAuthEventOpLog: matched create=${createEntries.length} '
      'update=${updateEntries.length} total=${allEntries.length}',
    );

    final entriesList = allEntries.map((e) {
      return OpLogEntry.fromOpLog<FaceAuthEventModel>(e);
    }).toList();

    return entriesList;
  }
}
