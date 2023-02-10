import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/local_store/no_sql/schema/localization.dart';
import 'data/local_store/no_sql/schema/oplog.dart';
import 'data/local_store/no_sql/schema/service_registry.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/remote_client.dart';
import 'router/app_router.dart';
import 'utils/environment_config.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await envConfig.initialize();
  DigitUi.instance.initThemeComponents();

  final isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConfigurationSchema,
    OpLogSchema,
  ]);

  final sql = LocalSqlDataStore();

  // for (var element in sql.allTables) {
  //   final count = await (sql.delete(element)
  //         ..where(
  //           (tbl) => const Constant(true),
  //         ))
  //       .go();
  //   print('${element.tableName}: $count');
  // }

  Dio client = Client().init();

  runApp(
    MainApplication(
      appRouter: AppRouter(),
      isar: isar,
      client: client,
      sql: sql,
    ),
  );
}
