import 'attendance_test_bloc.dart';

abstract class AttendanceDependencies {
  AttendanceTestBloc getAttendanceTestBloc(
      Function(String newData) processNewData); //TODO: replace string with actual data type
}
