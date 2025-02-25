import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

/// Alias for emitter function
typedef ErrorEmitter = Emitter<ErrorState>;

/// Bloc to handle global page errors
class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(const ErrorState.noError()) {
    on<SetErrorEvent>(_onSetError);
    on<ClearErrorEvent>(_onClearError);
  }

  /// Handles setting an error
  FutureOr<void> _onSetError(SetErrorEvent event, ErrorEmitter emit) async {
    emit(ErrorState.hasError(event.errorMessage));
  }

  /// Handles clearing an error
  FutureOr<void> _onClearError(ClearErrorEvent event, ErrorEmitter emit) async {
    emit(const ErrorState.noError());
  }
}

/// Events
@freezed
class ErrorEvent with _$ErrorEvent {
  /// Event to set an error
  const factory ErrorEvent.setError({required String errorMessage}) = SetErrorEvent;

  /// Event to clear an error
  const factory ErrorEvent.clearError() = ClearErrorEvent;
}

/// States
@freezed
class ErrorState with _$ErrorState {
  /// No error present
  const factory ErrorState.noError() = NoErrorState;

  /// An error has occurred
  const factory ErrorState.hasError(String errorMessage) = HasErrorState;
}
