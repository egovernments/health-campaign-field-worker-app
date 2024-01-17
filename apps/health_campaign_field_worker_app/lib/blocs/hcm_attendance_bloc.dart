import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/utils/app_logger.dart';

class HCMAttendanceBloc extends AttendanceDependencies {
  late void Function(String newData) _onDataReceived;

  @override
  AttendanceTestBloc getAttendanceTestBloc(
    Function(String newData) processNewData,
  ) {
    AppLogger.instance
        .info('HCMAttendanceBloc', title: 'HCMAttendanceBloc');
    _onDataReceived = processNewData;
    onDataReceived(); //TODO: rename method name as per choice and make this call to assign api response to _onDataReceived which is referenced in attendance_test_bloc.dart

    return AttendanceTestBloc(const AttendanceStates.registerLoading());
  }

  void onDataReceived() async {
    _onDataReceived('99'); //TODO: replace string with actual data type
  }
}
