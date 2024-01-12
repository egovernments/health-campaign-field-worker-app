import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/utils/app_logger.dart';

class HCMAttendanceBloc extends AttendanceDependencies {
  late void Function(String newData) _onDataReceived;

  @override
  AttendanceTestBloc getAttendanceTestBloc(
    String id,
    Function(String newData) processNewData,
  ) {
    AppLogger.instance
        .info('HCMAttendanceBloc $id', title: 'HCMAttendanceBloc');
    _onDataReceived = processNewData;
    onDataReceived(id);

    return AttendanceTestBloc();
  }

  void onDataReceived(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    _onDataReceived('99');
  }
}
