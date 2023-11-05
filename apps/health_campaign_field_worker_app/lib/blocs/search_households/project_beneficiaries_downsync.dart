// GENERATED using mason_cli
import 'dart:async';

import 'package:disk_space/disk_space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';
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
  }) : super(const BeneficiaryDownSyncState._()) {
    on(_handleDownSyncOfBeneficiaries);
  }

  FutureOr<void> _handleDownSyncOfBeneficiaries(
    DownSyncBeneficiaryEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    double? diskSpace = 0;
    diskSpace = await DiskSpace
        .getFreeDiskSpace; // Returns the device available space in MB
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
        offset: 0,
        limit: 5,
        lastSyncedTime: lastSyncedTime,
        tenantId: envConfig.variables.tenantId,
        projectId: event.projectId,
      ),
    );

    // Current response from server is String, Expecting it to be int
    int serverTotalCount = initialResults["DownsyncCriteria"]["totalCount"];
    // emit(BeneficiaryDownSyncState.inProgress(0, serverTotalCount));
    if (serverTotalCount == 0) {
      emit(const BeneficiaryDownSyncState.success());
    }
    // diskSpace in MB * 1000 comparison with serverTotalCount * 100KB * Number of entities * 2
    else if ((diskSpace ?? 0) * 1000 < (serverTotalCount * 100 * 7 * 2)) {
      emit(const BeneficiaryDownSyncState.insufficientStorage());
    } else {
      _fetchResults(emit, event);
    }
  }

  FutureOr<void> _fetchResults(
    BeneficiaryDownSyncEmitter emit,
    DownSyncBeneficiaryEvent event,
  ) async {
    int limit = event.batchSize;

    while (true) {
      // Check each time, till the loop runs the offset, limit, totalCount, lastSyncTime from Local DB of DownSync Model
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: event.boundaryCode,
      ));

      int offset = existingDownSyncData.isEmpty
          ? 0
          : existingDownSyncData.first.offset ?? 0;
      int totalCount = existingDownSyncData.isEmpty
          ? 0
          : existingDownSyncData.first.totalCount ?? 0;
      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      if (offset >= totalCount) {
        emit(BeneficiaryDownSyncState.inProgress(0, totalCount));
        //Make the batch API call
        final downSyncResults = await downSyncRemoteRepository.downSync(
          DownsyncSearchModel(
            locality: event.boundaryCode,
            offset: offset,
            limit: limit,
            totalCount: totalCount,
            tenantId: envConfig.variables.tenantId,
            projectId: event.projectId,
            lastSyncedTime: lastSyncedTime,
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
          offset += limit;
          totalCount = downSyncResults["DownsyncCriteria"]["totalCount"];
          lastSyncedTime =
              downSyncResults["DownsyncCriteria"]["lastSyncedTime"];

          await downSyncLocalRepository.update(DownsyncModel(
            offset: offset,
            limit: limit,
            lastSyncedTime: lastSyncedTime,
            totalCount: totalCount,
            locality: event.boundaryCode,
          ));
        }
        // When API response failed
        else {
          emit(const BeneficiaryDownSyncState.failed());
        }
      } else {
        emit(const BeneficiaryDownSyncState.success());
        break; // If offset is greater than or equal to totalCount, exit the loop
      }
    }
  }
}

@freezed
class BeneficiaryDownSyncEvent with _$BeneficiaryDownSyncEvent {
  const factory BeneficiaryDownSyncEvent.downSync({
    required String projectId,
    required String boundaryCode,
    required int batchSize,
  }) = DownSyncBeneficiaryEvent;
}

@freezed
class BeneficiaryDownSyncState with _$BeneficiaryDownSyncState {
  const BeneficiaryDownSyncState._();

  const factory BeneficiaryDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _DownSyncInProgressState;
  const factory BeneficiaryDownSyncState.success() = _DownSyncSuccessState;
  const factory BeneficiaryDownSyncState.insufficientStorage() =
      _DownSyncInsufficientStorageState;
  const factory BeneficiaryDownSyncState.failed() = _DownSyncFailureState;
}
