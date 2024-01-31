import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_repository.dart';
import '../models/data_model.dart';
import '../utils/utils.dart';
import 'sync/sync.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final LocalRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>?
      attendanceLocalRepository;
  final LocalRepository<IndividualModel, IndividualSearchModel>?
      individualLocalRepository;
  final LocalRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>?
      attendanceLogLocalRepository;
  final String? userId;
  BuildContext context;
  HCMAttendanceBloc({
    this.attendanceLocalRepository,
    this.individualLocalRepository,
    this.attendanceLogLocalRepository,
    this.userId,
    required this.context
  });

  late Function(List<AttendancePackageRegisterModel> registers)
      _registersLoaded;
  // late SearchAttendanceLog _attendeesLoaded;

  @override
  void getAttendanceRegisters(
    Function(List<AttendancePackageRegisterModel> registers)
        attendanceRegisters,
  ) {
    _registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded() async {
    final registers = await attendanceLocalRepository?.search(
      HCMAttendanceSearchModel(staffId: userId),
    );

    if (registers != null) {
      final List<AttendancePackageRegisterModel> attendanceRegisters =
          await Future.wait(registers.map((e) async {
        final individualList = await individualLocalRepository?.search(
          IndividualSearchModel(
            id: e.attendanceRegister.attendees!
                .map((a) => a.individualId!)
                .toList(),
          ),
        );
        final attendeeList = e.attendanceRegister.attendees
            ?.map(
              (a) => a.copyWith(
                name: individualList
                    ?.where((i) => i.id == a.individualId)
                    .first
                    .name
                    ?.givenName,
                individualNumber: individualList
                    ?.where((i) => i.id == a.individualId)
                    .first
                    .individualId,
              ),
            )
            .toList();

        return e.attendanceRegister.copyWith(attendees: attendeeList);
      }));

      _registersLoaded(
        attendanceRegisters,
      );
    } else {
      _registersLoaded(
        [],
      );
    }
  }

  @override
  void searchAttendanceLog(
    SearchAttendanceLog searchAttendanceLog,
  ) async {
    final attendanceLogs = await attendanceLogLocalRepository?.search(
      HCMAttendanceLogSearchModel(
        registerId: searchAttendanceLog.registerId,
      ),
    );
    final filteredLogs = attendanceLogs
        ?.where((log) {
          final logTime = DateTime.fromMillisecondsSinceEpoch(log.time!);
          final logDay = DateTime(logTime.year, logTime.month, logTime.day)
              .millisecondsSinceEpoch;
          final currentTime = DateTime.fromMillisecondsSinceEpoch(
            searchAttendanceLog.currentDate,
          );
          final currentDay =
              DateTime(currentTime.year, currentTime.month, currentTime.day)
                  .millisecondsSinceEpoch;

          return logDay == currentDay;
        })
        .map((a) => AttendanceLogModel(
              registerId: a.registerId,
              tenantId: a.tenantId,
              status: a.status,
              time: a.time,
              individualId: a.individualId,
              id: a.id,
              type: a.type,
            ))
        .toList();
    searchAttendanceLog.onLogLoaded(filteredLogs ?? []);
  }

  @override
  void markIndividualAttendance(
    MarkIndividualAttendance markIndividualAttendance,
  ) {
    // TODO: implement markIndividualAttendance
  }

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {
    // TODO: implement submitAttendanceDetails
    final hcmAttendanceLogs = attendanceLogs.attendanceLogs
        .map((e) => HCMAttendanceLogModel(
              rowVersion: 1,
              registerId: e.registerId,
              individualId: e.individualId,
              type: e.type,
              time: e.time,
              status: e.status,
              tenantId: e.tenantId,
              clientReferenceId: IdGen.i.identifier,
              uploadToServer: attendanceLogs.createOplog,
              clientAuditDetails: ClientAuditDetails(
                createdBy: userId.toString(),
                createdTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedBy: userId.toString(),
              ),
              auditDetails: AuditDetails(
                createdBy: userId.toString(),
                createdTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedBy: userId.toString(),
              ),
            ))
        .toList();
    final groupedIndividuals =
        hcmAttendanceLogs.groupListsBy((ele) => ele.individualId);

    for (final log in groupedIndividuals.entries) {
      await attendanceLogLocalRepository?.create(
        log.value.first,
        createOpLog: (attendanceLogs.createOplog ?? false) &&
            (log.value.first.time != log.value.last.time),
      );
      await attendanceLogLocalRepository?.create(
        hcmAttendanceLogs.where((l) => l.individualId == log.key).last,
        createOpLog: (attendanceLogs.createOplog ?? false) &&
            (log.value.first.time != log.value.last.time),
      );
    }
  }

  @override
  void callSyncMethod() {
    context
        .read<SyncBloc>()
        .add(SyncRefreshEvent(userId!));
  }
}
