import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'facility.freezed.dart';

typedef FacilityStateEmitter = Emitter<FacilityState>;

class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
  final FacilityDataRepository facilityDataRepository;
  final ProjectFacilityDataRepository projectFacilityDataRepository;
  final StockDataRepository stockRepository;

  FacilityBloc({
    required this.facilityDataRepository,
    required this.projectFacilityDataRepository,
    required this.stockRepository,
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

    List<FacilityModel> allFacilities = [];

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
      final stocks = await stockRepository.search(StockSearchModel());
      stocks.sort((a, b) =>
          b.auditDetails!.createdTime.compareTo(a.auditDetails!.createdTime));
      final latestStock = stocks.firstWhereOrNull(
        (element) => element.auditDetails?.createdBy == event.userId,
      );
      final facility = facilities
          .firstWhereOrNull((element) => element.id == latestStock?.facilityId);

      emit(FacilityFetchedState(
        facilities: facilities,
        allFacilities: allFacilities,
        facility: facility,
      ));
    }
  }
}

@freezed
class FacilityEvent with _$FacilityEvent {
  const factory FacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
    required String userId,
  }) = FacilityLoadForProjectEvent;
}

@freezed
class FacilityState with _$FacilityState {
  const factory FacilityState.empty() = FacilityEmptyState;

  const factory FacilityState.loading() = FacilityLoadingState;

  const factory FacilityState.fetched({
    required List<FacilityModel> facilities,
    @Default([]) List<FacilityModel> allFacilities,
    FacilityModel? facility,
  }) = FacilityFetchedState;
}
