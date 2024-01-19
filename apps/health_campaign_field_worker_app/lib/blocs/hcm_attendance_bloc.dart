import 'package:attendance_management/attendance_management.dart';

import '../data/data_repository.dart';
import '../models/entities/hcm_attendance_model.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final LocalRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>
      attendanceLocalRepository;
  final String? userId;
  HCMAttendanceBloc({
    required this.attendanceLocalRepository,
    this.userId,
  });
  late Function(List<AttendancePackageRegisterModel> registers) _onDataReceived;

  @override
  void getAttendanceRegisters(
    Function(List<AttendancePackageRegisterModel> registers)
        attendanceRegisters,
  ) {
    _onDataReceived = attendanceRegisters;

    return onDataReceived();
  }

  void onDataReceived() async {
    final registers = await attendanceLocalRepository.search(
      HCMAttendanceSearchModel(staffId: userId),
    );
    final attendanceRegisters =
        registers.map((e) => e.attendanceRegister).toList();
    _onDataReceived(
      attendanceRegisters,
    );
  }
}
