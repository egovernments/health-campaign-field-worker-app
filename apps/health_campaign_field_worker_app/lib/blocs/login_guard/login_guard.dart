import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/remote/validate_login.dart';
import '../../utils/constants.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import 'package:isar/isar.dart';

part 'login_guard.freezed.dart';

@freezed
class LoginGuardEvent with _$LoginGuardEvent {
  const factory LoginGuardEvent.checkOtherDeviceLogin({
    required String username,
    required String apiEndPoint,
  }) = CheckOtherDeviceLoginEvent;

  const factory LoginGuardEvent.reset() = LoginGuardResetEvent;
}

@freezed
class LoginGuardState with _$LoginGuardState {
  const factory LoginGuardState.initial() = LoginGuardInitial;
  const factory LoginGuardState.otherDevice() = LoginGuardOtherDeviceState;
  const factory LoginGuardState.allow() = LoginGuardAllowState;
}

class LoginGuardBloc extends Bloc<LoginGuardEvent, LoginGuardState> {
  final ValidateRepository validateRepository;
  // final Isar isar;

  LoginGuardBloc(this.validateRepository)
      : super(const LoginGuardState.initial()) {
    on<CheckOtherDeviceLoginEvent>((event, emit) async {
      print("CheckOtherDeviceLoginEvent");

      // Prepare payload
      final payload = {
        'username': event.username,
        "tenantId": "ba",
        "deviceToken": null,
      };
      print('LoginGuardBloc sending payload: $payload ${event.apiEndPoint}');

      try {
        final isLoggedInOtherDevice =
            await validateRepository.isLoggedInOnOtherDevice(
          endpoint: event.apiEndPoint, // Use dynamic endpoint from event
          payload: payload,
        );
        print('LoginGuardBloc API response: $isLoggedInOtherDevice');

        if (isLoggedInOtherDevice) {
          emit(const LoginGuardState.otherDevice());
        } else {
          emit(const LoginGuardState.allow());
        }
      } catch (e) {
        print('LoginGuardBloc API error: $e');
        emit(const LoginGuardState.allow());
      }
    });

    on<LoginGuardResetEvent>((event, emit) async {
      emit(const LoginGuardState.initial());
    });
  }
}