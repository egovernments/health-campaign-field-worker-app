import 'package:digit_data_model/data_model.dart';

import '../data/sync_entity_mapper_listener.dart';

class SyncServiceSingleton {
  static final SyncServiceSingleton _instance =
      SyncServiceSingleton._internal();
  factory SyncServiceSingleton() => _instance;
  SyncServiceSingleton._internal();
  static SyncServiceSingleton get instance => _instance;

  SyncEntityMapperListener? _entityListener;
  late int _syncDownRetryCount = 0;
  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setData({
    required int syncDownRetryCount,
    required PersistenceConfiguration persistenceConfiguration,
    required SyncEntityMapperListener entityMapper,
  }) {
    _syncDownRetryCount = syncDownRetryCount;
    _persistenceConfiguration = persistenceConfiguration;
    _entityListener = entityMapper;
  }

  SyncEntityMapperListener? get entityMapper => _entityListener;
  int get syncDownRetryCount => _syncDownRetryCount;
  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;
}
