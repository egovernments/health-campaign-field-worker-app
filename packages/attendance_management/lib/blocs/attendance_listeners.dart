import 'package:attendance_management/attendance_management.dart';

// Abstract class defining the listener to interact with the data through any other application
abstract class AttendanceListeners {
// Method to get attendance registers
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters(
      {required int offset, required int limit});

  Future<List<AttendanceRegisterModel>> loadMoreAttendanceRegisters(
      {required int limit, required int offSet});

  // Method to search attendance log
  Future<List<AttendanceLogModel>> searchAttendanceLog({
    required final String registerId,
    required final String tenantId,
    required final int entryTime,
    required final int exitTime,
    required final int currentDate,
  });

  // Method to submit attendance details
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  );

  // Method to call synchronization method
  void callSyncMethod();
}

class SubmitAttendanceDetails {
  final List<AttendanceLogModel> attendanceLogs;
  final List<AttendeeModel> attendeeList;
  final Function(bool message) onMarked;
  final bool? createOplog;
  final bool? isSingleSession;

  SubmitAttendanceDetails({
    required this.attendanceLogs,
    required this.attendeeList,
    required this.onMarked,
    this.createOplog = false,
    this.isSingleSession = false,
  });
}
