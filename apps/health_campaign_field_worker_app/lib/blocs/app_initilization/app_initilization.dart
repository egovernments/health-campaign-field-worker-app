import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/remote_client.dart';
import '../../data/repositories/remote/mdmd.dart';
import '../../models/mdms/service_registry/service_registry_model.dart';

part 'app_initilization.freezed.dart';

typedef AppInitilizationEmitter = Emitter<AppInitilizationState>;

class AppInitilizationBloc
    extends Bloc<AppInitilizationEvent, AppInitilizationState> {
  AppInitilizationBloc(super.initialState) {
    on<AppInitilizationSetupEvent>(_onappInitilizeSetup);
  }

  FutureOr<void> _onappInitilizeSetup(
    AppInitilizationSetupEvent event,
    AppInitilizationEmitter emit,
  ) async {
    Client client = Client();
    ServiceRegistryPrimaryWrapperModel result =
        await MdmsRepository(client.init())
            .searchServiceRegistry('egov-mdms-service/v1/_search', {
      "MdmsCriteria": {
        "tenantId": "default",
        "moduleDetails": [
          {
            "moduleName": "HCM-SERVICE-REGISTRY",
            "masterDetails": [
              {"name": "serviceRegistry"},
            ],
          },
        ],
      },
    });

    print(result.serviceRegitry?.serviceRegistrylist?.first.service);
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
