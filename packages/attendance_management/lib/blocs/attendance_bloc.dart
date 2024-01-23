import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/utils/app_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_bloc.freezed.dart';

typedef AttendanceSearchEmitter = Emitter<AttendanceStates>;

class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  AttendanceBloc(super.initialState) {
    on(_onInitial);
    on(_onLoadAttendanceRegisterData);
    on(_onLoadLocalization);
    on(_onLoadSelectedRegisterData);
  }

  void _onLoadLocalization(
    LoadLocalization event,
    Emitter<AttendanceStates> emit,
  ) async {
    AppLogger.instance.info('Attendance Locale codes: $event.codes');
  }

  void _onInitial(
    InitialAttendance event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(const RegisterLoading());
    AttendanceSingleton().getAttendanceRegisters(
        (attendancePackageRegisterModel) =>
            add(LoadAttendanceRegisterData(attendancePackageRegisterModel)));
    AttendanceSingleton().onHcmLocalizationChanged((codes) {
      AppLogger.instance.info('Attendance Locale codes: $codes');
    });
  }

  void _onLoadAttendanceRegisterData(
    LoadAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(RegisterLoaded(
      registers: event.registers,
    ));
  }

  void _onLoadSelectedRegisterData(
    LoadSelectedAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(const RegisterLoading());
    final selectedRegister =
        await event.registers.where((e) => e.id == event.registerID).first;
    emit(SelectedRegisterLoaded(
      selectedRegister: selectedRegister,
    ));
  }
}

@freezed
class AttendanceEvents with _$AttendanceEvents {
  const factory AttendanceEvents.loadLocalization(List codes) =
      LoadLocalization;
  const factory AttendanceEvents.initial() = InitialAttendance;
  const factory AttendanceEvents.loadAttendanceRegisters(
          List<AttendancePackageRegisterModel> registers) =
      LoadAttendanceRegisterData;
  const factory AttendanceEvents.loadSelectedRegister(
      {required final List<AttendancePackageRegisterModel> registers,
      required final String registerID}) = LoadSelectedAttendanceRegisterData;
}

@freezed
class AttendanceStates with _$AttendanceStates {
  const factory AttendanceStates.registerLoading() = RegisterLoading;
  const factory AttendanceStates.registerLoaded({
    required final List<AttendancePackageRegisterModel> registers,
  }) = RegisterLoaded;
  const factory AttendanceStates.selectedRegisterLoaded({
    final AttendancePackageRegisterModel? selectedRegister,
  }) = SelectedRegisterLoaded;

  const factory AttendanceStates.registerError(String message) = RegisterError;
  const factory AttendanceStates.localizationLoaded() = LocalizationLoaded;
}
