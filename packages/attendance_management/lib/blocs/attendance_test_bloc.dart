import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceTestBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  AttendanceTestBloc() : super(RegisterLoading()) {
    on<LoadHCMData>((event, emit) {
      emit(RegisterLoaded(event.id));
    });
  }
}

abstract class AttendanceEvents extends Equatable {
  const AttendanceEvents();

  @override
  List<Object> get props => [];
}

class LoadHCMData extends AttendanceEvents {
  final String id;

  const LoadHCMData(this.id);

  @override
  List<Object> get props => [id];
}

class FetchRegister extends AttendanceEvents {
  final String id;

  const FetchRegister(this.id);

  @override
  List<Object> get props => [id];
}

abstract class AttendanceStates extends Equatable {
  const AttendanceStates();

  @override
  List<Object> get props => [];
}

class RegisterLoading extends AttendanceStates {}

class RegisterLoaded extends AttendanceStates {
  final String registers;

  const RegisterLoaded(this.registers);

  @override
  List<Object> get props => [registers];
}
