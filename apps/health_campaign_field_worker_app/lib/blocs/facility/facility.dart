import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/facility.dart';
import '../../utils/typedefs.dart';

part 'facility.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityState>;

class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  final FacilityDataRepository facilityDataRepository;

  FacilityBloc({
    required this.facilityDataRepository,
  }) : super(const FacilityEmptyState()) {
    on(_handleLoadFacilities);
  }

  Future<void> _handleLoadFacilities(
    FacilityLoadEvent event,
    FacilityStateEmitter emit,
  ) async {
    emit(const FacilityLoadingState());
    final results = await facilityDataRepository.search(
      FacilitySearchModel(),
    );

    if (results.isEmpty) {
      emit(const FacilityEmptyState());
    } else {
      emit(FacilityFetchedState(facilities: results));
    }
  }
}

@freezed
class FacilityEvent with _$FacilityEvent {
  const factory FacilityEvent.load({
    required FacilitySearchModel facilitySearchModel,
  }) = FacilityLoadEvent;
}

@freezed
class FacilityState with _$FacilityState {
  const factory FacilityState.empty() = FacilityEmptyState;

  const factory FacilityState.loading() = FacilityLoadingState;

  const factory FacilityState.fetched({
    required List<FacilityModel> facilities,
    FacilityModel? selectedFacilities,
  }) = FacilityFetchedState;
}
