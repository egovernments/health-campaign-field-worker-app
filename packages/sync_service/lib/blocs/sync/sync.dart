// GENERATED using mason_cli
import 'dart:async';
import 'dart:io';

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
      final entityMapper = SyncServiceSingleton().entityMapper;
      if (entityMapper != null && length == null) {
        final results = await Future.wait([
          isar.opLogs
              .filter()
              .createdByEqualTo(event.createdBy)
              .syncedUpEqualTo(false)
              .findAll(),
          isar.opLogs
              .filter()
              .createdByEqualTo(event.createdBy)
              .syncedUpEqualTo(true)
              .syncedDownEqualTo(false)
              .findAll(),
        ]);
        length = entityMapper.getSyncCount(results[0]) +
            entityMapper.getSyncCount(results[1]);
      }
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
      final isSyncCompleted = await syncService.performSync(
        localRepositories: event.localRepositories,
        remoteRepositories: event.remoteRepositories,
        bandwidthModel: bandwidthModel,
      );
      if (isSyncCompleted) {
        emit(const SyncCompletedState());
      } else {
        // Lock was held by another sync — nothing happened.
        emit(const SyncPendingState());
      }
    } on SyncError catch (error, stackTrace) {
      final message = _extractErrorMessage(error.error);
      if (error is SyncDownError) {
        emit(DownSyncFailedState(message: message));
      } else {
        emit(UpSyncFailedState(message: message));
      }
      // Report via BlocObserver (for Firebase/logging) without crashing the app
      addError(error, stackTrace);
    } catch (error, stackTrace) {
      emit(SyncFailedState(message: _extractErrorMessage(error)));
      addError(error, stackTrace);
    } finally {
      add(SyncRefreshEvent(event.userId));
    }
  }

  /// Extracts a user-facing error key/message from the underlying exception.
  /// Returns localization keys (SYNC_DIALOG_*) when possible so the UI
  /// can translate them; falls back to the raw error string otherwise.
  /// Appends the failed API path when available.
  String _extractErrorMessage(dynamic error) {
    if (error is SocketException) {
      return 'SYNC_DIALOG_NO_INTERNET_CONNECTION';
    }
    if (error is TimeoutException) {
      return 'SYNC_DIALOG_CONNECTION_TIMED_OUT';
    }
    if (error is HttpException) {
      return 'SYNC_DIALOG_SERVER_ERROR';
    }
    final errorString = error.toString();

    // Extract API path early (works for DioException and enriched errors)
    final apiPath = _extractApiPath(errorString);

    // Check for HTTP status codes first — these are the most specific signals
    // and should take priority over transport-level errors like SocketException.
    // Matches both Dio's "status code of 500" and enriched "Status: 500" formats.
    final statusMatch = RegExp(r'status(?:\s+code\s+of\s+|\s*:\s*)(\d{3})')
        .firstMatch(errorString.toLowerCase());
    if (statusMatch != null) {
      final statusCode = int.tryParse(statusMatch.group(1)!);
      if (statusCode != null) {
        String key;
        if (statusCode == 401) {
          key = 'SYNC_DIALOG_SESSION_EXPIRED';
        } else if (statusCode >= 500) {
          key = 'SYNC_DIALOG_SERVER_ERROR';
        } else if (statusCode >= 400) {
          key = 'SYNC_DIALOG_SERVER_ERROR';
        } else {
          key = 'SYNC_DIALOG_NETWORK_ERROR';
        }
        return apiPath != null ? '$key\n[$apiPath]' : key;
      }
    }

    // Transport-level errors (no HTTP status code available)
    if (errorString.contains('connection timeout') ||
        errorString.contains('send timeout') ||
        errorString.contains('receive timeout')) {
      final key = 'SYNC_DIALOG_CONNECTION_TIMED_OUT';
      return apiPath != null ? '$key\n[$apiPath]' : key;
    }
    if (errorString.contains('SocketException') ||
        errorString.contains('Connection refused') ||
        errorString.contains('Connection reset')) {
      final key = 'SYNC_DIALOG_NO_INTERNET_CONNECTION';
      return apiPath != null ? '$key\n[$apiPath]' : key;
    }
    if (errorString.contains('DioException')) {
      final key = 'SYNC_DIALOG_NETWORK_ERROR';
      return apiPath != null ? '$key\n[$apiPath]' : key;
    }
    return errorString;
  }

  /// Extracts the API path from a DioException string.
  /// Looks for patterns like "uri=https://host/path" or "/path/to/api".
  String? _extractApiPath(String errorString) {
    // Match uri= pattern from DioException
    final uriMatch = RegExp(r'uri[=:]\s*(https?://[^\s,\]]+)').firstMatch(errorString);
    if (uriMatch != null) {
      try {
        final uri = Uri.parse(uriMatch.group(1)!);
        return uri.path;
      } catch (_) {
        return uriMatch.group(1);
      }
    }
    return null;
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
  const factory SyncState.failedSync({@Default('') String message}) =
      SyncFailedState;

  // The `DownSyncFailedState` represents a failed down sync state.
  const factory SyncState.failedDownSync({@Default('') String message}) =
      DownSyncFailedState;

  // The `UpSyncFailedState` represents a failed up sync state.
  const factory SyncState.failedUpSync({@Default('') String message}) =
      UpSyncFailedState;
}
