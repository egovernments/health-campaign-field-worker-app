import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class AttendanceLogsLocalRepository extends LocalRepository<
    HCMAttendanceLogModel, HCMAttendanceLogSearchModel> {
  AttendanceLogsLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HCMAttendanceLogModel>> search(
    HCMAttendanceLogSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.attendanceRegister).join([]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.individualId != null)
              sql.attendee.individualId.equals(
                query.individualId,
              ),
          ])))
        .get();

    return results
        .map((e) {
          final attendeeLog = e.readTableOrNull(sql.attendance);
          if (attendeeLog == null) return null;

          return HCMAttendanceLogModel(
            id: attendeeLog.id,
            registerId: attendeeLog.registerId,
            individualId: attendeeLog.individualId,
            status: attendeeLog.status,
            clientReferenceId: attendeeLog.clientReferenceId,
            time: attendeeLog.time,
            type: attendeeLog.type,
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
  }

  @override
  FutureOr<void> bulkCreate(
    List<HCMAttendanceLogModel> entities,
  ) async {
    final logsCompanions = entities.map((e) => e.companion).toList();

    await sql.batch((batch) async {
      batch.insertAll(
        sql.attendance,
        logsCompanions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  DataModelType get type => DataModelType.attendance;
}
