import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:battery_plus/battery_plus.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recase/recase.dart';

import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../data/network_manager.dart';
import '../data/remote_client.dart';
import '../data/repositories/remote/bandwidth_check.dart';
import '../models/bandwidth/bandwidth_model.dart';
import '../widgets/network_manager_provider_wrapper.dart';
import 'environment_config.dart';
import 'utils.dart';

final LocalSqlDataStore _sql = LocalSqlDataStore();
late Dio _dio;
Future<Isar> isarFuture = Constants().isar;

Future<void> initializeService(dio, isar) async {
  if (Isar.getInstance('HCM') == null) {
    final info = await PackageInfo.fromPlatform();
    await Constants().initialize(info.version);
  }

  final service = FlutterBackgroundService();
  const notificationId = 888;
  // this will be used as notification channel id
  const notificationChannelId = 'my_foreground';
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId, // id
    'Background Sync', // title
    description: 'Background sync triggered.', // description
    importance: Importance.high, // importance must be at low or higher level
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  requestDisableBatteryOptimization();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,
      autoStartOnBoot: false,
      // auto start service
      autoStart: false,
      isForegroundMode: true,
      initialNotificationContent:
          'BackGround Service Started at ${DateTime.now()}',
      initialNotificationTitle: 'Background service',
      notificationChannelId: notificationChannelId,
      foregroundServiceNotificationId: notificationId,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: false,
      onForeground: onStart,
      // this will be executed when app is in foreground in separated isolate

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  await envConfig.initialize();
  if (Isar.getInstance('HCM') == null) {
    final info = await PackageInfo.fromPlatform();
    await Constants().initialize(info.version);
  }

  _dio = DioClient().dio;
  final _isar = await isarFuture;

  final userRequestModel = await LocalSecureStore.instance.userRequestModel;

  final appConfiguration = await _isar.appConfigurations.where().findAll();
  final interval =
      appConfiguration.first.backgroundServiceConfig?.serviceInterval;
  final frequencyCount =
      appConfiguration.first.backgroundServiceConfig?.apiConcurrency;

  if (interval != null) {
    int i = 0;
    makePeriodicTimer(
      Duration(seconds: interval),
      (timer) async {
        var battery = Battery();
        final int batteryPercent = await battery.batteryLevel;
        if (batteryPercent <=
            appConfiguration
                .first.backgroundServiceConfig!.batteryPercentCutOff!) {
          service.stopSelf();
        } else {
          final FlutterLocalNotificationsPlugin
              flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          if (frequencyCount != null) {
            final serviceRegistryList =
                await _isar.serviceRegistrys.where().findAll();
            if (serviceRegistryList.isNotEmpty) {
              final bandwidthPath = serviceRegistryList
                  .firstWhere((element) => element.service == 'BANDWIDTH-CHECK')
                  .actions
                  .first
                  .path;

              List speedArray = [];
              for (var i = 0; i < frequencyCount; i++) {
                try {
                  final double speed = await BandwidthCheckRepository(
                    _dio,
                    bandwidthPath: bandwidthPath,
                  ).pingBandwidthCheck(bandWidthCheckModel: null);
                  speedArray.add(speed);
                } catch (e) {
                  service.invoke('serviceRunning', {
                    "enablesManualSync": true,
                  });
                  service.stopSelf();
                  break;
                }
              }
              double sum = speedArray.fold(0, (p, c) => p + c);

              int configuredBatchSize = getBatchSizeToBandwidth(
                sum / speedArray.length,
                appConfiguration,
              );
              final BandwidthModel bandwidthModel = BandwidthModel.fromJson({
                'userId': userRequestModel!.uuid,
                'batchSize': configuredBatchSize,
              });
              flutterLocalNotificationsPlugin.show(
                888,
                'Auto Sync',
                'Speed : ${double.tryParse(speedArray.firstOrNull.toString())?.toStringAsFixed(1)}Mb/ps - BatchSize : $configuredBatchSize',
                const NotificationDetails(
                  android: AndroidNotificationDetails(
                    "my_foreground",
                    'AUTO SYNC',
                    icon: 'ic_bg_service_small',
                    ongoing: true,
                  ),
                ),
              );
              final isSyncCompleted = await const NetworkManager(
                configuration: NetworkManagerConfiguration(
                  persistenceConfig: PersistenceConfiguration.offlineFirst,
                ),
              ).performSync(
                localRepositories: Constants.getLocalRepositories(
                  _sql,
                  _isar,
                ).toList(),
                remoteRepositories: Constants.getRemoteRepositories(
                  _dio,
                  getActionMap(serviceRegistryList),
                ),
                bandwidthModel: bandwidthModel,
                service: service,
              );

              i++;
              final isAppInActive =
                  await LocalSecureStore.instance.isAppInActive;

              if (isSyncCompleted && i >= 2 && isAppInActive) {
                service.stopSelf();
              }
            }
          }
        }
      },
      fireNow: true,
    );
  }
}

getActionMap(List<ServiceRegistry> serviceRegistryList) {
  return serviceRegistryList
      .map((e) => e.actions.map((e) {
            ApiOperation? operation;
            DataModelType? type;

            operation = ApiOperation.values.firstWhereOrNull((element) {
              return e.action.camelCase == element.name;
            });

            type = DataModelType.values.firstWhereOrNull((element) {
              return e.entityName.camelCase == element.name;
            });

            if (operation == null || type == null) return null;

            return ActionPathModel(
              operation: operation,
              type: type,
              path: e.path,
            );
          }))
      .expand((element) => element)
      .whereNotNull()
      .fold(
    <DataModelType, Map<ApiOperation, String>>{},
    (Map<DataModelType, Map<ApiOperation, String>> o, element) {
      if (o.containsKey(element.type)) {
        o[element.type]?.addEntries(
          [MapEntry(element.operation, element.path)],
        );
      } else {
        o[element.type] = Map.fromEntries([
          MapEntry(element.operation, element.path),
        ]);
      }

      return o;
    },
  );
}

int getBatchSizeToBandwidth(
  double speed,
  List<AppConfiguration> appConfiguration, {
  bool isDownSync = false,
}) {
  int batchSize = 1;
  final bandwidthBatchSizeConfig = isDownSync
      ? appConfiguration.first.downSyncBandwidthBatchSize
      : appConfiguration.first.bandwidthBatchSize;

  final batchResult = bandwidthBatchSizeConfig
      ?.where(
        (element) => speed >= element.minRange && speed <= element.maxRange,
      )
      .toList();
  if (batchResult != null) {
    if (batchResult.isNotEmpty) {
      batchSize = int.parse(batchResult.first.batchSize.toString());
    } else if (speed >=
        appConfiguration.first.bandwidthBatchSize!.last.maxRange) {
      batchSize = appConfiguration.first.bandwidthBatchSize!.last.batchSize;
    } else if (speed <=
        appConfiguration.first.bandwidthBatchSize!.first.maxRange) {
      batchSize = appConfiguration.first.bandwidthBatchSize!.first.batchSize;
    }
  }

  return batchSize;
}
