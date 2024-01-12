import 'attendance_test_bloc.dart';

abstract class AttendanceDependencies {
  AttendanceTestBloc getAttendanceTestBloc(
      String id, Function(String newData) processNewData);
}
