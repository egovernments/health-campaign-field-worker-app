import 'package:dart_mappable/dart_mappable.dart';

import '../../data/local_store/no_sql/schema/oplog.dart' hide AdditionalId;
import '../../data/local_store/no_sql/schema/oplog.dart' as o show AdditionalId;
import '../data_model.dart';

part 'oplog_entry.mapper.dart';

@MappableClass()
class OpLogEntry<T extends EntityModel> with OpLogEntryMappable {
  final int? id;
  final T entity;
  final DataModelType type;
  final DataOperation operation;
  final bool syncedUp;
  final bool syncedDown;
  final String createdBy;
  final DateTime createdAt;
  final DateTime? syncedUpOn;
  final DateTime? syncedDownOn;
  final String? serverGeneratedId;
  final String? clientReferenceId;
  final List<AdditionalId> additionalIds;
  final int syncDownRetryCount;
  final int rowVersion;
  final bool nonRecoverableError;

  const OpLogEntry(
    this.entity,
    this.operation, {
    this.id,
    required this.createdAt,
    required this.createdBy,
    required this.type,
    this.syncedUp = false,
    this.syncedDown = false,
    this.syncedUpOn,
    this.syncedDownOn,
    this.serverGeneratedId,
    this.clientReferenceId,
    this.additionalIds = const [],
    this.syncDownRetryCount = 0,
    this.rowVersion = 1,
    this.nonRecoverableError = false,
  });

  static OpLogEntry<T> fromOpLog<T extends EntityModel>(OpLog e) {
    return OpLogEntry<T>(
      e.getEntity<T>(),
      e.operation,
      createdBy: e.createdBy,
      createdAt: e.createdAt,
      type: e.entityType,
      serverGeneratedId: e.serverGeneratedId,
      id: e.id,
      clientReferenceId: e.clientReferenceId,
      nonRecoverableError: e.nonRecoverableError,
      syncedDown: e.syncedDown,
      syncedDownOn: e.syncedDownOn,
      syncedUp: e.syncedUp,
      syncedUpOn: e.syncedUpOn,
      additionalIds: e.additionalIds
          .map((e) => AdditionalId(idType: e.idType, id: e.id))
          .toList(),
      syncDownRetryCount: e.syncDownRetryCount,
      rowVersion: e.rowVersion,
    );
  }

  OpLog get oplog {
    OpLog oplog = OpLog()
      ..entityString = entity.toJson()
      ..entityType = type
      ..operation = operation
      ..serverGeneratedId = serverGeneratedId
      ..clientReferenceId = clientReferenceId
      ..syncedUpOn = syncedUpOn
      ..syncedDownOn = syncedDownOn
      ..createdBy = createdBy
      ..createdAt = createdAt
      ..syncedUp = syncedUp
      ..nonRecoverableError = nonRecoverableError
      ..additionalIds = additionalIds
          .map((e) => o.AdditionalId()
            ..id = e.id
            ..idType = e.idType)
          .toList()
      ..syncedDown = syncedDown
      ..syncDownRetryCount = syncDownRetryCount
      ..rowVersion = rowVersion;

    if (id != null) {
      oplog.id = id!;
    }

    return oplog;
  }
}

@MappableClass()
class AdditionalId with AdditionalIdMappable {
  final String idType;
  final String id;

  const AdditionalId({
    required this.idType,
    required this.id,
  });
}

@MappableEnum()
enum DataOperation {
  create,
  search,
  update,
  delete,
  singleCreate,
}

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum ApiOperation {
  login,
  create,
  search,
  update,
  delete,
  bulkCreate,
  bulkUpdate,
  bulkDelete,
  singleCreate
}
