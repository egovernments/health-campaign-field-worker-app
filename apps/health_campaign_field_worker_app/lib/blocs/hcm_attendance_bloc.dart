import 'package:attendance_management/blocs/attendance_test_bloc.dart';
import 'package:digit_components/utils/app_logger.dart';

class HCMAttendanceBloc extends AttendanceTestBloc {
  HCMAttendanceBloc() : super() {

    on<LoadAttendancePackage>((event, emit) {
      AppLogger.instance.debug('Load event triggered');
    });
  }
}