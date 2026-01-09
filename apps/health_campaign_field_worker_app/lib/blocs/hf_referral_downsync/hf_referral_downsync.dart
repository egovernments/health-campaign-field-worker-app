import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sync_service/sync_service_lib.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../models/hf_referral_downsync/hf_referral_downsync.dart';
import '../../utils/background_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'hf_referral_downsync.freezed.dart';

typedef HFReferralDownSyncEmitter = Emitter<HFReferralDownSyncState>;

class HFReferralDownSyncBloc
    extends Bloc<HFReferralDownSyncEvent, HFReferralDownSyncState> {
  final LocalRepository<HFReferralModel, HFReferralSearchModel>
      hfReferralLocalRepository;
  final RemoteRepository<HFReferralDownsyncModel, HFReferralDownsyncSearchModel>
      hfReferralDownSyncRemoteRepository;
  final LocalRepository<HFReferralDownsyncModel, HFReferralDownsyncSearchModel>
      hfReferralDownSyncLocalRepository;
  final BandwidthCheckRepository bandwidthCheckRepository;

  HFReferralDownSyncBloc({
    required this.hfReferralLocalRepository,
    required this.hfReferralDownSyncRemoteRepository,
    required this.hfReferralDownSyncLocalRepository,
    required this.bandwidthCheckRepository,
  }) : super(const HFReferralDownSyncState._()) {
    on<HFReferralDownSyncDownloadEvent>(_handleDownSyncOfHFReferrals);
    on<HFReferralDownSyncCheckTotalCountEvent>(_handleCheckTotalCount);
    on<HFReferralDownSyncResetStateEvent>(_handleDownSyncResetState);
    on<HFReferralDownSyncReportEvent>(_handleDownSyncReport);
    on<HFReferralDownSyncGetBatchSizeEvent>(_handleCheckBandWidth);
  }

  FutureOr<void> _handleDownSyncResetState(
    HFReferralDownSyncResetStateEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    emit(const HFReferralDownSyncState.resetState());
  }

  FutureOr<void> _handleCheckBandWidth(
    HFReferralDownSyncGetBatchSizeEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    try {
      emit(const HFReferralDownSyncState.resetState());
      emit(const HFReferralDownSyncState.loading(false));
      List speedArray = [];

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );
      speedArray.add(speed);
      double sum = speedArray.fold(0, (p, c) => p + c);
      int configuredBatchSize = getBatchSizeToBandwidth(
        sum / speedArray.length,
        event.appConfiguration,
        isDownSync: true,
      );
      emit(HFReferralDownSyncState.getBatchSize(
        configuredBatchSize,
        event.projectId,
        event.boundaryCode,
        event.pendingSyncCount,
        event.boundaryName,
      ));
    } catch (e) {
      emit(const HFReferralDownSyncState.resetState());
      emit(const HFReferralDownSyncState.totalCountCheckFailed());
    }
  }

  FutureOr<void> _handleCheckTotalCount(
    HFReferralDownSyncCheckTotalCountEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    if (event.pendingSyncCount > 0) {
      emit(const HFReferralDownSyncState.loading(true));
      emit(const HFReferralDownSyncState.pendingSync());
    } else {
      emit(const HFReferralDownSyncState.loading(true));
      await LocalSecureStore.instance.setManualSyncTrigger(true);
      final existingDownSyncData = await hfReferralDownSyncLocalRepository
          .search(HFReferralDownsyncSearchModel(
        locality: event.boundaryCode,
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      // To get the server totalCount
      final initialResults =
          await hfReferralDownSyncRemoteRepository.downSync(
        HFReferralDownsyncSearchModel(
          locality: event.boundaryCode,
          offset: existingDownSyncData.firstOrNull?.offset ?? 0,
          limit: 0,
          isDeleted: true,
          lastSyncedTime: lastSyncedTime,
          tenantId: envConfig.variables.tenantId,
          projectId: event.projectId,
        ),
      );
      if (initialResults.isNotEmpty) {
        int serverTotalCount =
            initialResults["HFReferralDownsyncCriteria"]["totalCount"];

        emit(HFReferralDownSyncState.dataFound(
          serverTotalCount,
          event.batchSize,
        ));
      } else {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const HFReferralDownSyncState.resetState());
        emit(const HFReferralDownSyncState.totalCountCheckFailed());
      }
    }
  }

  FutureOr<void> _handleDownSyncOfHFReferrals(
    HFReferralDownSyncDownloadEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    emit(const HFReferralDownSyncState.loading(true));
    double? diskSpace = 0;
    diskSpace = await DiskSpace.getFreeDiskSpace;
    // diskSpace in MB * 1000 comparison with serverTotalCount * 150KB * 2
    if ((diskSpace ?? 0) * 1000 < (event.initialServerCount * 150 * 2)) {
      emit(const HFReferralDownSyncState.insufficientStorage());
    } else {
      try {
        while (true) {
          final existingDownSyncData = await hfReferralDownSyncLocalRepository
              .search(HFReferralDownsyncSearchModel(
            locality: event.boundaryCode,
          ));

          int offset = existingDownSyncData.isEmpty
              ? 0
              : existingDownSyncData.first.offset ?? 0;
          int totalCount = event.initialServerCount;
          int? lastSyncedTime = existingDownSyncData.isEmpty
              ? null
              : existingDownSyncData.first.lastSyncedTime;
          if (existingDownSyncData.isEmpty) {
            await hfReferralDownSyncLocalRepository
                .create(HFReferralDownsyncModel(
              offset: offset,
              limit: event.batchSize,
              lastSyncedTime: lastSyncedTime,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            ));
          }

          if (offset < totalCount) {
            emit(HFReferralDownSyncState.inProgress(offset, totalCount));
            // Make the batch API call
            final downSyncResults =
                await hfReferralDownSyncRemoteRepository.downSync(
              HFReferralDownsyncSearchModel(
                locality: event.boundaryCode,
                offset: offset,
                limit: event.batchSize,
                totalCount: totalCount,
                tenantId: envConfig.variables.tenantId,
                projectId: event.projectId,
                lastSyncedTime: lastSyncedTime,
                isDeleted: true,
              ),
            );
            emit(HFReferralDownSyncState.inProgress(
                offset,
                downSyncResults["HFReferralDownsyncCriteria"]["totalCount"]));

            if (downSyncResults.isNotEmpty) {
              await _writeToFile(event.projectId, event.boundaryCode,
                  event.boundaryName, downSyncResults);
              // Write HF referrals to local DB
              await SyncServiceSingleton()
                  .entityMapper
                  ?.writeToEntityDB(downSyncResults, [
                hfReferralLocalRepository,
              ]);
              totalCount =
                  downSyncResults["HFReferralDownsyncCriteria"]["totalCount"];

              await hfReferralDownSyncLocalRepository
                  .update(HFReferralDownsyncModel(
                offset: offset + event.batchSize,
                limit: event.batchSize,
                lastSyncedTime: lastSyncedTime,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
              ));
            } else {
              emit(const HFReferralDownSyncState.failed());
              await LocalSecureStore.instance.setManualSyncTrigger(false);
              break;
            }
          } else {
            await hfReferralDownSyncLocalRepository.update(
              existingDownSyncData.first.copyWith(
                offset: 0,
                limit: 0,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
                lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            final result = HFReferralDownsyncModel(
              offset: totalCount,
              lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            );
            await LocalSecureStore.instance.setManualSyncTrigger(false);
            emit(HFReferralDownSyncState.success(result));
            break;
          }
        }
      } catch (e) {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const HFReferralDownSyncState.failed());
      }
    }
  }

  Future<void> _writeToFile(
    String projectId,
    String selectedBoundaryCode,
    String selectedBoundaryName,
    Map<String, dynamic> response,
  ) async {
    Map<String, dynamic> storedData = {};

    final downloadsDirectory = await getDownloadsDirectory();
    if (downloadsDirectory == null) {
      if (kDebugMode) {
        print("Downloads directory is not available.");
      }
      return;
    }

    final file = await getHFReferralDownSyncFilePath();

    if (file.existsSync()) {
      final content = await file.readAsString();
      if (content.isNotEmpty) {
        storedData = jsonDecode(content);
      }
    } else {
      await file.create(recursive: true);
      await file.writeAsString(jsonEncode({}));
    }
    var downSyncModel = response["HFReferralDownsyncCriteria"];
    String offsetKey = '${downSyncModel["offset"]}';

    Map<String, dynamic> boundaryData = {
      "boundaryCode": selectedBoundaryCode,
      "boundaryName": selectedBoundaryName,
      "response": DataMapEncryptor().encryptWithRandomKey(response)
    };

    storedData[offsetKey] ??= {"totalCount": 0, "boundaries": []};
    storedData[offsetKey]["totalCount"] += downSyncModel["totalCount"];

    List<dynamic> boundaries = storedData[offsetKey]["boundaries"];

    bool exists = boundaries
        .any((entry) => entry["boundaryCode"] == selectedBoundaryCode);

    if (!exists) {
      boundaries.add(boundaryData);
      storedData[offsetKey]["boundaries"] = boundaries;

      if (kDebugMode) {
        print(
            "Added new boundary: $selectedBoundaryCode under offset: $offsetKey");
      }
    } else {
      if (kDebugMode) {
        print(
            "Boundary '$selectedBoundaryCode' already exists under offset $offsetKey.");
      }
    }

    String storedDataString = jsonEncode(storedData);
    debugPrint("Stored data: $storedDataString");

    await file.writeAsString(storedDataString);

    if (kDebugMode) {
      print("Data successfully written to ${file.path}");
    }
  }

  FutureOr<void> _handleDownSyncReport(
    HFReferralDownSyncReportEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    final result = await hfReferralDownSyncLocalRepository
        .search(HFReferralDownsyncSearchModel());
    emit(HFReferralDownSyncState.report(result));
  }
}

@freezed
class HFReferralDownSyncEvent with _$HFReferralDownSyncEvent {
  const factory HFReferralDownSyncEvent.downSync({
    required String projectId,
    required String boundaryCode,
    required int batchSize,
    required int initialServerCount,
    required String boundaryName,
  }) = HFReferralDownSyncDownloadEvent;

  const factory HFReferralDownSyncEvent.checkForData({
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required int batchSize,
    required String boundaryName,
  }) = HFReferralDownSyncCheckTotalCountEvent;

  const factory HFReferralDownSyncEvent.getBatchSize({
    required List<AppConfiguration> appConfiguration,
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required String boundaryName,
  }) = HFReferralDownSyncGetBatchSizeEvent;

  const factory HFReferralDownSyncEvent.downSyncReport() =
      HFReferralDownSyncReportEvent;

  const factory HFReferralDownSyncEvent.resetState() =
      HFReferralDownSyncResetStateEvent;
}

@freezed
class HFReferralDownSyncState with _$HFReferralDownSyncState {
  const HFReferralDownSyncState._();

  const factory HFReferralDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _HFReferralDownSyncInProgressState;

  const factory HFReferralDownSyncState.success(
    HFReferralDownsyncModel downSyncResult,
  ) = _HFReferralDownSyncSuccessState;

  const factory HFReferralDownSyncState.getBatchSize(
    int batchSize,
    String projectId,
    String boundaryCode,
    int pendingSyncCount,
    String boundaryName,
  ) = _HFReferralDownSyncGetBatchSizeState;

  const factory HFReferralDownSyncState.loading(bool isPop) =
      _HFReferralDownSyncLoadingState;

  const factory HFReferralDownSyncState.insufficientStorage() =
      _HFReferralDownSyncInsufficientStorageState;

  const factory HFReferralDownSyncState.dataFound(
    int initialServerCount,
    int batchSize,
  ) = _HFReferralDownSyncDataFoundState;

  const factory HFReferralDownSyncState.resetState() =
      _HFReferralDownSyncResetState;

  const factory HFReferralDownSyncState.totalCountCheckFailed() =
      _HFReferralDownSyncCountCheckFailedState;

  const factory HFReferralDownSyncState.failed() =
      _HFReferralDownSyncFailureState;

  const factory HFReferralDownSyncState.report(
    List<HFReferralDownsyncModel> downsyncCriteriaList,
  ) = _HFReferralDownSyncReportState;

  const factory HFReferralDownSyncState.pendingSync() =
      _HFReferralDownSyncPendingSyncState;
}
