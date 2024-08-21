// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/models/entities/pgr_application_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/local/pgr_service.dart';
import '../../data/repositories/remote/pgr_service.dart';
import '../../models/pgr_complaints.dart';
import '/models/complaints.dart';
import '/utils/typedefs.dart';
import '/utils/utils.dart';

part 'complaints_inbox.freezed.dart';

typedef ComplaintsInboxEmitter = Emitter<ComplaintInboxState>;

/// Complaint inbox Bloc for Loading Complaints, Filtering Complaints, Sorting Complaints and Searching Complaints
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

    List<PgrServiceModel> complaints = [];
    emit(state.copyWith(loading: true));
    if (pgrRepository is PgrServiceLocalRepository) {
      complaints = await (pgrRepository as PgrServiceLocalRepository).search(
        PgrServiceSearchModel(
            tenantId: ComplaintsSingleton().tenantId
        ),
        event.createdByUserId,
      );
    } else if (pgrRepository is PgrServiceRemoteRepository) {
      complaints = await pgrRepository.search(
        PgrServiceSearchModel(
            tenantId: ComplaintsSingleton().tenantId
        ),
      );
    }

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

    List<PgrServiceModel> complaints = [];

    if (pgrRepository is PgrServiceLocalRepository) {
      complaints = await (pgrRepository as PgrServiceLocalRepository).search(
        PgrServiceSearchModel(
          tenantId: ComplaintsSingleton().tenantId,
          complaintAssignedTo: event.complaintAssignedTo,
          currentUserName: event.currentUserName,
          complaintStatus: event.complaintStatus,
          complaintTypeCode: event.complaintTypeCode,
          locality: event.locality,
        ),
        event.createdByUserId,
      );
    } else if (pgrRepository is PgrServiceRemoteRepository) {
      complaints = await pgrRepository.search(
        PgrServiceSearchModel(
          tenantId: ComplaintsSingleton().tenantId,
          complaintAssignedTo: event.complaintAssignedTo,
          currentUserName: event.currentUserName,
          complaintStatus: event.complaintStatus,
          complaintTypeCode: event.complaintTypeCode,
          locality: event.locality,
        ),
      );
    }

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

    List<PgrServiceModel> complaints = [];

    if (pgrRepository is PgrServiceLocalRepository) {
      complaints = await (pgrRepository as PgrServiceLocalRepository).search(
        PgrServiceSearchModel(
          tenantId: ComplaintsSingleton().tenantId,
          complaintNumber: event.complaintNumber,
          complainantMobileNumber: event.mobileNumber,
        ),
        event.createdByUserId,
      );
    } else if (pgrRepository is PgrServiceRemoteRepository) {
      complaints = await pgrRepository.search(
        PgrServiceSearchModel(
          tenantId: ComplaintsSingleton().tenantId,
          complaintNumber: event.complaintNumber,
          complainantMobileNumber: event.mobileNumber,
        ),
      );
    }

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
  const factory ComplaintInboxEvent.loadComplaints({
    List<PgrServiceModel>? updatedModels,
    required String createdByUserId,
  }) = ComplaintInboxLoadComplaintsEvent;

  const factory ComplaintInboxEvent.sortComplaints([
    @Default("COMPLAINT_SORT_DATE_ASC") String sortOrder,
  ]) = ComplaintInboxSortComplaintsEvent;

  const factory ComplaintInboxEvent.filterComplaints({
    String? complaintAssignedTo,
    String? currentUserName,
    String? complaintTypeCode,
    String? locality,
    required String createdByUserId,
    List<PgrServiceApplicationStatus>? complaintStatus,
  }) = ComplaintInboxFilterComplaintsEvent;

  const factory ComplaintInboxEvent.searchComplaints({
    String? complaintNumber,
    String? mobileNumber,
    required String createdByUserId,
  }) = ComplaintInboxSearchComplaintsEvent;

  const factory ComplaintInboxEvent.saveComplaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = ComplaintInboxSaveComplaintsEvent;

  const factory ComplaintInboxEvent.addItem({
    ComplaintsInboxItem? complaintInboxItem,
  }) = ComplaintInboxAddComplaintEvent;
}
