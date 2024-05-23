import 'package:attendance_management/attendance_management.dart';

// Abstract class defining the listener to interact with the data through any other application
abstract class AttendanceListeners {
  // Method to call synchronization method
  void callSyncMethod();
}
