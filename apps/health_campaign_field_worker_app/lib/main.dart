import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:isar/isar.dart';
import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/remote_client.dart';
import 'pages/error_boundary.dart';
import 'router/app_router.dart';
import 'utils/background_service.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';

final LocalSqlDataStore _sql = LocalSqlDataStore();
late Dio _dio;
late Isar _isar;
int i = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeAllMappers();
  final info = await PackageInfo.fromPlatform();
  setupErrorWidget();

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
  await Constants().initialize(info.version);
  _isar = await Constants().isar;
  await initializeService(_dio, _isar);

  runApp(MainApplication(
    appRouter: AppRouter(),
    isar: _isar,
    client: _dio,
    sql: _sql,
  ));
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final localSecureStore = LocalSecureStore.instance;
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
