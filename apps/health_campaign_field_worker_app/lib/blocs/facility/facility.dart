import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'facility.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityState>;

class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  final FacilityDataRepository facilityDataRepository;
  final ProjectFacilityDataRepository projectFacilityDataRepository;

  FacilityBloc({
    required this.facilityDataRepository,
    required this.projectFacilityDataRepository,
  }) : super(const FacilityEmptyState()) {
    on(_handleLoadFacilitiesForProjectId);
  }

  Future<void> _handleLoadFacilitiesForProjectId(
    FacilityLoadForProjectEvent event,
    FacilityStateEmitter emit,
  ) async {
    emit(const FacilityLoadingState());

    final projectFacilities = await projectFacilityDataRepository.search(
      ProjectFacilitySearchModel(projectId: [event.projectId]),
    );

    List<FacilityModel> allFacilities = [
      FacilityModel(
        id: 'Delivery Team',
        additionalFields: FacilityAdditionalFields(
          version: 1,
          fields: [const AdditionalField('type', 'DeliveryTeam')],
        ),
      ),
    ];

    List<FacilityModel> facilities = [];

    if (event.loadAllProjects) {
      allFacilities.addAll(await facilityDataRepository.search(
        FacilitySearchModel(id: null),
      ));
    }

    for (final projectFacility in projectFacilities) {
      final results = await facilityDataRepository.search(
        FacilitySearchModel(id: [projectFacility.facilityId]),
      );

      facilities.addAll(results);
    }

    if (facilities.isEmpty) {
      emit(const FacilityEmptyState());
    } else {
      emit(FacilityFetchedState(
        facilities: facilities,
        allFacilities: allFacilities,
      ));
    }
  }
}

@freezed
class FacilityEvent with _$FacilityEvent {
  const factory FacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
  }) = FacilityLoadForProjectEvent;
}

@freezed
class FacilityState with _$FacilityState {
  const factory FacilityState.empty() = FacilityEmptyState;

  const factory FacilityState.loading() = FacilityLoadingState;

  const factory FacilityState.fetched({
    required List<FacilityModel> facilities,
    @Default([]) List<FacilityModel> allFacilities,
  }) = FacilityFetchedState;
}
