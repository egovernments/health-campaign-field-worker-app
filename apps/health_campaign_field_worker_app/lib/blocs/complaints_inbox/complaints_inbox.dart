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
    on(_handleSortComplaints);
    on(_handleSearchComplaints);
  }

  FutureOr<void> _handleLoadComplaints(
    ComplaintInboxLoadComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    if (event.updatedModels != null) {
      emit(state.copyWith(
        complaints: event.updatedModels!,
        isFiltered: false,
      ));

      return;
    }

    emit(state.copyWith(loading: true));
    final complaints = await pgrRepository.search(
      PgrServiceSearchModel(
        tenantId: envConfig.variables.tenantId,
      ),
    );

    emit(state.copyWith(
      loading: false,
      complaints: complaints,
      isFiltered: false,
    ));
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
        currentUserName: event.currentUserName,
        complaintStatus: event.complaintStatus,
        complaintTypeCode: event.complaintTypeCode,
        locality: event.locality,
      ),
    );

    emit(state.copyWith(
      loading: false,
      filters: PgrFilters(
        complaintAssignedTo: event.complaintAssignedTo,
        complaintStatus: event.complaintStatus,
        complaintTypeCode: event.complaintTypeCode,
        locality: event.locality,
      ),
    ));
    emit(state.copyWith(
      loading: false,
      filteredComplaints: complaints,
      isFiltered: true,
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

  FutureOr<void> _handleSearchComplaints(
    ComplaintInboxSearchComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    emit(state.copyWith(
      loading: false,
      searchKeys: PgrSearchKeys(
        complaintNumber: event.complaintNumber,
        complainantMobileNumber: event.mobileNumber,
      ),
    ));

    if (event.complaintNumber == null && event.mobileNumber == null) {
      emit(state.copyWith(
        loading: false,
        filteredComplaints: [],
        isFiltered: false,
      ));

      return;
    }

    final complaints = await pgrRepository.search(
      PgrServiceSearchModel(
        tenantId: envConfig.variables.tenantId,
        complaintNumber: event.complaintNumber,
        complainantMobileNumber: event.mobileNumber,
      ),
    );

    emit(state.copyWith(
      loading: false,
      filteredComplaints: complaints,
      isFiltered: true,
    ));
  }
}

@freezed
class ComplaintInboxState with _$ComplaintInboxState {
  const factory ComplaintInboxState.complaints({
    @Default(false) bool loading,
    @Default(false) bool isFiltered,
    @Default([]) List<PgrServiceModel> complaints,
    @Default([]) List<PgrServiceModel> filteredComplaints,
    PgrFilters? filters,
    PgrSearchKeys? searchKeys,
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

  const factory ComplaintInboxEvent.filterComplaints([
    String? complaintAssignedTo,
    String? currentUserName,
    String? complaintTypeCode,
    String? locality,
    List<PgrServiceApplicationStatus>? complaintStatus,
  ]) = ComplaintInboxFilterComplaintsEvent;

  const factory ComplaintInboxEvent.searchComplaints([
    String? complaintNumber,
    String? mobileNumber,
  ]) = ComplaintInboxSearchComplaintsEvent;

  const factory ComplaintInboxEvent.saveComplaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = ComplaintInboxSaveComplaintsEvent;

  const factory ComplaintInboxEvent.addItem({
    ComplaintsInboxItem? complaintInboxItem,
  }) = ComplaintInboxAddComplaintEvent;
}
