import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
  FlowRegistry.setConfig(sampleFlows);
  WidgetRegistry().initializeDefaultWidgetRegistry();

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

final List<Map<String, dynamic>> sampleFlows = [
  {
    "screenType": "TEMPLATE",
    "name": "searchBeneficiary",
    "heading": "Search Beneficiary",
    "description": "Search using filters",
    "body": [
      {
        "format": "searchBar",
        "label": "Enter Name",
        "fieldName": "searchName",
        "onAction": {
          "action": "ONTAP",
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "ENTITY // INDIVIDUAL",
            "data": [
              {"key": "name", "value": "field.value", "operation": "contains"}
            ]
          }
        }
      },
      {
        "format": "button",
        "label": "Register New Beneficiary",
        "onAction": {
          "action": "ONTAP",
          "actionType": "NAVIGATION",
          "properties": {"type": "TEMPLATE", "name": "beneficiaryOverview"}
        }
      }
    ]
  },
  {
    "screenType": "TEMPLATE",
    "name": "beneficiaryOverview",
    "heading": "Beneficiary Details",
    "description": "Overview of selected beneficiary",
    "body": [
      {
        "format": "card",
        "child": {
          "format": "column",
          "children": [
            {"format": "text", "value": "Name: {{item.name}}"},
            {"format": "text", "value": "Address: {{item.address}}"},
            {
              "format": "button",
              "label": "Edit",
              "onAction": {
                "action": "ONTAP",
                "actionType": "NAVIGATION",
                "properties": {"type": "TEMPLATE", "name": "editBeneficiary"}
              }
            }
          ]
        }
      }
    ]
  },
  {
    "screenType": "TEMPLATE",
    "name": "editBeneficiary",
    "heading": "Edit Beneficiary",
    "description": "Modify details",
    "body": [
      {
        "format": "switch",
        "label": "Is Head of Household?",
        "fieldName": "isHead",
        "onAction": {
          "action": "ONTAP",
          "actionType": "UPDATE_EVENT",
          "properties": {
            "entity": "INDIVIDUAL",
            "data": [
              {"key": "isHead", "value": "field.value"}
            ]
          }
        }
      },
      {
        "format": "button",
        "label": "Save & Go to Home",
        "onAction": {
          "action": "ONTAP",
          "actionType": "NAVIGATION",
          "properties": {"type": "TEMPLATE", "name": "searchBeneficiary"}
        }
      }
    ]
  }
];
