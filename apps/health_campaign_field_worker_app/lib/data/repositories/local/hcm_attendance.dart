import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/attendance_audit.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class AttendanceLocalRepository extends LocalRepository<
    HCMAttendanceRegisterModel, HCMAttendanceSearchModel> {
  AttendanceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<HCMAttendanceRegisterModel>> search(
    HCMAttendanceSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.attendanceRegister).join([]);

    final results = await (selectQuery..where(buildAnd([]))).get();

    return results
        .map((e) {
          final register = e.readTableOrNull(sql.attendanceRegister);
          if (register == null) return null;

          return HCMAttendanceRegisterModel(
            attendanceRegister: AttendancePackageRegisterModel(
              id: register.id.toString(),
              attendees: [],
              staff: [],
              name: register.name,
              registerNumber: register.registerNumber,
              tenantId: register.tenantId,
              referenceId: register.referenceId,
              serviceCode: register.serviceCode,
              status: register.status,
              startDate: register.startDate,
              endDate: register.endDate,
              auditDetails: AttendanceAuditDetails(
                createdBy: register.auditCreatedBy ?? '',
                createdTime: register.auditCreatedTime ?? 0,
              ),
            ),
          );
        })
        .whereNotNull()
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    HCMAttendanceRegisterModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    final referralCompanion = entity.companion;
    await sql.batch((batch) async {
      batch.insert(sql.attendanceRegister, referralCompanion);
      await super.create(entity, createOpLog: createOpLog);
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<HCMAttendanceRegisterModel> entities,
  ) async {
    final registerCompanions = entities.map((e) => e.companion).toList();

    await sql.batch((batch) async {
      batch.insertAll(
        sql.attendanceRegister,
        registerCompanions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  DataModelType get type => DataModelType.hcmAttendance;
}
