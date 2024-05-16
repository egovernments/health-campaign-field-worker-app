// Importing necessary packages and files.
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/facility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils/typedefs.dart';

// Part directive for the generated code.
part 'facility.freezed.dart';

// Type alias for a function that emits a `FacilityState`.
typedef FacilityStateEmitter = Emitter<FacilityState>;

/// `FacilityBloc` is a class that extends `Bloc` and manages the state of facilities.
/// It uses `FacilityDataRepository` and `ProjectFacilityDataRepository` to interact with the data layer.
class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  // The data repositories used by this bloc.
  final FacilityDataRepository facilityDataRepository;
  final ProjectFacilityDataRepository projectFacilityDataRepository;

  /// The constructor for `FacilityBloc`.
  /// It initializes the bloc with an empty state and sets up the event handler for loading facilities.
  FacilityBloc({
    required this.facilityDataRepository,
    required this.projectFacilityDataRepository,
  }) : super(const FacilityEmptyState()) {
    on(_handleLoadFacilitiesForProjectId);
  }

  /// The `_handleLoadFacilitiesForProjectId` method handles the `FacilityLoadForProjectEvent` event.
  /// It loads the facilities for a project and emits a new state.
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

/// `FacilityEvent` is a freezed union of all possible events that can occur in the `FacilityBloc`.
@freezed
class FacilityEvent with _$FacilityEvent {
  /// The `FacilityLoadForProjectEvent` event is triggered when facilities need to be loaded for a project.
  const factory FacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
  }) = FacilityLoadForProjectEvent;
}

/// `FacilityState` is a freezed union of all possible states that can occur in the `FacilityBloc`.
@freezed
class FacilityState with _$FacilityState {
  /// The `FacilityEmptyState` state represents the state where no facilities are loaded.
  const factory FacilityState.empty() = FacilityEmptyState;

  /// The `FacilityLoadingState` state represents the state where facilities are being loaded.
  const factory FacilityState.loading() = FacilityLoadingState;

  /// The `FacilityFetchedState` state represents the state where facilities have been loaded.
  const factory FacilityState.fetched({
    required List<FacilityModel> facilities,
    @Default([]) List<FacilityModel> allFacilities,
  }) = FacilityFetchedState;
}
