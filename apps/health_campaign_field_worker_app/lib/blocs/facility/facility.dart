import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/facility.dart';

part 'facility.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityState>;

class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  FacilityBloc() : super(const FacilityEmptyState()) {
    on(_handleLoadFacilities);
  }

  Future<void> _handleLoadFacilities(
    FacilityLoadEvent event,
    FacilityStateEmitter emit,
  ) async {
    emit(const FacilityLoadingState());
  }
}

@freezed
class FacilityEvent with _$FacilityEvent {
  const factory FacilityEvent.load() = FacilityLoadEvent;
}

@freezed
class FacilityState with _$FacilityState {
  const factory FacilityState.empty() = FacilityEmptyState;

  const factory FacilityState.loading() = FacilityLoadingState;

  const factory FacilityState.fetched({
    @Default([]) List<FacilityModel> facilities,
    FacilityModel? selectedFacilities,
  }) = FacilityFetchedState;
}
