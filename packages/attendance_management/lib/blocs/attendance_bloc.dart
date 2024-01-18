import 'package:attendance_management/attendance_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_bloc.freezed.dart';

class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  AttendanceBloc(super.initialState) {
    on(_onInitial);
    on(_onLoadAttendanceRegisterData);
  }

  void _onInitial(
    InitialAttendance event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(const RegisterLoading());
    event.attendanceDependencies.getAttendanceRegisters((registers) async {
      add(LoadAttendanceRegisterData(registers));
    });
  }

  void _onLoadAttendanceRegisterData(
    LoadAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(RegisterLoaded(event.registers));
  }
}

@freezed
class AttendanceEvents with _$AttendanceEvents {
  const factory AttendanceEvents.initial(
      AttendanceListeners attendanceDependencies) = InitialAttendance;
  const factory AttendanceEvents.loadAttendanceRegisters(List<AttendancePackageRegisterModel> registers) = LoadAttendanceRegisterData;
}

@freezed
class AttendanceStates with _$AttendanceStates {
  const factory AttendanceStates.registerLoading() = RegisterLoading;
  const factory AttendanceStates.registerLoaded(List<AttendancePackageRegisterModel> registers) = RegisterLoaded;
}