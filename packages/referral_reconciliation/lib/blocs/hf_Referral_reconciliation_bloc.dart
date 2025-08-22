import 'dart:async';

import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';
import 'package:referral_reconciliation/utils/utils.dart';

part 'hf_Referral_reconciliation_bloc.freezed.dart';

typedef HFReferalWrapperEmitter = Emitter<HFReferalWrapperState>;

class HFReferalWrapperBloc
    extends Bloc<HFReferalWrapperEvent, HFReferalWrapperState> {
  final CrudBloc globalHFReferalBloc;

  HFReferalWrapperBloc({required this.globalHFReferalBloc})
      : super(const HFReferalWrapperState()) {
    on<HFReferalWrapperLoadFromGlobal>(_handleLoadFromGlobal);

    on<HFReferalWrapperClear>(_handleClear);
    on<Create>(_handleCreate);
    on<Update>(_handleUpdate);
    on<Delete>(_handleDelete);
    on<CreateAndUpdate>(_handleCreateAndUpdate);
  }

  FutureOr<void> _handleCreate(
    Create event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      globalHFReferalBloc.add(CrudEventCreate(entities: event.entities));

      final wrappers = groupEntitiesIntoWrappers(event.entities);

      emit(state.copyWith(
        loading: false,
        lastAction: HFReferalWrapperActionType.created,
        hFReferalMembers: [...state.hFReferalMembers, ...wrappers],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleUpdate(
    Update event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      // Update audit fields for each entity
      final updatedEntities = event.entities.map((entity) {
        final clientAudit = entity.clientAuditDetails;

        final updatedClientAudit = clientAudit?.copyWith(
          lastModifiedBy: ReferralReconSingleton().userUUid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        );

        return entity.copyWith(clientAuditDetails: updatedClientAudit);
      }).toList();

      globalHFReferalBloc.add(CrudEventUpdate(entities: updatedEntities));

      final wrappers = groupEntitiesIntoWrappers(event.entities);

      emit(state.copyWith(
        loading: false,
        lastAction: HFReferalWrapperActionType.updated,
        hFReferalMembers: [...state.hFReferalMembers, ...wrappers],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleDelete(
    Delete event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      globalHFReferalBloc.add(CrudEventDelete(entities: event.entities));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleCreateAndUpdate(
    CreateAndUpdate event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.entitiesToCreate.isNotEmpty) {
        globalHFReferalBloc
            .add(CrudEventCreate(entities: event.entitiesToCreate));
      }
      if (event.entitiesToUpdate.isNotEmpty) {
        // Update audit fields for each entity
        final updatedEntities = event.entitiesToUpdate.map((entity) {
          final clientAudit = entity.clientAuditDetails;

          final updatedClientAudit = clientAudit?.copyWith(
            lastModifiedBy: ReferralReconSingleton().userUUid,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          );

          return entity.copyWith(clientAuditDetails: updatedClientAudit);
        }).toList();
        globalHFReferalBloc.add(CrudEventUpdate(entities: updatedEntities));
      }

      final wrappers = groupEntitiesIntoWrappers([
        ...event.entitiesToCreate,
        ...event.entitiesToUpdate,
      ]);
      emit(state.copyWith(
        loading: false,
        lastAction: HFReferalWrapperActionType.createAndUpdate,
        hFReferalMembers: [...state.hFReferalMembers, ...wrappers],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleLoadFromGlobal(
    HFReferalWrapperLoadFromGlobal event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      lastAction: HFReferalWrapperActionType.none,
    ));

    final completer = Completer<CrudStateLoaded>();

    late final StreamSubscription subscription;
    subscription = globalHFReferalBloc.stream.listen((globalState) {
      if (globalState is CrudStateLoaded) {
        subscription.cancel();
        if (!completer.isCompleted) completer.complete(globalState);
      } else if (globalState is CrudStateError) {
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.completeError(globalState.message ?? 'Unknown error');
        }
      }
    });

    // Trigger the global load
    globalHFReferalBloc.add(CrudEventSearch(event.searchParams));

    try {
      final globalState = await completer.future;

      // ✅ Now you are still within async handler scope, so this is safe
      final wrappers = <HFReferalWrapper>[];
      final allHfReferals = (globalState.results['hFReferral'] ?? [])
          .whereType<HFReferralModel>()
          .toList();

      for (final hfReferal in allHfReferals) {
        wrappers.add(HFReferalWrapper(hfReferrals: hfReferal));
      }

      emit(state.copyWith(
        lastAction: HFReferalWrapperActionType.none,
        hFReferalMembers: [...state.hFReferalMembers, ...wrappers],
        loading: false,
        totalCount: globalState.totalCount ?? 0,
        limit: event.searchParams.pagination?.limit,
        offset: event.searchParams.pagination?.offset,
      ));
    } catch (e) {
      emit(state
          .copyWith(hFReferalMembers: [], loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _handleClear(
    HFReferalWrapperClear event,
    HFReferalWrapperEmitter emit,
  ) async {
    emit(const HFReferalWrapperState()); // Reset to initial default state
  }

  List<HFReferalWrapper> groupEntitiesIntoWrappers(List<EntityModel> entities) {
    final allReferrals = entities.whereType<HFReferralModel>().toList();

    final wrappers = <HFReferalWrapper>[];

    for (final headMember in allReferrals) {
      wrappers.add(HFReferalWrapper(hfReferrals: headMember));
    }

    return wrappers;
  }
}

@freezed
class HFReferalWrapperEvent with _$HFReferalWrapperEvent {
  const factory HFReferalWrapperEvent.loadFromGlobal({
    required GlobalSearchParameters searchParams,
  }) = HFReferalWrapperLoadFromGlobal;

  // CREATE HFReferal or related entities
  const factory HFReferalWrapperEvent.create(
      {required List<EntityModel> entities}) = Create;

// UPDATE HFReferal or related entities
  const factory HFReferalWrapperEvent.update(
      {required List<EntityModel> entities}) = Update;

// DELETE HFReferal or related entities
  const factory HFReferalWrapperEvent.delete(
      {required List<EntityModel> entities}) = Delete;

  const factory HFReferalWrapperEvent.createAndUpdate({
    required List<EntityModel> entitiesToCreate,
    required List<EntityModel> entitiesToUpdate,
  }) = CreateAndUpdate;

  const factory HFReferalWrapperEvent.clear() = HFReferalWrapperClear;
}

@freezed
class HFReferalWrapperState with _$HFReferalWrapperState {
  const factory HFReferalWrapperState({
    @Default(false) bool loading,
    @Default([]) List<HFReferalWrapper> hFReferalMembers,
    int? offset,
    int? limit,
    String? error,
    @Default(0) int totalCount,
    @Default(HFReferalWrapperActionType.none)
    HFReferalWrapperActionType lastAction,
  }) = _HFReferalWrapperState;
}

@freezed
class HFReferalWrapper with _$HFReferalWrapper {
  const factory HFReferalWrapper({
    HFReferralModel? hfReferrals,
  }) = _HFReferalWrapper;
}

enum HFReferalWrapperActionType {
  none,
  created,
  updated,
  deleted,
  createAndUpdate
}
