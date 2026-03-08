import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:sync_service/sync_service_lib.dart';

/// The `SyncServiceSingleton` class is a singleton that provides access to sync service related configurations and listeners.
///
/// This class provides methods to set and get sync service related data such as `syncDownRetryCount`, `persistenceConfiguration`, and `entityMapper`.
class SyncServiceSingleton {
  // Singleton instance
  static final SyncServiceSingleton _instance =
      SyncServiceSingleton._internal();

  // Factory constructor that returns the singleton instance
  factory SyncServiceSingleton() => _instance;

  // Private named constructor
  SyncServiceSingleton._internal();

  // Getter for the singleton instance
  static SyncServiceSingleton get instance => _instance;

  // Listener for sync entity mapper events
  SyncEntityMapperListener? _entityListener;

  SyncServiceRegistry? _registries;

  // Number of times to retry sync down operation
  late int _syncDownRetryCount = 0;

  // Configuration for persistence of data
  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  /// Sets the sync service related data.
  ///
  /// This method accepts `syncDownRetryCount`, `persistenceConfiguration`, and `entityMapper` as parameters and sets the corresponding properties.
  void setData({
    required int syncDownRetryCount,
    required PersistenceConfiguration persistenceConfiguration,
    required SyncEntityMapperListener entityMapper,
  }) {
    _syncDownRetryCount = syncDownRetryCount;
    _persistenceConfiguration = persistenceConfiguration;
    _entityListener = entityMapper;
  }

  void setRegistries(SyncServiceRegistry? registries) {
    _registries = registries;
  }

  // Getter for the sync entity mapper listener
  SyncEntityMapperListener? get entityMapper => _entityListener;

  SyncServiceRegistry? get registries => _registries;

  // Getter for the sync down retry count
  int get syncDownRetryCount => _syncDownRetryCount;

  // Getter for the persistence configuration
  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;

  // Stream controller for sync progress updates
  final _progressController = StreamController<SyncProgress>.broadcast();

  /// Stream of sync progress updates (which entity/operation is being synced).
  Stream<SyncProgress> get progressStream => _progressController.stream;

  /// Emits a sync progress update.
  void reportProgress(SyncProgress progress) {
    _progressController.add(progress);
  }
}

/// Represents the current sync operation in progress.
class SyncProgress {
  final String entityType;
  final String operation; // 'syncUp' or 'syncDown'
  final DataOperation? dataOperation; // create, update, delete etc.

  const SyncProgress({
    required this.entityType,
    required this.operation,
    this.dataOperation,
  });

  @override
  String toString() {
    final op = dataOperation?.name ?? operation;
    return '$op: $entityType';
  }
}
