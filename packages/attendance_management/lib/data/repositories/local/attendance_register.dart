import 'dart:async';
import 'dart:convert';

import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class AttendanceLocalRepository extends LocalRepository<AttendanceRegisterModel,
    AttendanceRegisterSearchModel> {
  AttendanceLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<AttendanceRegisterModel>> search(
    AttendanceRegisterSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<AttendanceRegisterModel>>(() async {
      String? targetTag;

      if (query.attendeeId != null) {
        final tagResult = await (sql.select(sql.attendee)
              ..where((tbl) => tbl.individualId.equals(query.attendeeId!)))
            .getSingleOrNull();

        targetTag = tagResult?.tag;
      }
      var attendanceRegisterQuery = sql.select(sql.attendanceRegister).join([
        if (query.attendeeId != null)
          leftOuterJoin(
            sql.attendee,
            sql.attendee.registerId.equalsExp(sql.attendanceRegister.id),
          ),
      ]);

      if (query.limit != null && query.offSet != null) {
        attendanceRegisterQuery.limit(query.limit!, offset: query.offSet);
      }

      attendanceRegisterQuery = attendanceRegisterQuery
        ..where(buildAnd([
          if (query.id != null) sql.attendanceRegister.id.equals(query.id!),
          if (query.referenceId != null &&
              query.attendeeId ==
                  null) // For fetching non mobile users as the register is created at different hierarchy
            sql.attendanceRegister.referenceId.equals(query.referenceId!),
          if (query.attendeeId != null)
            sql.attendee.individualId.equals(query.attendeeId!),
        ]));

      final attendanceRegisterResults = await attendanceRegisterQuery.get();
      final registerIds = attendanceRegisterResults.map((e) {
        return e.readTable(sql.attendanceRegister).id!;
      }).toList();

      var selectQuery = sql.select(sql.attendanceRegister).join([
        leftOuterJoin(
          sql.staff,
          sql.staff.registerId.equalsExp(sql.attendanceRegister.id),
        ),
        leftOuterJoin(
          sql.attendee,
          sql.attendee.registerId.equalsExp(sql.attendanceRegister.id),
        ),
      ]);

      selectQuery = selectQuery
        ..where(sql.attendanceRegister.id.isIn(registerIds));

      selectQuery = selectQuery
        ..where(buildAnd([
          if (query.id != null)
            sql.attendanceRegister.id.equals(
              query.id!,
            ),
          if (query.staffId != null && query.attendeeId == null)
            sql.staff.userId.equals(
              query.staffId!,
            ),
          if (query.referenceId != null && query.attendeeId == null)
            sql.attendanceRegister.referenceId.equals(
              query.referenceId!,
            ),
          if (targetTag != null) sql.attendee.tag.equals(targetTag),
        ]));

      final results = await selectQuery.get();

      final registerMap = <String, AttendanceRegisterModel>{};

      for (final e in results) {
        final register = e.readTableOrNull(sql.attendanceRegister);
        final staffs = e.readTableOrNull(sql.staff);
        final attendees = e.readTableOrNull(sql.attendee);
        if (register == null) continue;

        if (registerMap.containsKey(register.id)) {
          registerMap[register.id]!.attendees?.add(
                AttendeeModel(
                    id: attendees?.id.toString(),
                    registerId: attendees?.registerId,
                    tenantId: attendees?.tenantId,
                    individualId: attendees?.individualId,
                    enrollmentDate: attendees?.enrollmentDate,
                    denrollmentDate: attendees?.denrollmentDate,
                    tag: attendees?.tag),
              );

          registerMap[register.id]!.staff?.add(
                StaffModel(
                  id: staffs?.id,
                  registerId: staffs?.registerId,
                  tenantId: register.tenantId,
                  userId: staffs?.userId,
                  enrollmentDate: staffs?.enrollmentDate,
                  denrollmentDate: staffs?.denrollmentDate,
                ),
              );
        } else {
          registerMap[register.id.toString()] = AttendanceRegisterModel(
            id: register.id.toString(),
            attendees: attendees == null
                ? null
                : [
                    AttendeeModel(
                        id: attendees.id.toString(),
                        registerId: attendees.registerId,
                        tenantId: attendees.tenantId,
                        individualId: attendees.individualId,
                        enrollmentDate: attendees.enrollmentDate,
                        denrollmentDate: attendees.denrollmentDate,
                        tag: attendees.tag),
                  ],
            staff: staffs == null
                ? null
                : [
                    StaffModel(
                      id: staffs.id,
                      registerId: staffs.registerId,
                      tenantId: register.tenantId,
                      userId: staffs.userId,
                      enrollmentDate: staffs.enrollmentDate,
                      denrollmentDate: staffs.denrollmentDate,
                    ),
                  ],
            name: register.name,
            registerNumber: register.registerNumber,
            tenantId: register.tenantId,
            referenceId: register.referenceId,
            serviceCode: register.serviceCode,
            status: register.status,
            startDate: register.startDate,
            endDate: register.endDate,
            additionalDetails: register.additionalFields == null
                ? null
                : jsonDecode(register.additionalFields!.toString()),
            auditDetails: AuditDetails(
              createdBy: register.auditCreatedBy ?? '',
              createdTime: register.auditCreatedTime ?? 0,
            ),
          );
        }
      }
      final uniqueTasks = registerMap.values.toList();

      return uniqueTasks.where((element) => element.isDeleted != true).toList();
    });
  }

  @override
  FutureOr<void> create(
    AttendanceRegisterModel entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      final referralCompanion = entity.companion;
      await sql.batch((batch) async {
        batch.insert(sql.attendanceRegister, referralCompanion);
        await super.create(entity, createOpLog: createOpLog);
      });
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<AttendanceRegisterModel> entities,
  ) async {
    return retryLocalCallOperation(() async {
      final registerCompanions = entities.map((e) => e.companion).toList();

      final staffList = entities
          .map((e) => e.staff?.map((a) {
                return StaffCompanion(
                  id: Value(a.id),
                  tenantId: Value(a.tenantId.toString()),
                  userId: Value(a.userId.toString()),
                  registerId: Value(a.registerId.toString()),
                  enrollmentDate: Value(a.enrollmentDate),
                  denrollmentDate: Value(a.denrollmentDate),
                );
              }).toList())
          .toList();

      final staffCompanions = staffList.expand((e) => [e?[0]]).toList();

      final attendeeList = entities
          .map((e) => e.attendees?.map((a) {
                return AttendeeCompanion(
                    id: Value(a.id),
                    individualId: Value(a.individualId.toString()),
                    tenantId: Value(a.tenantId.toString()),
                    registerId: Value(a.registerId.toString()),
                    enrollmentDate: Value(a.enrollmentDate),
                    denrollmentDate: Value(a.denrollmentDate),
                    tag: Value(a.tag));
              }).toList())
          .toList();

      final attendeeCompanions = attendeeList
          .expand((e) => e ?? [])
          .cast<Insertable<AttendeeData>>()
          .toList();

      await sql.batch((batch) async {
        batch.insertAll(
          sql.attendanceRegister,
          registerCompanions,
          mode: InsertMode.insertOrReplace,
        );

        if (staffCompanions.isNotEmpty) {
          batch.insertAll(
            sql.staff,
            staffCompanions.whereNotNull().toList(),
            mode: InsertMode.insertOrReplace,
          );
        }

        if (attendeeCompanions.isNotEmpty) {
          batch.insertAll(
            sql.attendee,
            attendeeCompanions,
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  @override
  DataModelType get type => DataModelType.attendanceRegister;
}
