import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/utils.dart';
import '../sync/sync.dart';

// Bloc responsible for managing attendance related operations
class HCMAttendanceBloc extends AttendanceListeners {
  final LocalRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>?
      attendanceLocalRepository;
  final LocalRepository<IndividualModel, IndividualSearchModel>?
      individualLocalRepository;
  final LocalRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>?
      attendanceLogLocalRepository;
  final String? userId;
  final String? individualId;
  final String? projectId;
  final BuildContext context;

  // Constructor
  HCMAttendanceBloc({
    this.attendanceLocalRepository,
    this.individualLocalRepository,
    this.attendanceLogLocalRepository,
    this.individualId,
    this.userId,
    this.projectId,
    required this.context,
  });

  @override
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters(
      {required int limit, required int offset}) async {
    final finalRegisters = await fetchRegisters(offSet: offset, limit: limit);
    return finalRegisters ?? [];
  }

  @override
  Future<List<AttendanceRegisterModel>> loadMoreAttendanceRegisters(
      {required int limit, required int offSet}) async {
    final registers = await fetchRegisters(offSet: offSet, limit: limit);
    return registers ?? [];
  }

  @override
  Future<List<AttendanceLogModel>> searchAttendanceLog(
      {required String registerId,
      required String tenantId,
      required int entryTime,
      required int exitTime,
      required int currentDate}) async {
    final attendanceLogs = await attendanceLogLocalRepository?.search(
      HCMAttendanceLogSearchModel(
          attendanceSearchModel: AttendanceLogSearchModel(
        registerId: registerId,
      )),
    );

    // Filtering attendance logs for the current day
    final filteredLogs = attendanceLogs
        ?.where((log) {
          final logTime =
              DateTime.fromMillisecondsSinceEpoch(log.attendance!.time!);
          final logDay = DateTime(logTime.year, logTime.month, logTime.day)
              .millisecondsSinceEpoch;
          final currentTime = DateTime.fromMillisecondsSinceEpoch(
            currentDate,
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

    return filteredLogs ?? [];
  }

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {
    final existingLogs = await attendanceLogLocalRepository?.search(
      HCMAttendanceLogSearchModel(
        attendanceSearchModel: AttendanceLogSearchModel(
          registerId: attendanceLogs.attendanceLogs.first.registerId,
        ),
      ),
    );

    // Mapping attendance logs for submission
    final hcmAttendanceLogs = attendanceLogs.attendanceLogs.map(
      (e) {
        final existingLog = existingLogs?.where(
          (ele) {
            return attendanceLogs.isSingleSession == true
                ? ele.attendance?.individualId == e.individualId &&
                    ele.attendance?.registerId == e.registerId &&
                    ((ele.attendance?.type == 'ENTRY' &&
                            e.type == 'ENTRY' &&
                            ele.attendance?.time == e.time) ||
                        (ele.attendance?.type == 'EXIT' &&
                            e.type == 'EXIT' &&
                            ele.attendance?.time == e.time))
                : ele.attendance?.individualId == e.individualId &&
                        ele.attendance?.registerId == e.registerId &&
                        ele.attendance?.time == e.time &&
                        ele.attendance?.type == e.type &&
                        ele.attendance?.clientReferenceId != null
                    ? true
                    : false;
          },
        ).toList();

        return HCMAttendanceLogModel(
          rowVersion: 1,
          attendance: e.copyWith(
            clientReferenceId: (existingLog ?? []).isNotEmpty
                ? existingLog?.last.attendance?.clientReferenceId
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

    // Grouping individuals and creating attendance logs
    final groupedIndividuals =
        hcmAttendanceLogs.groupListsBy((ele) => ele.attendance?.individualId);

    for (final log in groupedIndividuals.entries) {
      final createOpLog = (attendanceLogs.createOplog ?? false) &&
          (log.value
                  .where((l) => l.attendance?.type == 'ENTRY')
                  .last
                  .attendance
                  ?.time !=
              log.value
                  .where((l) => l.attendance?.type == 'EXIT')
                  .last
                  .attendance
                  ?.time);
      await createAttendanceLog(
        log.value,
        'ENTRY',
        createOpLog,
      );
      await createAttendanceLog(
        log.value,
        'EXIT',
        createOpLog,
      );
    }
  }

  // Method to create attendance log
  Future<void> createAttendanceLog(
      List<HCMAttendanceLogModel> logs, String type, bool createOpLog) async {
    final lastLog = logs.where((l) => l.attendance?.type == type).last;
    await attendanceLogLocalRepository?.create(
      lastLog,
      createOpLog: createOpLog &&
          (logs
                  .where((l) => l.attendance?.type == 'ENTRY')
                  .last
                  .attendance
                  ?.time !=
              logs
                  .where((l) => l.attendance?.type == 'EXIT')
                  .last
                  .attendance
                  ?.time),
    );
  }

  @override
  void callSyncMethod() {
    context.read<SyncBloc>().add(SyncRefreshEvent(userId!));
  }

  // Method to generate date list
  List<Map<DateTime, bool>> generateDateList(
    int startMillis,
    int endMillis,
    List<HCMAttendanceLogModel> completedLogs,
    bool isSingleSession,
  ) {
    List<Map<DateTime, bool>> dateList = [];

    // Convert milliseconds to DateTime objects
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(startMillis);
    DateTime endDate = DateTime.fromMillisecondsSinceEpoch(endMillis);

    // Calculate the number of days between start and end dates
    final daysDifference = endDate.difference(startDate).inDays;

    // Generate date list directly based on the number of days
    for (int i = 0; i <= daysDifference; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));
      bool hasMorningLog = hasLogWithType(completedLogs, currentDate, "ENTRY");
      bool hasEveningLog = hasLogWithType(completedLogs, currentDate, "EXIT");
      dateList.add({
        currentDate:
            isSingleSession ? hasMorningLog : hasMorningLog && hasEveningLog,
      });
    }

    return dateList;
  }

  // Method to check if logs exist for a given date and type
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

  // Method to fetch attendance registers
  fetchRegisters({required int offSet, required int limit}) async {
    final registers = await attendanceLocalRepository?.search(
      HCMAttendanceSearchModel(
        attendanceRegisterSearchModel: AttendanceRegisterSearchModel(
          limit: limit,
          offSet: offSet,
          staffId: userId,
          referenceId: projectId,
        ),
      ),
    );

    if (registers != null) {
      final List<AttendanceRegisterModel> attendanceRegisters =
          await Future.wait(registers.map((e) async {
        final registerCompletedLogs =
            await attendanceLogLocalRepository?.search(
          HCMAttendanceLogSearchModel(
            attendanceSearchModel: AttendanceLogSearchModel(
              registerId: e.attendanceRegister.id,
              uploadToServer: true,
            ),
          ),
        );

        return _processAttendanceRegister(
            e.attendanceRegister, registerCompletedLogs);
      }));

      return attendanceRegisters;
    } else {
      return [];
    }
  }

// Helper method to process attendance register and return the modified register
  Future<AttendanceRegisterModel> _processAttendanceRegister(
      AttendanceRegisterModel register,
      List<HCMAttendanceLogModel>? registerCompletedLogs) async {
    // Generate date list
    var list = generateDateList(
      register.startDate!,
      register.endDate!,
      registerCompletedLogs ?? [],
      register.additionalDetails?["sessions"] != 2,
    );

    var completedDaysCount = register.additionalDetails?["sessions"] == 2
        ? list.length ~/ 2 // for registers with 2 sessions
        : list.length; // for registers with single session

    final individualList = await individualLocalRepository?.search(
      IndividualSearchModel(
        id: register.attendees
            ?.where((att) => (att.denrollmentDate == null ||
                (att.denrollmentDate ??
                        DateTime.now().millisecondsSinceEpoch) >=
                    DateTime.now().millisecondsSinceEpoch))
            .map((a) => a.individualId!)
            .toList(),
      ),
    );

    // Map attendees
    final attendeeList = register.attendees
        ?.where((att) => (att.denrollmentDate == null ||
            (att.denrollmentDate ?? DateTime.now().millisecondsSinceEpoch) >=
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

    return register.copyWith(
      attendees: attendeeList,
      attendanceLog: list,
      completedDays: completedDaysCount,
    );
  }
}
