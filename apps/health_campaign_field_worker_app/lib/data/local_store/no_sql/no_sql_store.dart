import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'schema/app_configuration.dart';
import 'schema/localization.dart';
import 'schema/oplog.dart';
import 'schema/row_versions.dart';
import 'schema/service_registry.dart';

/// Exposes an instance of [isar] object that can be used to access the system's
/// NoSQL data store
///
/// The [initialize] method needs to be called before attempting to access
/// [isar] object. An exception will be thrown otherwise
class NoSqlStore {
  static NoSqlStore get instance => _instance;
  static final NoSqlStore _instance = NoSqlStore._();

  Isar? _isar;

  NoSqlStore._();

  Isar get isar {
    final isar = _isar;
    if (isar == null) {
      throw StoreNotInitializedException();
    }

    return isar;
  }

  FutureOr<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = Isar.open(
      [
        ServiceRegistrySchema,
        LocalizationWrapperSchema,
        AppConfigurationSchema,
        OpLogSchema,
        RowVersionListSchema,
      ],
      directory: directory.path,
      name: 'HCM',
      inspector: true,
      relaxedDurability: false,
    );
    _isar = await isar;
  }
}

class StoreNotInitializedException implements Exception {}
