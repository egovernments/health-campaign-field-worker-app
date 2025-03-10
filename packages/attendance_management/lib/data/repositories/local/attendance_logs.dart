import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/attendance_log.dart';

class AttendanceLogsLocalRepository
    extends LocalRepository<AttendanceLogModel, AttendanceLogSearchModel> {
  AttendanceLogsLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<AttendanceLogModel>> search(
    AttendanceLogSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<AttendanceLogModel>>(() async {
      final selectQuery = sql.select(sql.attendance).join([]);

      final results = await (selectQuery
            ..where(buildAnd([
              if (query.individualId != null)
                sql.attendance.individualId.equals(
                  query.individualId!,
                ),
              if (query.registerId != null)
                sql.attendance.registerId.equals(
                  query.registerId!,
                ),
              if (query.uploadToServer != null)
                sql.attendance.uploadToServer.equals(
                  query.uploadToServer!,
                ),
            ])))
          .get();

      return results
          .map((e) {
            final attendeeLog = e.readTableOrNull(sql.attendance);
            if (attendeeLog == null) return null;

            return AttendanceLogModel(
              id: attendeeLog.id,
              registerId: attendeeLog.registerId,
              individualId: attendeeLog.individualId,
              status: attendeeLog.status,
              clientReferenceId: attendeeLog.clientReferenceId,
              time: attendeeLog.time,
              type: attendeeLog.type,
              uploadToServer: attendeeLog.uploadToServer,
              additionalDetails: attendeeLog.additionalFields != null
                  ? jsonDecode(attendeeLog.additionalFields!.toString())
                  : null,
              auditDetails: AuditDetails(
                createdTime: attendeeLog.auditCreatedTime!,
                createdBy: attendeeLog.auditCreatedBy!,
                lastModifiedBy: attendeeLog.auditModifiedBy,
                lastModifiedTime: attendeeLog.auditModifiedTime,
              ),
              clientAuditDetails: ClientAuditDetails(
                createdTime: attendeeLog.clientCreatedTime!,
                createdBy: attendeeLog.clientCreatedBy!,
                lastModifiedBy: attendeeLog.clientModifiedBy,
                lastModifiedTime: attendeeLog.clientModifiedTime,
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
    AttendanceLogModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final logCompanion = entity.companion;

      await sql.batch((batch) async {
        batch.insert(
          sql.attendance,
          logCompanion,
          mode: InsertMode.insertOrReplace,
        );
      });

      await super.create(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<AttendanceLogModel> entities,{
        InsertMode mode = InsertMode.insertOrReplace, // Default to insertOrReplace
  }) async {
    return retryLocalCallOperation(() async {
      final logsCompanions = entities
          .map((e) => e.companion.copyWith(
                uploadToServer: const Value(true),
              ))
          .toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.attendance,
          logsCompanions,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  @override
  DataModelType get type => DataModelType.attendance;
}
