// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/complaints/complaints.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';

part 'complaints_inbox.freezed.dart';

typedef ComplaintsInboxEmitter = Emitter<ComplaintInboxState>;

class ComplaintsInboxBloc
    extends Bloc<ComplaintInboxEvent, ComplaintInboxState> {
  final PgrServiceDataRepository pgrRepository;

  ComplaintsInboxBloc(
    super.initialState, {
    required this.pgrRepository,
  }) {
    on(_handleLoadComplaints);
    on(_handleFilterComplaints);
    on(_handleSaveFilters);
    on(_handleSortComplaints);
  }

  FutureOr<void> _handleLoadComplaints(
    ComplaintInboxLoadComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    if (event.updatedModels != null) {
      emit(state.copyWith(complaints: event.updatedModels!));

      return;
    }

    emit(state.copyWith(loading: true));
    final complaints = await pgrRepository.search(
      PgrServiceSearchModel(
        tenantId: envConfig.variables.tenantId,
      ),
    );

    emit(state.copyWith(loading: false, complaints: complaints));
  }

  FutureOr<void> _handleFilterComplaints(
    ComplaintInboxFilterComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    final complaints = await pgrRepository.search(
      PgrServiceSearchModel(
        tenantId: envConfig.variables.tenantId,
        complaintAssignedTo: event.complaintAssignedTo,
        complaintStatus: event.complaintStatus,
        complaintTypeCode: event.complaintTypeCode,
        locality: event.locality,
      ),
    );

    emit(state.copyWith(loading: false, filteredComplaints: complaints));
  }

  FutureOr<void> _handleSaveFilters(
    ComplaintInboxSaveFiltersEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    emit(state.copyWith(
      loading: false,
      filters: event.filters,
    ));
  }

  FutureOr<void> _handleSortComplaints(
    ComplaintInboxSortComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    var listToSort = (state.filteredComplaints.isNotEmpty)
        ? [...state.filteredComplaints]
        : [...state.complaints];

    if (event.sortOrder == "COMPLAINT_SORT_DATE_ASC") {
      listToSort.sort(
        (a, b) {
          final d1 = a.auditDetails?.createdTime ?? 0;
          final d2 = b.auditDetails?.createdTime ?? 0;

          return d1.compareTo(d2);
        },
      );
    } else {
      listToSort.sort(
        (a, b) {
          final d1 = b.auditDetails?.createdTime ?? 0;
          final d2 = a.auditDetails?.createdTime ?? 0;

          return d1.compareTo(d2);
        },
      );
    }

    emit(state.copyWith(
      loading: false,
      complaints: listToSort,
      filteredComplaints: listToSort,
    ));
  }
}

@freezed
class ComplaintInboxState with _$ComplaintInboxState {
  const factory ComplaintInboxState.complaints({
    @Default(false) bool loading,
    @Default([]) List<PgrServiceModel> complaints,
    @Default([]) List<PgrServiceModel> filteredComplaints,
    PgrFilters? filters,
  }) = _ComplaintInboxState;
}

@freezed
class ComplaintInboxEvent with _$ComplaintInboxEvent {
  const factory ComplaintInboxEvent.loadComplaints([
    List<PgrServiceModel>? updatedModels,
  ]) = ComplaintInboxLoadComplaintsEvent;

  const factory ComplaintInboxEvent.sortComplaints([
    @Default("COMPLAINT_SORT_DATE_ASC") String sortOrder,
  ]) = ComplaintInboxSortComplaintsEvent;

  const factory ComplaintInboxEvent.saveFilters([PgrFilters? filters]) =
      ComplaintInboxSaveFiltersEvent;

  const factory ComplaintInboxEvent.filterComplaints([
    String? complaintAssignedTo,
    String? currentUserId,
    String? complaintTypeCode,
    String? locality,
    List<PgrServiceApplicationStatus>? complaintStatus,
  ]) = ComplaintInboxFilterComplaintsEvent;

  const factory ComplaintInboxEvent.saveComplaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = ComplaintInboxSaveComplaintsEvent;

  const factory ComplaintInboxEvent.addItem({
    ComplaintsInboxItem? complaintInboxItem,
  }) = ComplaintInboxAddComplaintEvent;
}
