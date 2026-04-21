import 'dart:io';
import 'dart:ui';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'notification_service.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/remote_client.dart';
import 'pages/error_boundary.dart';
import 'router/app_router.dart';
import 'utils/background_service.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';
import 'widgets/db_error_handler.dart';

late LocalSqlDataStore _sql;
late Dio _dio;
late Isar _isar;
int i = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DartPluginRegistrant.ensureInitialized();

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

  // Security checks - enforce exit only in production environment
  if (!kDebugMode) {
    try {
      final issues = await JailbreakRootDetection.instance.checkForIssues;
      if (issues.isNotEmpty) {
        debugPrint('Security warning: ${issues.join(', ')}');
        if (envConfig.variables.envType == EnvType.prod) {
          exit(0);
        }
      }
    } catch (e) {
      debugPrint('Security check failed: $e');
    }
  }
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  _dio = DioClient().dio;

  DigitUi.instance.initThemeComponents();
  await Constants().initialize(info.version);
  _isar = await Constants().isar;

  // Initialize encrypted database
  final encryptionKey =
      await LocalSecureStore.instance.getOrCreateDbEncryptionKey();

  // Migrate existing unencrypted database to encrypted (if needed)
  final migrationResult =
      await LocalSqlDataStore.migrateToEncrypted(encryptionKey);

  // Handle key mismatch - show error and delete database
  if (migrationResult == DatabaseMigrationResult.keyMismatch) {
    runApp(DatabaseErrorApp(
      onRetry: () async {
        // Delete the inaccessible database
        await LocalSqlDataStore.deleteDatabase();
        // Clear secure storage to reset encryption key
        await LocalSecureStore.instance.deleteAll();
        // Restart the app - user needs to manually restart
      },
    ));
    return;
  }

  // Create the encrypted database instance
  _sql = LocalSqlDataStore(encryptionKey: encryptionKey);

  await initializeService(_dio, _isar);

  // Register FCM background message handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
      setBgRunning(false);
      final isRunning = await FlutterBackgroundService().isRunning();
      final localSecureStore = LocalSecureStore.instance,
          isBgRunning = await localSecureStore.isBackgroundSerivceRunning;
      if (!isRunning && isBgRunning) {}
    }
  }
}
