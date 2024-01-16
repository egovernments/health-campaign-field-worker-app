import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_test_bloc.freezed.dart';

class AttendanceTestBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  AttendanceTestBloc(super.initialState) {
    on(_onLoadAttendanceRegisterData);
  }

  void _onLoadAttendanceRegisterData(
    LoadAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(RegisterLoaded(event.id));
  }
}

@freezed
class AttendanceEvents with _$AttendanceEvents {
  const factory AttendanceEvents.loadHCMData(String id) = LoadAttendanceRegisterData;
}

@freezed
class AttendanceStates with _$AttendanceStates {
  const factory AttendanceStates.registerLoading() = RegisterLoading;
  const factory AttendanceStates.registerLoaded(String id) = RegisterLoaded;
}