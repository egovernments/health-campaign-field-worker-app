import 'package:attendance_management/attendance_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_session_bloc.freezed.dart';

typedef DateSessionEmitter = Emitter<DateSessionStates>;

class DateSessionBloc extends Bloc<DateSessionEvents, DateSessionStates> {
  DateSessionBloc(super.initialState) {
    on(_onInitial);
    on(_onLoadSelectedRegisterData);
  }

  void _onInitial(
    InitialDateSession event,
    Emitter<DateSessionStates> emit,
  ) async {
    emit(const DateSessionLoading());
  }

  void _onLoadSelectedRegisterData(
    LoadSelectedRegisterData event,
    Emitter<DateSessionStates> emit,
  ) async {
    final selectedRegister =
        event.registers.where((e) => e.id == event.registerID).first;
    emit(DateSessionLoaded(
      selectedRegister: selectedRegister,
    ));
  }
}

@freezed
class DateSessionEvents with _$DateSessionEvents {
  const factory DateSessionEvents.loadLocalization(List codes) =
      LoadLocalization;
  const factory DateSessionEvents.initial() = InitialDateSession;
  const factory DateSessionEvents.loadSelectedRegister(
      {required final List<AttendancePackageRegisterModel> registers,
      required final String registerID}) = LoadSelectedRegisterData;
}

@freezed
class DateSessionStates with _$DateSessionStates {
  const factory DateSessionStates.dateSessionLoading() = DateSessionLoading;
  const factory DateSessionStates.dateSessionLoaded({
    required final AttendancePackageRegisterModel selectedRegister,
  }) = DateSessionLoaded;
}
