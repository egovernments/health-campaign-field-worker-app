import 'package:digit_components/digit_components.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceTestBloc extends Bloc<RegisterEvents, RegisterStates> {
  AttendanceTestBloc() : super(RegisterLoading()) {
    on<FetchRegister>((event, emit) async {
      AppLogger.instance.info('FetchRegister', title: 'HCMAttendanceBloc');
      emit(RegisterLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(RegisterLoaded('Register from main app ${event.id}'));
    });

  }
}

abstract class RegisterEvents extends Equatable {
  const RegisterEvents();

  @override
  List<Object> get props => [];
}

class LoadAttendancePackage extends RegisterEvents {}

class FetchRegister extends RegisterEvents {
  final String id;

  const FetchRegister(this.id);

  @override
  List<Object> get props => [id];
}

abstract class RegisterStates extends Equatable {
  const RegisterStates();

  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterStates {}

class RegisterLoaded extends RegisterStates {
  final String registers;

  const RegisterLoaded(this.registers);

  @override
  List<Object> get props => [registers];
}