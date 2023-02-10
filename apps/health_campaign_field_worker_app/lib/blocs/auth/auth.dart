import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/remote/auth.dart';
import '../../utils/environment_config.dart';

part 'auth.freezed.dart';

typedef AuthEmitter = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(super.initialState, this.authRepository) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLogin(AuthLoginEvent event, AuthEmitter emit) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));

    final result = await authRepository.authToken(
      'user/oauth/token',
      null,
      {
        "username": event.userId.toString(),
        "password": event.password.toString(),
        "userType": 'EMPLOYEE',
        "tenantId": envConfig.variables.tenantId,
        "scope": "read",
        "grant_type": "password",
      },
    );

    emit(state.copyWith(accessToken: '', loading: false));
  }

  FutureOr<void> _onLogout(AuthLogoutEvent event, AuthEmitter emit) async {
    emit(state.copyWith(accessToken: null));
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String userId,
    required String password,
  }) = AuthLoginEvent;

  const factory AuthEvent.logout() = AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool initialized,
    @Default(false) bool loading,
    String? accessToken,
    String? refreshToken,
  }) = _AuthState;

  bool get isAuthenticated => accessToken == null ? false : true;
}
