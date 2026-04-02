// creata a bloc for switching device with API call to switch device and pass reason for switching device
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/remote/validate_login.dart';  
part 'switch_device.freezed.dart';

@freezed
class SwitchDeviceEvent with _$SwitchDeviceEvent {
  const factory SwitchDeviceEvent.switchDevice({
    required String selectedReason,
    required String username,
    required String password,
    required String apiEndPoint,
  }) = SwitchDeviceEventSwitchDevice;
}

@freezed
class SwitchDeviceState with _$SwitchDeviceState {
  const factory SwitchDeviceState.initial() = SwitchDeviceInitial;
  const factory SwitchDeviceState.loading() = SwitchDeviceLoading;
  const factory SwitchDeviceState.success() = SwitchDeviceSuccess;
  const factory SwitchDeviceState.failure(String error) = SwitchDeviceFailure;
}

class SwitchDeviceBloc extends Bloc<SwitchDeviceEvent, SwitchDeviceState> {
  final DeviceSwitchRepository deviceSwitchRepository;

  SwitchDeviceBloc(this.deviceSwitchRepository)
      : super(const SwitchDeviceState.initial()) {
    on<SwitchDeviceEventSwitchDevice>((event, emit) async {

      // emit(const SwitchDeviceState.loading());

      try {
        // Call the switch device API
        final success = await deviceSwitchRepository.switchDevice(
          endpoint: event.apiEndPoint, // Use the endpoint from the event
          payload: {
            'deviceSwitchReason': event.selectedReason,
            "username": event.username,
            "tenantId": "ba",
            "password": event.password,
          },
        );

        
        print("Switch device API call success: $success");


        if (success) {
          emit(const SwitchDeviceState.success());
        } else {
          emit(const SwitchDeviceState.failure('Failed to switch device'));
        }
      } catch (e) {
        emit(SwitchDeviceState.failure(e.toString()));
      }
    });
  }
}

