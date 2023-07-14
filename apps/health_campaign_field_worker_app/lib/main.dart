import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:digit_firebase_services/digit_firebase_services.dart'
    as firebase_services;
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utils/background_service.dart';
import 'package:isar/isar.dart';
import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/local_store/no_sql/schema/localization.dart';
import 'data/local_store/no_sql/schema/oplog.dart';
import 'data/local_store/no_sql/schema/row_versions.dart';
import 'data/local_store/no_sql/schema/service_registry.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/remote_client.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';

final LocalSqlDataStore _sql = LocalSqlDataStore();
late Dio _dio;
int i = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await AppSharedPreferences().init();

  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'main');
    await AppSharedPreferences().appLaunchedFirstTime();
    await LocalSecureStore.instance.deleteAll();
  }

  await envConfig.initialize();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  _dio = DioClient().dio;

  DigitUi.instance.initThemeComponents();

  await initializeService(_dio);
  if (Isar.getInstance('HCM') == null) {
    await Constants().initialize();
  }
  final isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConfigurationSchema,
    OpLogSchema,
    RowVersionListSchema,
  ]);

  final appConfigs = await isar.appConfigurations.where().findAll();
  final config = appConfigs.firstOrNull;

  final enableCrashlytics = config?.firebaseConfig?.enableCrashlytics ?? false;
  if (enableCrashlytics) {
    firebase_services.initialize(
      options: DefaultFirebaseOptions.currentPlatform,
      onErrorMessage: (value) {
        AppLogger.instance.error(title: 'CRASHLYTICS', message: value);
      },
    );
  }

  runApp(
    MainApplication(
      appRouter: AppRouter(),
      isar: Constants().isar,
      client: _dio,
      sql: _sql,
    ),
  );
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      setBgRunning(true);
      // Stop the background service when the app is terminated
    } else if (state == AppLifecycleState.resumed) {
      // Stop the background service when the app is terminated
      setBgRunning(false);
      final isRunning = await FlutterBackgroundService().isRunning();
      final localSecureStore = LocalSecureStore.instance,
          isBgRunning = await localSecureStore.isBackgroundSerivceRunning;
      if (!isRunning && isBgRunning) {}
    }
  }
}
