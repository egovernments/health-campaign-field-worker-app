import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/auth.dart';
import '../../models/auth/auth_model.dart';

part 'auth.freezed.dart';

typedef AuthEmitter = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalSecureStore localSecureStore;
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
    LocalSecureStore? localSecureStore,
  })  : localSecureStore = LocalSecureStore.instance,
        super(const AuthUnauthenticatedState()) {
    on(_onLogin);
    on(_onLogout);
    on(_onAutoLogin);
  }

  FutureOr<void> _onAutoLogin(
    AuthAutoLoginEvent event,
    AuthEmitter emit,
  ) async {
    emit(const AuthLoadingState());

    try {
      final accessToken = await localSecureStore.accessToken;
      final refreshToken = await localSecureStore.refreshToken;
      final userObject = await localSecureStore.userRequestModel;

      if (accessToken == null || refreshToken == null || userObject == null) {
        emit(const AuthUnauthenticatedState());
      } else {
        emit(AuthAuthenticatedState(
          accessToken: accessToken,
          refreshToken: refreshToken,
          userModel: userObject,
        ));
      }
    } catch (_) {
      emit(const AuthUnauthenticatedState());
      rethrow;
    }
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

      await localSecureStore.setAuthCredentials(result);

      emit(
        AuthAuthenticatedState(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
          userModel: result.userRequestModel,
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
      await localSecureStore.deleteAll();
    } catch (error) {
      rethrow;
    }
    emit(const AuthUnauthenticatedState());
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String userId,
    required String password,
    required String tenantId,
  }) = AuthLoginEvent;

  const factory AuthEvent.autoLogin({
    required String tenantId,
  }) = AuthAutoLoginEvent;

  const factory AuthEvent.logout() = AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = AuthUnauthenticatedState;

  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.authenticated({
    required String accessToken,
    required String refreshToken,
    required UserRequestModel userModel,
  }) = AuthAuthenticatedState;

  const factory AuthState.error([String? error]) = AuthErrorState;
}
