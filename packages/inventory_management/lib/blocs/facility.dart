// GENERATED using mason_cli
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';

import '../models/entities/inventory_facility.dart';

part 'facility.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityState>;

// Bloc for handling facility related events and states
class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  final InventorySingleton inventorySingleton;

  // Constructor for the bloc
  FacilityBloc(super.initialState, {required this.inventorySingleton}) {
    // Registering the event handler for loading facilities for a specific project ID
    on(_handleLoadFacilitiesForProjectId);
  }

  // Event handler for loading facilities for a specific project ID
  Future<void> _handleLoadFacilitiesForProjectId(
    FacilityLoadForProjectEvent event,
    FacilityStateEmitter emit,
  ) async {
    try {
      // Emitting the loading state
      emit(const FacilityLoadingState());
      // Fetching the facilities for the project ID
      List<InventoryFacilityModel>? facilities =
          await inventorySingleton.getFacilitiesForProjectId();
      // Checking if the facilities are null
      if (facilities == null) {
        // Emitting the empty state if facilities are null
        emit(const FacilityEmptyState());
      } else {
        // Emitting the fetched state with the fetched facilities
        emit(FacilityFetchedState(facilities: facilities));
      }
    } catch (e) {
      // Emitting the error state if an exception occurs
      emit(const FacilityErrorState());
    }
  }
}

// Freezed union class for facility events
@freezed
class FacilityEvent with _$FacilityEvent {
  // Event for loading facilities for a specific project ID
  const factory FacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
  }) = FacilityLoadForProjectEvent;
}

// Freezed union class for facility states
@freezed
class FacilityState with _$FacilityState {
  // State for when there are no facilities
  const factory FacilityState.empty() = FacilityEmptyState;

  // State for when the facilities are being loaded
  const factory FacilityState.loading() = FacilityLoadingState;

  // State for when the facilities have been fetched
  const factory FacilityState.fetched({
    required List<InventoryFacilityModel> facilities,
  }) = FacilityFetchedState;

  const factory FacilityState.error() = FacilityErrorState;
}
