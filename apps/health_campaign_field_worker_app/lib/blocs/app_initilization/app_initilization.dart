import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/remote/mdmd.dart';
import '../../models/mdms/service_registry/service_registry_model.dart';
import '../../utils/constants.dart';

part 'app_initilization.freezed.dart';

typedef AppInitilizationEmitter = Emitter<AppInitilizationState>;

class AppInitilizationBloc
    extends Bloc<AppInitilizationEvent, AppInitilizationState> {
  final MdmsRepository mdmsRepository;
  AppInitilizationBloc(super.initialState, this.mdmsRepository) {
    on<AppInitilizationSetupEvent>(_onAppInitilizeSetup);
  }

  FutureOr<void> _onAppInitilizeSetup(
    AppInitilizationSetupEvent event,
    AppInitilizationEmitter emit,
  ) async {
    ServiceRegistryPrimaryWrapperModel result =
        await mdmsRepository.searchServiceRegistry(
      Constants.mdmsApiEndPoint,
      {
        "MdmsCriteria": {
          "tenantId": "default",
          "moduleDetails": [
            {
              "moduleName": "HCM-SERVICE-REGISTRY",
              "masterDetails": [
                {
                  "name": "serviceRegistry",
                },
              ],
            },
          ],
        },
      },
    );

    emit(state.copyWith(isInitilizationCompleted: true));
  }
}

@freezed
class AppInitilizationEvent with _$AppInitilizationEvent {
  const factory AppInitilizationEvent.onapplicationInitilizeSetup() =
      AppInitilizationSetupEvent;
}

@freezed
class AppInitilizationState with _$AppInitilizationState {
  const AppInitilizationState._();

  const factory AppInitilizationState({
    @Default(false) bool isInitilizationCompleted,
  }) = _AppInitilizationState;
}
