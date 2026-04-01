import 'attendace_acknowlagement.dart';
import 'attendance_qr_scanner.dart';
import 'manage_attendance.dart';
import 'mark_attendance.dart';

final dynamic attendanceFlows = {
  "name": "ATTENDANCE",
  "initialPage": "manageAttendance",
  "order": 9,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    manageAttendanceFlow,
    markAttendanceFlow,
    attendanceQrScannerFlow,
    attendanceAcknowledgementFlow,
  ]
};
