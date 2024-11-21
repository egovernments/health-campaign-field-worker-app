// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:sync_service/utils/utils.dart';

import '../../data/sync_service.dart';
import '../../models/bandwidth/bandwidth_model.dart';

part 'sync.freezed.dart';

typedef SyncEmitter = Emitter<SyncState>;

// This is the `SyncBloc` class which extends `Bloc<SyncEvent, SyncState>`.
//
// It handles the state management for sync operations.
class SyncBloc extends Bloc<SyncEvent, SyncState> {
  // The `Isar` instance used for database operations.
  final Isar isar;
  // The `SyncService` instance used for sync operations.
  final SyncService syncService;

  // The constructor for `SyncBloc`.
  // It requires an `Isar` instance and a `SyncService` instance.
  SyncBloc({
    required this.isar,
    required this.syncService,
  }) : super(const SyncPendingState()) {
    // Registering event handlers.
    on(_handleRefresh);
    on(_handleSyncUp);
  }

  // This method handles the `SyncRefreshEvent`.
  // It emits a new state based on the result of the refresh operation.
  FutureOr<void> _handleRefresh(
    SyncRefreshEvent event,
    SyncEmitter emit,
  ) async {
    final previousCount = state.maybeWhen(
      pendingSync: (count) => count,
      orElse: () => 0,
    );

    int? length = event.count;
    emit(const SyncState.loading());
    try {
      length ??= (SyncServiceSingleton().entityMapper!.getSyncCount(isar.opLogs
              .filter()
              .createdByEqualTo(event.createdBy)
              .syncedUpEqualTo(false)
              .findAllSync()) +
          SyncServiceSingleton().entityMapper!.getSyncCount(isar.opLogs
              .filter()
              .createdByEqualTo(event.createdBy)
              .syncedUpEqualTo(true)
              .syncedDownEqualTo(false)
              .findAllSync()));
    } catch (_) {
      rethrow;
    } finally {
      emit(SyncPendingState(count: length ?? previousCount));
    }
  }

  // This method handles the `SyncSyncUpEvent`.
  // It emits a new state based on the result of the sync up operation.
  FutureOr<void> _handleSyncUp(
    SyncSyncUpEvent event,
    SyncEmitter emit,
  ) async {
    try {
      final BandwidthModel bandwidthModel = BandwidthModel.fromJson({
        'userId': event.userId,
        'batchSize': 5,
      });
      emit(const SyncInProgressState());
      await syncService.performSync(
        localRepositories: event.localRepositories,
        remoteRepositories: event.remoteRepositories,
        bandwidthModel: bandwidthModel,
      );
      emit(const SyncCompletedState());
    } on SyncError catch (error) {
      if (error is SyncDownError) {
        emit(const DownSyncFailedState());
      } else {
        emit(const UpSyncFailedState());
      }

      rethrow;
    } catch (error) {
      emit(const SyncFailedState());
      rethrow;
    } finally {
      add(SyncRefreshEvent(event.userId));
    }
  }
}

// This is the `SyncEvent` class which is a freezed union of different types of sync events.
@freezed
class SyncEvent with _$SyncEvent {
  // The `SyncRefreshEvent` represents a refresh event.
  const factory SyncEvent.refresh(String createdBy, [int? count]) =
      SyncRefreshEvent;

  // The `SyncSyncUpEvent` represents a sync up event.
  const factory SyncEvent.syncUp({
    required String userId,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) = SyncSyncUpEvent;
}

// This is the `SyncState` class which is a freezed union of different types of sync states.
@freezed
class SyncState with _$SyncState {
  // The `SyncLoadingState` represents a loading state.
  const factory SyncState.loading() = SyncLoadingState;

  // The `SyncInProgressState` represents a sync in progress state.
  const factory SyncState.syncInProgress() = SyncInProgressState;

  // The `SyncPendingState` represents a pending sync state.
  const factory SyncState.pendingSync({@Default(0) int count}) =
      SyncPendingState;

  // The `SyncCompletedState` represents a completed sync state.
  const factory SyncState.completedSync() = SyncCompletedState;

  // The `SyncFailedState` represents a failed sync state.
  const factory SyncState.failedSync() = SyncFailedState;

  // The `DownSyncFailedState` represents a failed down sync state.
  const factory SyncState.failedDownSync() = DownSyncFailedState;

  // The `UpSyncFailedState` represents a failed up sync state.
  const factory SyncState.failedUpSync() = UpSyncFailedState;
}
