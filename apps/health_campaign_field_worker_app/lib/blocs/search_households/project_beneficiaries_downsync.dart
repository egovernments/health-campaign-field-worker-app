// GENERATED using mason_cli
import 'dart:async';

import 'package:disk_space/disk_space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/network_manager.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../models/data_model.dart';
import '../../utils/background_service.dart';
import '../../utils/environment_config.dart';

part 'project_beneficiaries_downsync.freezed.dart';

typedef BeneficiaryDownSyncEmitter = Emitter<BeneficiaryDownSyncState>;

class BeneficiaryDownSyncBloc
    extends Bloc<BeneficiaryDownSyncEvent, BeneficiaryDownSyncState> {
  final RemoteRepository<DownsyncModel, DownsyncSearchModel>
      downSyncRemoteRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;
  final LocalRepository<HouseholdModel, HouseholdSearchModel>
      householdLocalRepository;
  final LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMemberLocalRepository;
  final LocalRepository<IndividualModel, IndividualSearchModel>
      individualLocalRepository;
  final LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryLocalRepository;
  final LocalRepository<TaskModel, TaskSearchModel> taskLocalRepository;
  final LocalRepository<SideEffectModel, SideEffectSearchModel>
      sideEffectLocalRepository;
  final LocalRepository<ReferralModel, ReferralSearchModel>
      referralLocalRepository;
  final NetworkManager networkManager;
  final BandwidthCheckRepository bandwidthCheckRepository;
  BeneficiaryDownSyncBloc({
    required this.downSyncRemoteRepository,
    required this.downSyncLocalRepository,
    required this.householdLocalRepository,
    required this.householdMemberLocalRepository,
    required this.individualLocalRepository,
    required this.projectBeneficiaryLocalRepository,
    required this.taskLocalRepository,
    required this.sideEffectLocalRepository,
    required this.referralLocalRepository,
    required this.networkManager,
    required this.bandwidthCheckRepository,
  }) : super(const BeneficiaryDownSyncState._()) {
    on(_handleDownSyncOfBeneficiaries);
    on(_handleCheckTotalCount);
    on(_handleDownSyncResetState);
    on(_handleDownSyncReport);
    on(_handleCheckBandWidth);
  }

  FutureOr<void> _handleDownSyncResetState(
    DownSyncResetStateEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    emit(const BeneficiaryDownSyncState.resetState());
  }

  FutureOr<void> _handleCheckBandWidth(
    DownSyncGetBatchSizeEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    try {
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.loading(false));
      List speedArray = [];

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );
      speedArray.add(speed);
      double sum = speedArray.fold(0, (p, c) => p + c);
      int configuredBatchSize = getBatchSizeToBandwidth(
        sum / speedArray.length,
        event.appConfiguration,
      );
      emit(BeneficiaryDownSyncState.getBatchSize(
        configuredBatchSize,
        event.projectId,
        event.boundaryCode,
        event.pendingSyncCount,
        event.boundaryName,
      ));
    } catch (e) {
      emit(const BeneficiaryDownSyncState.resetState());
      emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
    }
  }

  FutureOr<void> _handleCheckTotalCount(
    DownSyncCheckTotalCountEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    if (event.pendingSyncCount > 0) {
      emit(const BeneficiaryDownSyncState.loading(true));
      emit(const BeneficiaryDownSyncState.pendingSync());
    } else {
      emit(const BeneficiaryDownSyncState.loading(true));
      await LocalSecureStore.instance.setManualSyncTrigger(true);
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: event.boundaryCode,
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      //To get the server totalCount,
      final initialResults = await downSyncRemoteRepository.downSync(
        DownsyncSearchModel(
          locality: event.boundaryCode,
          offset: existingDownSyncData.firstOrNull?.offset ?? 0,
          limit: 1,
          isDeleted: true,
          lastSyncedTime: lastSyncedTime,
          tenantId: envConfig.variables.tenantId,
          projectId: event.projectId,
        ),
      );
      if (initialResults.isNotEmpty) {
        // Current response from server is String, Expecting it to be int
        //[TODO: Need to move the dynamic keys to constants
        int serverTotalCount = initialResults["DownsyncCriteria"]["totalCount"];

        emit(BeneficiaryDownSyncState.dataFound(
          serverTotalCount,
          event.batchSize,
        ));
      } else {
        emit(const BeneficiaryDownSyncState.resetState());
        emit(const BeneficiaryDownSyncState.totalCountCheckFailed());
      }
    }
  }

  FutureOr<void> _handleDownSyncOfBeneficiaries(
    DownSyncBeneficiaryEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    emit(const BeneficiaryDownSyncState.loading(true));
    double? diskSpace = 0;
    // [TODO: Move the function DiskSpace.getFreeDiskSpace to utils
    diskSpace = await DiskSpace
        .getFreeDiskSpace; // Returns the device available space in MB
    // emit(BeneficiaryDownSyncState.inProgress(0, serverTotalCount));
    // diskSpace in MB * 1000 comparison with serverTotalCount * 100KB * Number of entities * 2
    if ((diskSpace ?? 0) * 1000 < (event.initialServerCount * 150 * 2)) {
      emit(const BeneficiaryDownSyncState.insufficientStorage());
    } else {
      try {
        while (true) {
          // Check each time, till the loop runs the offset, limit, totalCount, lastSyncTime from Local DB of DownSync Model
          final existingDownSyncData =
              await downSyncLocalRepository.search(DownsyncSearchModel(
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
            await downSyncLocalRepository.create(DownsyncModel(
              offset: offset,
              limit: event.batchSize,
              lastSyncedTime: lastSyncedTime,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            ));
          }

          if (offset < totalCount) {
            emit(BeneficiaryDownSyncState.inProgress(offset, totalCount));
            //Make the batch API call
            final downSyncResults = await downSyncRemoteRepository.downSync(
              DownsyncSearchModel(
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
            // check if the API response is there or it failed
            if (downSyncResults.isNotEmpty) {
              await networkManager.writeToEntityDB(downSyncResults, [
                householdLocalRepository,
                householdMemberLocalRepository,
                individualLocalRepository,
                projectBeneficiaryLocalRepository,
                taskLocalRepository,
                sideEffectLocalRepository,
                referralLocalRepository,
              ]);
              // Update the local downSync data for the boundary with the new values
              // offset += event.batchSize;
              // ignore: avoid_dynamic_calls
              totalCount = downSyncResults["DownsyncCriteria"]["totalCount"];

              await downSyncLocalRepository.update(DownsyncModel(
                offset: offset + event.batchSize,
                limit: event.batchSize,
                lastSyncedTime: lastSyncedTime,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
              ));
              // emit(BeneficiaryDownSyncState.inProgress(offset, totalCount));
            }
            // When API response failed
            else {
              emit(const BeneficiaryDownSyncState.failed());
              await LocalSecureStore.instance.setManualSyncTrigger(false);
              break;
            }
          } else {
            await downSyncLocalRepository.update(
              existingDownSyncData.first.copyWith(
                offset: 0,
                limit: 0,
                totalCount: totalCount,
                locality: event.boundaryCode,
                boundaryName: event.boundaryName,
                lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            final result = DownsyncModel(
              offset: totalCount,
              lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              totalCount: totalCount,
              locality: event.boundaryCode,
              boundaryName: event.boundaryName,
            );
            await LocalSecureStore.instance.setManualSyncTrigger(false);
            emit(BeneficiaryDownSyncState.success(result));
            break; // If offset is greater than or equal to totalCount, exit the loop
          }
        }
      } catch (e) {
        await LocalSecureStore.instance.setManualSyncTrigger(false);
        emit(const BeneficiaryDownSyncState.failed());
      }
    }
  }

  FutureOr<void> _handleDownSyncReport(
    DownSyncReportEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    final result = await downSyncLocalRepository.search(DownsyncSearchModel());
    emit(BeneficiaryDownSyncState.report(result));
  }
}

@freezed
class BeneficiaryDownSyncEvent with _$BeneficiaryDownSyncEvent {
  const factory BeneficiaryDownSyncEvent.downSync({
    required String projectId,
    required String boundaryCode,
    required int batchSize,
    required int initialServerCount,
    required String boundaryName,
  }) = DownSyncBeneficiaryEvent;

  const factory BeneficiaryDownSyncEvent.checkForData({
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required int batchSize,
    required String boundaryName,
  }) = DownSyncCheckTotalCountEvent;

  const factory BeneficiaryDownSyncEvent.getBatchSize({
    required List<AppConfiguration> appConfiguration,
    required String projectId,
    required String boundaryCode,
    required int pendingSyncCount,
    required String boundaryName,
  }) = DownSyncGetBatchSizeEvent;

  const factory BeneficiaryDownSyncEvent.downSyncReport() = DownSyncReportEvent;

  const factory BeneficiaryDownSyncEvent.resetState() = DownSyncResetStateEvent;
}

@freezed
class BeneficiaryDownSyncState with _$BeneficiaryDownSyncState {
  const BeneficiaryDownSyncState._();

  const factory BeneficiaryDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _DownSyncInProgressState;
  const factory BeneficiaryDownSyncState.success(
    DownsyncModel downSyncResult,
  ) = _DownSyncSuccessState;
  const factory BeneficiaryDownSyncState.getBatchSize(
    int batchSize,
    String projectId,
    String boundaryCode,
    int pendingSyncCount,
    String boundaryName,
  ) = _DownSyncGetBatchSizeState;
  const factory BeneficiaryDownSyncState.loading(bool isPop) =
      _DownSyncLoadingState;
  const factory BeneficiaryDownSyncState.insufficientStorage() =
      _DownSyncInsufficientStorageState;
  const factory BeneficiaryDownSyncState.dataFound(
    int initialServerCount,
    int batchSize,
  ) = _DownSyncDataFoundState;
  const factory BeneficiaryDownSyncState.resetState() = _DownSyncResetState;
  const factory BeneficiaryDownSyncState.totalCountCheckFailed() =
      _DownSynnCountCheckFailedState;
  const factory BeneficiaryDownSyncState.failed() = _DownSyncFailureState;
  const factory BeneficiaryDownSyncState.report(
    List<DownsyncModel> downsyncCriteriaList,
  ) = _DownSyncReportState;
  const factory BeneficiaryDownSyncState.pendingSync() =
      _DownSyncPendingSyncState;
}
