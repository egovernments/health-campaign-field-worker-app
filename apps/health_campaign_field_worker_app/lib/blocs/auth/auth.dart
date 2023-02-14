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
    emit(const AuthState.loading());

    await Future.delayed(const Duration(seconds: 1));
    try {
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
      emit(AuthState.loaded(result.access_token, result.refresh_token));
    } catch (e) {
      emit(const AuthState.error());

      await Future.delayed(const Duration(seconds: 1));

      emit(const AuthState.initial());
// Here you can write your code
    }
  }

  FutureOr<void> _onLogout(AuthLogoutEvent event, AuthEmitter emit) async {
    emit(const AuthState.loaded(null, null));
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

  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loaded(
    String? accessToken,
    String? refreshToken,
  ) = _Loaded;
  const factory AuthState.error() = _Error;
}
