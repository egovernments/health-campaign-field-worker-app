import 'package:digit_data_model/models/entities/attendance_log.dart';

import 'date_util_attendance.dart';

class AttendanceUtils {
  // Helper function matching hasLogWithType logic
  static bool hasLogWithType(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element.time;
      final elementType = element.type?.toString();
      return elementTime == logTime && elementType == type;
    });
  }

  static bool hasLogActiveStatus(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element.time;
      final elementType = element.type?.toString();
      final elementStatus = element.status;
      if (elementStatus == null) return false;
      if (elementTime == logTime && elementType == type) {
        return elementStatus == 'ACTIVE';
      }
      return false;
    });
  }

  static Map<String, dynamic>? attendanceTime(
      selectedDate, isMorning, attendanceRegisterModel) {
    final isNotSingleSession =
        attendanceRegisterModel?.additionalDetails?["sessions"] == 2;

    DateTime? dateSession = selectedDate != null
        ? DateTime.fromMillisecondsSinceEpoch(selectedDate)
        : null;

    if (dateSession == null) return null;

    var entryTime = isNotSingleSession
        ? AttendanceDateTimeManagement.getMillisecondEpoch(
            dateSession,
            isMorning ? 0 : 1,
            "entryTime",
          )
        : (DateTime(dateSession.year, dateSession.month, dateSession.day, 9)
            .millisecondsSinceEpoch);

    var exitTime = isNotSingleSession
        ? AttendanceDateTimeManagement.getMillisecondEpoch(
            dateSession,
            isMorning ? 0 : 1,
            "exitTime",
          )
        : (DateTime(dateSession.year, dateSession.month, dateSession.day, 18)
            .millisecondsSinceEpoch);

    return {
      "date": dateSession.toIso8601String(),
      "entryTime": entryTime,
      "exitTime": exitTime,
    };
  }

  static double attendanceStatus(
      String? individualId, DateTime selectedDate, Map? attendanceCollection) {
    // Check in-memory collection first — gives instant UI feedback after mark click
    if (attendanceCollection != null && individualId != null) {
      final entry = attendanceCollection[individualId];
      if (entry is Map) {
        return (entry['status'] as num?)?.toDouble() ?? -1.0;
      }
    }
    return -1.0;
  }

  static double attendanceLogsStatus(String? individualId,
      DateTime selectedDate, List<dynamic>? attendanceLogs) {
    if (attendanceLogs == null || individualId == null) return -1.0;

    // Fall back to stored attendanceLog from DB
    final filteredAttendanceLogs = attendanceLogs
        .where((attendanceLog) =>
            attendanceLog.individualId?.toString() == individualId)
        .toList();

    if (filteredAttendanceLogs.isEmpty) return -1.0;

    // Process attendanceLog if it exists and is a List

    final hasMorningLog = AttendanceUtils.hasLogWithType(
        filteredAttendanceLogs, selectedDate, 'ENTRY');
    final hasEveningLog = AttendanceUtils.hasLogWithType(
        filteredAttendanceLogs, selectedDate, 'EXIT');
    if (hasMorningLog && hasEveningLog) {
      final morningLogActive = AttendanceUtils.hasLogActiveStatus(
          filteredAttendanceLogs, selectedDate, 'ENTRY');
      final eveningActive = AttendanceUtils.hasLogActiveStatus(
          filteredAttendanceLogs, selectedDate, 'EXIT');

      if (morningLogActive && eveningActive) {
        return 1.0; // present
      } else if (!morningLogActive && !eveningActive) {
        return 0.0; // absent
      } else {
        return 0.5; // half day
      }
    }
    return -1.0;
  }

  static List<Map<DateTime, bool>> generateAttendanceLogDateList(
    int startMillis,
    int endMillis,
    List<AttendanceLogModel> completedLogs,
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
      bool hasMorningLog =
          AttendanceUtils.hasLogWithType(completedLogs, currentDate, "ENTRY");
      bool hasEveningLog =
          AttendanceUtils.hasLogWithType(completedLogs, currentDate, "EXIT");
      dateList.add({
        currentDate: hasMorningLog && hasEveningLog,
      });
    }

    return dateList;
  }
}
