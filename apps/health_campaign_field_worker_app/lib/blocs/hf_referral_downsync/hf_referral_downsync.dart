import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data/repositories/package_repository/remote/hf_referral.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../models/downsync/downsync.dart';
import '../../utils/background_service.dart';

part 'hf_referral_downsync.freezed.dart';

typedef HFReferralDownSyncEmitter = Emitter<HFReferralDownSyncState>;

class HFReferralDownSyncBloc
    extends Bloc<HFReferralDownSyncEvent, HFReferralDownSyncState> {
  final LocalRepository<HFReferralModel, HFReferralSearchModel>
      hfReferralLocalRepository;
  final RemoteRepository<HFReferralModel, HFReferralSearchModel>
      hfReferralRemoteRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;
  final BandwidthCheckRepository bandwidthCheckRepository;
  final LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>
      projectFacilityLocalRepository;

  HFReferralDownSyncBloc({
    required this.hfReferralLocalRepository,
    required this.hfReferralRemoteRepository,
    required this.downSyncLocalRepository,
    required this.bandwidthCheckRepository,
    required this.projectFacilityLocalRepository,
  }) : super(const HFReferralDownSyncState._()) {
    on(_handleStart);
    on(_handleDownload);
    on(_handleDownSyncResetState);
  }

  String _getLocalityKey(String projectId) => 'hfReferral_$projectId';

  FutureOr<void> _handleDownSyncResetState(
    HFReferralDownSyncResetStateEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    emit(const HFReferralDownSyncState.resetState());
  }

  FutureOr<void> _handleStart(
    HFReferralDownSyncStartEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    emit(const HFReferralDownSyncState.loading());

    try {
      final localityKey = _getLocalityKey(event.projectId);

      // Check existing downsync progress
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: localityKey,
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      // Fetch total count from server using lastSyncedTime to get only new records
      final totalCount =
          await (hfReferralRemoteRepository as HFReferralRemoteRepository)
              .fetchTotalCount(
        HFReferralSearchModel(
          projectId: event.projectId,
        ),
        offSet: 0,
        lastSyncedTime: lastSyncedTime,
      );

      // totalCount is already the new count since lastSyncedTime filters to only new records
      if (totalCount > 0) {
        emit(HFReferralDownSyncState.dataFound(totalCount, totalCount));
      } else {
        emit(const HFReferralDownSyncState.dataFound(0, 0));
      }
    } catch (e) {
      emit(const HFReferralDownSyncState.failed());
    }
  }

  FutureOr<void> _handleDownload(
    HFReferralDownSyncDownloadEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    try {
      final localityKey = _getLocalityKey(event.projectId);

      // Get batch size based on bandwidth
      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );
      final batchSize = getBatchSizeToBandwidth(
        speed,
        event.appConfiguration,
        isDownSync: true,
      );

      // Check existing downsync progress
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: localityKey,
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      final totalCount = event.totalCount;

      if (totalCount == 0) {
        emit(const HFReferralDownSyncState.success(0, 0));
        return;
      }

      // Create initial downsync record if not exists
      if (existingDownSyncData.isEmpty) {
        await downSyncLocalRepository.create(DownsyncModel(
          offset: 0,
          limit: batchSize,
          lastSyncedTime: lastSyncedTime,
          totalCount: 0,
          locality: localityKey,
        ));
      }

      int syncedCount = 0;

      emit(HFReferralDownSyncState.inProgress(syncedCount, totalCount));

      // Download in batches using lastSyncedTime, offset always 0
      while (syncedCount < totalCount) {
        final hfReferrals = await hfReferralRemoteRepository.search(
          HFReferralSearchModel(
            projectId: event.projectId,
          ),
          offSet: 0,
          limit: batchSize,
          lastSyncedTime: lastSyncedTime,
        );

        if (hfReferrals.isEmpty) break;

        // Filter out records that already exist locally
        final incomingClientRefIds =
            hfReferrals.map((e) => e.clientReferenceId).toList();
        final existingRecords = await hfReferralLocalRepository.search(
          HFReferralSearchModel(clientReferenceId: incomingClientRefIds),
        );
        final existingClientRefIds =
            existingRecords.map((e) => e.clientReferenceId).toSet();
        final newReferrals = hfReferrals
            .where((e) => !existingClientRefIds.contains(e.clientReferenceId))
            .toList();

        if (newReferrals.isNotEmpty) {
          await hfReferralLocalRepository.bulkCreate(newReferrals);
        }

        syncedCount += hfReferrals.length;

        // Update downsync progress with lastSyncedTime, keep offset 0
        await downSyncLocalRepository.update(DownsyncModel(
          offset: 0,
          limit: batchSize,
          lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
          totalCount: totalCount,
          locality: localityKey,
        ));

        emit(HFReferralDownSyncState.inProgress(syncedCount, totalCount));
      }

      emit(HFReferralDownSyncState.success(syncedCount, totalCount));
    } catch (e) {
      emit(const HFReferralDownSyncState.failed());
    }
  }
}

@freezed
class HFReferralDownSyncEvent with _$HFReferralDownSyncEvent {
  const factory HFReferralDownSyncEvent.start({
    required String projectId,
    required List<AppConfiguration> appConfiguration,
  }) = HFReferralDownSyncStartEvent;

  const factory HFReferralDownSyncEvent.download({
    required String projectId,
    required List<AppConfiguration> appConfiguration,
    required int totalCount,
    required int serverTotalCount,
  }) = HFReferralDownSyncDownloadEvent;

  const factory HFReferralDownSyncEvent.resetState() =
      HFReferralDownSyncResetStateEvent;
}

@freezed
class HFReferralDownSyncState with _$HFReferralDownSyncState {
  const HFReferralDownSyncState._();

  const factory HFReferralDownSyncState.loading() =
      _HFReferralDownSyncLoadingState;

  const factory HFReferralDownSyncState.dataFound(
    int newCount,
    int serverTotalCount,
  ) = _HFReferralDownSyncDataFoundState;

  const factory HFReferralDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _HFReferralDownSyncInProgressState;

  const factory HFReferralDownSyncState.success(
    int syncedCount,
    int totalCount,
  ) = _HFReferralDownSyncSuccessState;

  const factory HFReferralDownSyncState.resetState() =
      _HFReferralDownSyncResetState;

  const factory HFReferralDownSyncState.failed() =
      _HFReferralDownSyncFailureState;
}
