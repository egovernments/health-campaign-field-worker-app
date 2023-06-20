import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/local_store/no_sql/schema/localization.dart';
import 'data/local_store/no_sql/schema/oplog.dart';
import 'data/local_store/no_sql/schema/service_registry.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/remote_client.dart';
import 'router/app_router.dart';
import 'utils/environment_config.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Bloc.observer = AppBlocObserver();
  await AppSharedPreferences().init();

  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'main');
    await AppSharedPreferences().appLaunchedFirstTime();
    await LocalSecureStore.instance.deleteAll();
  }

  await envConfig.initialize();
  DigitUi.instance.initThemeComponents();

  final isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConfigurationSchema,
    OpLogSchema,
  ]);

  final sql = LocalSqlDataStore();

  runApp(
    MainApplication(
      appRouter: AppRouter(),
      isar: isar,
      client: DioClient().dio,
      sql: sql,
    ),
  );
}
