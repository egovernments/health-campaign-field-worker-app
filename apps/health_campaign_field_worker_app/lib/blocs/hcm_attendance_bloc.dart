import 'package:attendance_management/blocs/attendance_listeners.dart';
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
  final String? projectId;
  BuildContext context;

  HCMAttendanceBloc({
    this.attendanceLocalRepository,
    this.individualLocalRepository,
    this.attendanceLogLocalRepository,
    this.userId,
    this.projectId,
    required this.context,
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
      HCMAttendanceSearchModel(staffId: userId, referenceId: projectId),
    );

    if (registers != null) {
      final List<AttendancePackageRegisterModel> attendanceRegisters =
          await Future.wait(registers.map((e) async {
        final registerCompletedLogs =
            await attendanceLogLocalRepository?.search(
          HCMAttendanceLogSearchModel(
            registerId: e.attendanceRegister.id,
            uploadToServer: true,
          ),
        );

        var list = generateDateList(
          e.attendanceRegister.startDate!,
          e.attendanceRegister.endDate!,
          registerCompletedLogs ?? [],
          e.attendanceRegister.additionalDetails?["sessions"] != 2,
        );

        var completedDaysCount =
            e.attendanceRegister.additionalDetails?["sessions"] == 2
                ? list.length ~/ 2
                : list.length;

        final individualList = await individualLocalRepository?.search(
          IndividualSearchModel(
            id: e.attendanceRegister.attendees
                ?.where((att) => (att.denrollmentDate == null ||
                    (att.denrollmentDate ??
                            DateTime.now().millisecondsSinceEpoch) >=
                        DateTime.now().millisecondsSinceEpoch))
                .map((a) => a.individualId!)
                .toList(),
          ),
        );
        final attendeeList = e.attendanceRegister.attendees
            ?.where((att) => (att.denrollmentDate == null ||
                (att.denrollmentDate ??
                        DateTime.now().millisecondsSinceEpoch) >=
                    DateTime.now().millisecondsSinceEpoch))
            .map(
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

        return e.attendanceRegister.copyWith(
          attendees: attendeeList,
          attendanceLog: list,
          completedDays: completedDaysCount,
        );
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
          final logTime =
              DateTime.fromMillisecondsSinceEpoch(log.attendance!.time!);
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
              registerId: a.attendance?.registerId,
              tenantId: a.attendance?.tenantId,
              status: a.attendance?.status,
              time: a.attendance?.time,
              individualId: a.attendance?.individualId,
              id: a.attendance?.id,
              type: a.attendance?.type,
              uploadToServer: a.attendance?.uploadToServer,
            ))
        .toList();
    searchAttendanceLog.onLogLoaded(filteredLogs ?? []);
  }

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {
    // TODO: implement submitAttendanceDetails
    final existingLogs = await attendanceLogLocalRepository?.search(
      HCMAttendanceLogSearchModel(
        registerId: attendanceLogs.attendanceLogs.first.registerId,
      ),
    );
    final hcmAttendanceLogs = attendanceLogs.attendanceLogs.map(
      (e) {
        final existingLog = existingLogs?.where(
          (ele) {
            return attendanceLogs.isSingleSession == true
                ? ele.attendanceLog?.individualId == e.individualId &&
                    ele.attendanceLog?.registerId == e.registerId &&
                    ((ele.attendanceLog?.type == 'ENTRY' &&
                            e.type == 'ENTRY' &&
                            ele.attendanceLog?.time == e.time) ||
                        (ele.attendanceLog?.type == 'EXIT' &&
                            e.type == 'EXIT' &&
                            ele.attendanceLog?.time == e.time))
                : ele.attendanceLog?.individualId == e.individualId &&
                        ele.attendanceLog?.registerId == e.registerId &&
                        ele.attendanceLog?.time == e.time &&
                        ele.attendanceLog?.type == e.type &&
                        ele.attendanceLog?.clientReferenceId != null
                    ? true
                    : false;
          },
        ).toList();

        return HCMAttendanceLogModel(
          rowVersion: 1,
          attendanceLog: e.copyWith(
            clientReferenceId: (existingLog ?? []).isNotEmpty
                ? existingLog?.last.attendanceLog?.clientReferenceId
                : IdGen.i.identifier,
          ),
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
        );
      },
    ).toList();
    final groupedIndividuals = hcmAttendanceLogs
        .groupListsBy((ele) => ele.attendance?.individualId);

    for (final log in groupedIndividuals.entries) {
      await attendanceLogLocalRepository?.create(
        log.value.where((l) => l.attendance?.type == 'ENTRY').last,
        createOpLog: (attendanceLogs.createOplog ?? false) &&
            (log.value
                    .where((l) => l.attendance?.type == 'ENTRY')
                    .last
                    .attendance
                    ?.time !=
                log.value
                    .where((l) => l.attendance?.type == 'EXIT')
                    .last
                    .attendance
                    ?.time),
      );
      await attendanceLogLocalRepository?.create(
        log.value.where((l) => l.attendance?.type == 'EXIT').last,
        createOpLog: (attendanceLogs.createOplog ?? false) &&
            (log.value
                    .where((l) => l.attendance?.type == 'ENTRY')
                    .last
                    .attendance
                    ?.time !=
                log.value
                    .where((l) => l.attendance?.type == 'EXIT')
                    .last
                    .attendance
                    ?.time),
      );
    }
  }

  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  List<Map<DateTime, bool>> generateDateList(
    int startMillis,
    int endMillis,
    List<HCMAttendanceLogModel> completedLogs,
    bool isSingleSession,
  ) {
    List<Map<DateTime, bool>> dateList = [];

    // Convert milliseconds to DateTime objects
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(startMillis);

    DateTime startDate = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
    );

    DateTime nowTime = DateTime.now();
    DateTime today = DateTime(
      nowTime.year,
      nowTime.month,
      nowTime.day,
      23,
      59,
    );
    endMillis = endMillis < today.millisecondsSinceEpoch
        ? today.millisecondsSinceEpoch
        : endMillis;
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(endMillis);

    DateTime endDateStartTime = DateTime(
      endTime.year,
      endTime.month,
      endTime.day,
    );
    // Iterate over each date and add to the list with value set to true
    for (DateTime date = startDate;
        date.isBefore(endDateStartTime);
        date = date.add(const Duration(days: 1))) {
      bool hasMorningLog = hasLogWithType(completedLogs, date, "ENTRY");
      bool hasEveningLog = hasLogWithType(completedLogs, date, "EXIT");
      dateList.add({
        date: isSingleSession ? hasMorningLog : hasMorningLog && hasEveningLog,
      });
    }

    return dateList;
  }

  bool hasLogWithType(
    List<HCMAttendanceLogModel> logs,
    DateTime date,
    String type,
  ) {
    final elementTime =
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

    final logTime = type == 'ENTRY'
        ? DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            9,
          ).millisecondsSinceEpoch
        : DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            18,
          ).millisecondsSinceEpoch;

    return logs.any((element) =>
        element.attendance?.time == logTime &&
        element.attendance?.type == type);
  }
}
