import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/auth.dart';
import '../../models/auth/auth_model.dart';

part 'auth.freezed.dart';

typedef AuthEmitter = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static const accessTokenKey = 'accessTokenKey';

  static const refreshTokenKey = 'refreshTokenKey';

  final AuthRepository authRepository;

  AuthBloc({required this.authRepository})
      : super(const AuthUnauthenticatedState()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLogin(AuthLoginEvent event, AuthEmitter emit) async {
    emit(const AuthLoadingState());

    try {
      final AuthModel result = await authRepository.fetchAuthToken(
        loginModel: LoginModel(
          username: event.userId,
          password: event.password,
          tenantId: event.tenantId,
        ),
      );

      await storage.write(key: accessTokenKey, value: result.accessToken);
      await storage.write(key: refreshTokenKey, value: result.refreshToken);
      emit(
        AuthAuthenticatedState(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
        ),
      );
    } catch (error) {
      emit(const AuthErrorState());
      emit(const AuthUnauthenticatedState());
      rethrow;
    }
  }

  FutureOr<void> _onLogout(AuthLogoutEvent event, AuthEmitter emit) async {
    try {
      emit(const AuthLoadingState());
      await storage.deleteAll();
    } catch (error) {
      emit(const AuthUnauthenticatedState());
      rethrow;
    }
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String userId,
    required String password,
    required String tenantId,
  }) = AuthLoginEvent;

  const factory AuthEvent.logout() = AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = AuthUnauthenticatedState;

  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.authenticated({
    required String accessToken,
    required String refreshToken,
  }) = AuthAuthenticatedState;

  const factory AuthState.error([String? error]) = AuthErrorState;
}
