import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_campaign_field_worker_app/utils/checkbandwidth.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';
import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/local_store/no_sql/schema/localization.dart';
import 'data/local_store/no_sql/schema/oplog.dart';
import 'data/local_store/no_sql/schema/service_registry.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/network_manager.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/bandwidth_check.dart';
import 'models/bandwidth/bandwidth_model.dart';
import 'models/data_model.dart';
import 'router/app_router.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';
import 'widgets/network_manager_provider_wrapper.dart';

late Isar _isar;
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
  DigitUi.instance.initThemeComponents();

  _dio = DioClient().dio;
  _isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConfigurationSchema,
    OpLogSchema,
  ]);

  await initializeService(_dio, _isar);
  runApp(
    MainApplication(
      appRouter: AppRouter(),
      isar: _isar,
      client: _dio,
      sql: _sql,
    ),
  );
}


// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   service.on('stopService').listen((event) {
//     print("on stop request invoked");
//     service.stopSelf();
//   });

//   Timer.periodic(const Duration(seconds: 5 * 60), (timer) async {
//     final userRequestModel = await LocalSecureStore.instance.userRequestModel;
//     await envConfig.initialize();
//     _dio = DioClient().dio;
//     if (i == 0) {
//       _isar = await Isar.open([
//         ServiceRegistrySchema,
//         LocalizationWrapperSchema,
//         AppConfigurationSchema,
//         OpLogSchema,
//       ]);
//       i++;
//     }
//     final serviceRegistryList = await _isar.serviceRegistrys.where().findAll();
//     if (serviceRegistryList.isNotEmpty) {
//       final bandwidthPath = serviceRegistryList
//           .firstWhere((element) => element.service == 'BANDWIDTH-CHECK')
//           .actions
//           .first
//           .path;

//       final appConfiguration = await _isar.appConfigurations.where().findAll();

//       final actionMap = (serviceRegistryList
//           .map((e) => e.actions.map((e) {
//                 ApiOperation? operation;
//                 DataModelType? type;

//                 operation = ApiOperation.values.firstWhereOrNull((element) {
//                   return e.action.camelCase == element.name;
//                 });

//                 type = DataModelType.values.firstWhereOrNull((element) {
//                   return e.entityName.camelCase == element.name;
//                 });

//                 if (operation == null || type == null) return null;

//                 return ActionPathModel(
//                   operation: operation,
//                   type: type,
//                   path: e.path,
//                 );
//               }))
//           .expand((element) => element)
//           .whereNotNull()
//           .fold(
//         <DataModelType, Map<ApiOperation, String>>{},
//         (Map<DataModelType, Map<ApiOperation, String>> o, element) {
//           if (o.containsKey(element.type)) {
//             o[element.type]?.addEntries(
//               [MapEntry(element.operation, element.path)],
//             );
//           } else {
//             o[element.type] = Map.fromEntries([
//               MapEntry(element.operation, element.path),
//             ]);
//           }

//           return o;
//         },
//       ));

//       if (userRequestModel?.uuid != null) {
//         final double speed =
//             await BandwidthCheckRepository(_dio, bandwidthPath: bandwidthPath)
//                 .pingBandwidthCheck(bandWidthCheckModel: null);
//         int batchSize = 1;
//         final batchResult = appConfiguration.first.bandwidthBatchSize
//             ?.where((element) =>
//                 element.minRange >= speed && element.maxRange <= speed)
//             .toList();
//         if (batchResult != null) {
//           if (batchResult.isNotEmpty) {
//             batchSize = int.parse(batchResult.first.batchSize.toString());
//           } else if (speed >=
//               appConfiguration.first.bandwidthBatchSize!.last.maxRange) {
//             batchSize =
//                 appConfiguration.first.bandwidthBatchSize!.last.batchSize;
//           } else if (speed <=
//               appConfiguration.first.bandwidthBatchSize!.first.maxRange) {
//             batchSize =
//                 appConfiguration.first.bandwidthBatchSize!.first.batchSize;
//           }
//         }

//         final BandwidthModel bandwidthModel = BandwidthModel.fromJson({
//           'userId': userRequestModel!.uuid,
//           'batchSize': batchSize,
//         });
//         const NetworkManager(
//           configuration: NetworkManagerConfiguration(
//             persistenceConfig: PersistenceConfiguration.offlineFirst,
//           ),
//         ).performSync(
//           localRepositories:
//               Constants.getLocalRepositories(_sql, _isar).toList(),
//           remoteRepositories: Constants.getRemoteRepositories(_dio, actionMap),
//           bandwidthModel: bandwidthModel,
//           service: service,
//         );
//       }
//     }
//   });
// }
