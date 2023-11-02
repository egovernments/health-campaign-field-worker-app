// GENERATED using mason_cli
import 'dart:async';

import 'package:disk_space/disk_space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../models/entities/downsync.dart';
import '../../utils/environment_config.dart';

part 'project_beneficiaries_downsync.freezed.dart';

typedef BeneficiaryDownSyncEmitter = Emitter<BeneficiaryDownSyncState>;

class BeneficiaryDownSyncBloc
    extends Bloc<BeneficiaryDownSyncEvent, BeneficiaryDownSyncState> {
  final RemoteRepository<DownsyncModel, DownsyncSearchModel>
      downSyncRemoteRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;
  // final LocalRepository<HouseholdModel, HouseholdSearchModel>
  //     householdLocalRepository;
  // final LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
  //     householdMemberLocalRepository;
  // final LocalRepository<IndividualModel, IndividualSearchModel>
  //     individualLocalRepository;
  // final LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
  //     projectBeneficiaryLocalRepository;
  // final LocalRepository<TaskModel, TaskSearchModel> taskLocalRepository;
  // final LocalRepository<SideEffectModel, SideEffectSearchModel>
  //     sideEffectLocalRepository;
  // final LocalRepository<ReferralModel, ReferralSearchModel>
  //     referralLocalRepository;
  BeneficiaryDownSyncBloc({
    required this.downSyncRemoteRepository,
    required this.downSyncLocalRepository,
    // required this.householdLocalRepository,
    // required this.householdMemberLocalRepository,
    // required this.individualLocalRepository,
    // required this.projectBeneficiaryLocalRepository,
    // required this.taskLocalRepository,
    // required this.sideEffectLocalRepository,
    // required this.referralLocalRepository,
  }) : super(const BeneficiaryDownSyncState._()) {
    on(_handleDownSyncOfBeneficiaries);
  }

  FutureOr<void> _handleDownSyncOfBeneficiaries(
    DownSyncBeneficiaryEvent event,
    BeneficiaryDownSyncEmitter emit,
  ) async {
    double? diskSpace = 0;
    diskSpace = await DiskSpace.getFreeDiskSpace;
    int totalCount = 1000;
    print('EVENT CALLED');
    // const localRepo = LocalRepository<HouseholdModel, HouseholdSearchModel>;
    // final existingDownSyncData =
    //     await downSyncLocalRepository.search(DownsyncSearchModel(
    //   locality: event.boundaryCode,
    // ));
    // int? lastSyncedTime = existingDownSyncData.first.lastSyncedTime;
    // int offSet = existingDownSyncData.first.offset ?? 0;
    // int limit = event.batchSize;
    final downSyncResults = await downSyncRemoteRepository.downSync(
      DownsyncSearchModel(
        locality: event.boundaryCode,
        offset: 0,
        limit: 1,
        tenantId: envConfig.variables.tenantId,
        projectId: event.projectId,
        lastSyncedTime: null,
      ),
    );
    await downSyncLocalRepository.create(DownsyncModel(
      offset: 5,
      limit: 10,
    ));
    print(downSyncResults.keys.toList());
    // if ((diskSpace ?? 0) * 1000 <
    //     (downSyncResults.first.downSyncCriteria?.totalCount ?? 0) *
    //         100 *
    //         7 *
    //         2) {
    //   emit(const BeneficiaryDownSyncState.insufficientStorage());
    // } else {}
    // _fetchResults(emit, event);
  }

  // FutureOr<void> _fetchResults(
  //   BeneficiaryDownSyncEmitter emit,
  //   DownSyncBeneficiaryEvent event,
  // ) async {
  //   final existingDownSyncData =
  //       await downSyncLocalRepository.search(DownsyncSearchModel(
  //     locality: event.boundaryCode,
  //   ));
  //   int offSet = existingDownSyncData.first.offset ?? 0;
  //   int limit = event.batchSize;
  //   int? lastSyncedTime = existingDownSyncData.first.lastSyncedTime;
  //   final downSyncResults = await downSyncRemoteRepository.search(
  //     DownsyncSearchModel(
  //       locality: event.boundaryCode,
  //       projectId: event.projectId,
  //       offset: offSet,
  //       limit: limit,
  //       tenantId: envConfig.variables.tenantId,
  //       lastSyncedTime: lastSyncedTime,
  //     ),
  //   );
  //   // if (downSyncResults.first.households != null &&
  //   //     (downSyncResults.first.households ?? []).isNotEmpty) {
  //   await householdLocalRepository
  //       .bulkCreate(downSyncResults.first.households!);
  //   // }
  //   // if (downSyncResults.first.householdMembers != null &&
  //   //     (downSyncResults.first.householdMembers ?? []).isNotEmpty) {
  //   //   await householdMemberLocalRepository
  //   //       .bulkCreate(downSyncResults.first.householdMembers!);
  //   // }
  //   // if (downSyncResults.first.individuals != null &&
  //   //     (downSyncResults.first.individuals ?? []).isNotEmpty) {
  //   //   await individualLocalRepository
  //   //       .bulkCreate(downSyncResults.first.individuals!);
  //   // }
  //   // if (downSyncResults.first.projectBeneficiaries != null &&
  //   //     (downSyncResults.first.projectBeneficiaries ?? []).isNotEmpty) {
  //   //   await projectBeneficiaryLocalRepository
  //   //       .bulkCreate(downSyncResults.first.projectBeneficiaries!);
  //   // }
  //   // if (downSyncResults.first.tasks != null &&
  //   //     (downSyncResults.first.tasks ?? []).isNotEmpty) {
  //   //   await taskLocalRepository.bulkCreate(downSyncResults.first.tasks!);
  //   // }
  //   // if (downSyncResults.first.referrals != null &&
  //   //     (downSyncResults.first.referrals ?? []).isNotEmpty) {
  //   //   await referralLocalRepository
  //   //       .bulkCreate(downSyncResults.first.referrals!);
  //   // }
  //   // if (downSyncResults.first.sideEffects != null &&
  //   //     (downSyncResults.first.sideEffects ?? []).isNotEmpty) {
  //   //   await sideEffectLocalRepository
  //   //       .bulkCreate(downSyncResults.first.sideEffects!);
  //   // }
  // }
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
