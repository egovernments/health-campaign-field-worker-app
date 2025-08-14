// GENERATED using mason_cli (adapted)
import 'dart:async';

import 'package:complaints/models/pgr_address.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/models/complaints.dart';
import '/utils/utils.dart';
import '../../models/pgr_complaints.dart';

part 'complaint_wrapper_bloc.freezed.dart';

typedef ComplaintWrapperEmitter = Emitter<ComplaintWrapperState>;

/// Complaint wrapper Bloc that adapts the old ComplaintsInboxBloc
/// into a CRUD-style wrapper that uses a global CrudBloc for persistence/search.
class ComplaintWrapperBloc
    extends Bloc<ComplaintWrapperEvent, ComplaintWrapperState> {
  final CrudBloc globalCrudBloc;

  ComplaintWrapperBloc({required this.globalCrudBloc})
      : super(const ComplaintWrapperState()) {
    on<ComplaintWrapperLoadFromGlobal>(_handleLoadFromGlobal);
    on<Create>(_handleCreate);
    on<Update>(_handleUpdate);
    on<Delete>(_handleDelete);
    on<CreateAndUpdate>(_handleCreateAndUpdate);
    on<ComplaintWrapperSort>(_handleSort);
    on<ComplaintWrapperFilter>(_handleFilter);
    on<ComplaintWrapperSearch>(_handleSearch);
  }

  FutureOr<void> _handleLoadFromGlobal(
    ComplaintWrapperLoadFromGlobal event,
    ComplaintWrapperEmitter emit,
  ) async {
    emit(state.copyWith(
        loading: true, lastAction: ComplaintWrapperActionType.none));

    // Use globalCrudBloc to search using search params
    final searchParams = GlobalSearchParameters(
      filters: [
        SearchFilter(
          root: 'pgrService',
          field: 'tenantId',
          operator: 'equals',
          value: ComplaintsSingleton().tenantId,
        ),
      ],
      primaryModel: 'pgrService',
      select: ['pgrService'],
      pagination: null,
    );

    final completer = Completer<CrudStateLoaded>();
    late final StreamSubscription subscription;

    subscription = globalCrudBloc.stream.listen((globalState) {
      if (globalState is CrudStateLoaded) {
        subscription.cancel();
        if (!completer.isCompleted) completer.complete(globalState);
      } else if (globalState is CrudStateError) {
        subscription.cancel();
        if (!completer.isCompleted)
          completer.completeError(globalState.message ?? 'Unknown error');
      }
    });

    // Trigger global search via CrudBloc
    globalCrudBloc.add(CrudEventSearch(searchParams));

    try {
      final globalState = await completer.future;

      // Extract PgrServiceModel list from results (key used by your global CRUD store)
      final allComplaints = (globalState.results['pgrService'] ?? [])
          .whereType<PgrServiceModel>()
          .toList();

      // Map to wrappers
      final wrappers = allComplaints.map((c) {
        return ComplaintWrapper(
          complaint: c,
          complainant: c.user,
          address: c.address,
        );
      }).toList();

      emit(state.copyWith(
        loading: false,
        complaints: wrappers,
        filteredComplaints: [],
        isFiltered: false,
        totalCount: globalState.totalCount ?? wrappers.length,
        searchKeys: null,
        filters: null,
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString(), complaints: []));
    }
  }

  FutureOr<void> _handleCreate(
      Create event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));
    try {
      globalCrudBloc.add(CrudEventCreate(entities: event.entities));
      emit(state.copyWith(
          loading: false, lastAction: ComplaintWrapperActionType.created));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleUpdate(
      Update event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));

    try {
      final updatedEntities = event.entities.map((entity) {
        final clientAudit = entity.clientAuditDetails;
        final updatedClientAudit = clientAudit?.copyWith(
          lastModifiedBy: ComplaintsSingleton().loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        );
        return entity.copyWith(clientAuditDetails: updatedClientAudit);
      }).toList();

      globalCrudBloc.add(CrudEventUpdate(entities: updatedEntities));
      emit(state.copyWith(
          loading: false, lastAction: ComplaintWrapperActionType.updated));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleDelete(
      Delete event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));
    try {
      globalCrudBloc.add(CrudEventDelete(entities: event.entities));
      emit(state.copyWith(
          loading: false, lastAction: ComplaintWrapperActionType.deleted));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleCreateAndUpdate(
      CreateAndUpdate event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.entitiesToCreate.isNotEmpty) {
        globalCrudBloc.add(CrudEventCreate(entities: event.entitiesToCreate));
      }
      if (event.entitiesToUpdate.isNotEmpty) {
        final updatedEntities = event.entitiesToUpdate.map((entity) {
          final clientAudit = entity.clientAuditDetails;
          final updatedClientAudit = clientAudit?.copyWith(
            lastModifiedBy: ComplaintsSingleton().loggedInUserUuid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          );
          return entity.copyWith(clientAuditDetails: updatedClientAudit);
        }).toList();
        globalCrudBloc.add(CrudEventUpdate(entities: updatedEntities));
      }

      emit(state.copyWith(
          loading: false,
          lastAction: ComplaintWrapperActionType.createAndUpdate));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleSort(
      ComplaintWrapperSort event, ComplaintWrapperEmitter emit) {
    final listToSort = (state.filteredComplaints.isNotEmpty)
        ? [...state.filteredComplaints]
        : [...state.complaints];

    if (event.sortOrder == "COMPLAINT_SORT_DATE_ASC") {
      listToSort.sort((a, b) {
        final d1 = a.complaint?.auditDetails?.createdTime ?? 0;
        final d2 = b.complaint?.auditDetails?.createdTime ?? 0;
        return d1.compareTo(d2);
      });
    } else {
      listToSort.sort((a, b) {
        final d1 = b.complaint?.auditDetails?.createdTime ?? 0;
        final d2 = a.complaint?.auditDetails?.createdTime ?? 0;
        return d1.compareTo(d2);
      });
    }

    emit(state.copyWith(
        loading: false,
        complaints: listToSort,
        filteredComplaints: listToSort));
  }

  FutureOr<void> _handleFilter(
      ComplaintWrapperFilter event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));

    final filtered = state.complaints.where((w) {
      final c = w.complaint;
      // if (event.complaintAssignedTo != null &&
      //     (c?.assignedTo ?? '') != event.complaintAssignedTo) return false;
      if (event.currentUserName != null &&
          (c?.user.userName ?? '') != event.currentUserName) return false;
      if (event.complaintTypeCode != null &&
          (c?.serviceCode ?? '') != event.complaintTypeCode) return false;
      if (event.locality != null &&
          (c?.address.locality?.code ?? '') != event.locality) return false;
      if (event.complaintStatus != null && event.complaintStatus!.isNotEmpty) {
        if (!event.complaintStatus!.contains(c?.applicationStatus)) {
          return false;
        }
      }
      return true;
    }).toList();

    emit(state.copyWith(
        loading: false,
        filteredComplaints: filtered,
        isFiltered: true,
        filters: PgrFilters(
          complaintAssignedTo: event.complaintAssignedTo,
          complaintStatus: event.complaintStatus,
          complaintTypeCode: event.complaintTypeCode,
          locality: event.locality,
        )));
  }

  FutureOr<void> _handleSearch(
      ComplaintWrapperSearch event, ComplaintWrapperEmitter emit) async {
    emit(state.copyWith(loading: true));

    // If both search keys are null, clear filter
    if (event.complaintNumber == null && event.mobileNumber == null) {
      emit(state.copyWith(
          loading: false, filteredComplaints: [], isFiltered: false));
      return;
    }

    // Use globalCrudBloc to search using search params
    final searchParams = GlobalSearchParameters(
      filters: [
        if (event.mobileNumber != null && event.mobileNumber!.isNotEmpty)
          SearchFilter(
            root: 'pgrComplainant',
            field: 'mobileNumber',
            operator: 'contains',
            value: event.mobileNumber,
          ),
        if (event.complaintNumber != null && event.complaintNumber!.isNotEmpty)
          SearchFilter(
            root: 'pgrService',
            field: 'serviceRequestId',
            operator: 'contains',
            value: event.complaintNumber,
          ),
      ],
      primaryModel: 'pgrService',
      select: ['pgrService'],
      pagination: null,
    );

    final completer = Completer<CrudStateLoaded>();
    late final StreamSubscription subscription;

    subscription = globalCrudBloc.stream.listen((globalState) {
      if (globalState is CrudStateLoaded) {
        subscription.cancel();
        if (!completer.isCompleted) completer.complete(globalState);
      } else if (globalState is CrudStateError) {
        subscription.cancel();
        if (!completer.isCompleted)
          completer.completeError(globalState.message ?? 'Unknown error');
      }
    });

    globalCrudBloc.add(CrudEventSearch(searchParams));

    try {
      final globalState = await completer.future;
      final results = (globalState.results['pgrService'] ?? [])
          .whereType<PgrServiceModel>()
          .toList();
      final wrappers = results
          .map((c) => ComplaintWrapper(
              complaint: c, complainant: c.user, address: c.address))
          .toList();

      emit(state.copyWith(
          loading: false,
          filteredComplaints: wrappers,
          isFiltered: true,
          searchKeys: PgrSearchKeys(
              complaintNumber: event.complaintNumber,
              complainantMobileNumber: event.mobileNumber)));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}

@freezed
class ComplaintWrapperEvent with _$ComplaintWrapperEvent {
  const factory ComplaintWrapperEvent.loadFromGlobal() =
      ComplaintWrapperLoadFromGlobal;

  const factory ComplaintWrapperEvent.create(
      {required List<EntityModel> entities}) = Create;
  const factory ComplaintWrapperEvent.update(
      {required List<EntityModel> entities}) = Update;
  const factory ComplaintWrapperEvent.delete(
      {required List<EntityModel> entities}) = Delete;
  const factory ComplaintWrapperEvent.createAndUpdate(
      {required List<EntityModel> entitiesToCreate,
      required List<EntityModel> entitiesToUpdate}) = CreateAndUpdate;

  const factory ComplaintWrapperEvent.sort(
          [@Default("COMPLAINT_SORT_DATE_ASC") String sortOrder]) =
      ComplaintWrapperSort;

  const factory ComplaintWrapperEvent.filter({
    String? complaintAssignedTo,
    String? currentUserName,
    String? complaintTypeCode,
    String? locality,
    required String createdByUserId,
    List<PgrServiceApplicationStatus>? complaintStatus,
  }) = ComplaintWrapperFilter;

  const factory ComplaintWrapperEvent.search({
    String? complaintNumber,
    String? mobileNumber,
  }) = ComplaintWrapperSearch;

  const factory ComplaintWrapperEvent.saveComplaints(
      {List<ComplaintsInboxItem>? complaintInboxItems}) = ComplaintWrapperSave;
  const factory ComplaintWrapperEvent.addItem(
      {ComplaintsInboxItem? complaintInboxItem}) = ComplaintWrapperAddItem;
}

@freezed
class ComplaintWrapperState with _$ComplaintWrapperState {
  const factory ComplaintWrapperState({
    @Default(false) bool loading,
    @Default([]) List<ComplaintWrapper> complaints,
    @Default([]) List<ComplaintWrapper> filteredComplaints,
    @Default(false) bool isFiltered,
    PgrFilters? filters,
    PgrSearchKeys? searchKeys,
    @Default([]) List<ComplaintsInboxItem> savedItems,
    int? offset,
    int? limit,
    String? error,
    @Default(0) int totalCount,
    @Default(ComplaintWrapperActionType.none)
    ComplaintWrapperActionType lastAction,
  }) = _ComplaintWrapperState;
}

@freezed
class ComplaintWrapper with _$ComplaintWrapper {
  const factory ComplaintWrapper({
    PgrServiceModel? complaint,
    PgrComplainantModel? complainant,
    PgrAddressModel? address,
  }) = _ComplaintWrapper;
}

enum ComplaintWrapperActionType {
  none,
  created,
  updated,
  deleted,
  createAndUpdate,
}
