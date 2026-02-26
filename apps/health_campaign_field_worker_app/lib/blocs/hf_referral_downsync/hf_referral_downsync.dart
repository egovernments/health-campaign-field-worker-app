import 'dart:async';

import 'package:digit_data_model/data_model.dart';
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

  HFReferralDownSyncBloc({
    required this.hfReferralLocalRepository,
    required this.hfReferralRemoteRepository,
    required this.downSyncLocalRepository,
    required this.bandwidthCheckRepository,
  }) : super(const HFReferralDownSyncState._()) {
    on(_handleDownSyncOfHFReferrals);
    on(_handleCheckTotalCount);
    on(_handleDownSyncResetState);
    on(_handleCheckBandWidth);
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

      // Check existing downsync data for HFReferral
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: 'hfReferral_${event.boundaryCode}',
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      int offset = existingDownSyncData.isEmpty
          ? 0
          : existingDownSyncData.first.offset ?? 0;

      try {
        // Get initial batch to check if there's data available from current offset
        final initialResults = await hfReferralRemoteRepository.search(
            HFReferralSearchModel(
              localityCode: [event.boundaryCode],
            ),
            offSet: offset,
            limit: event.batchSize);

        // If no data found with current offset and offset > 0,
        // retry once with offset 0 and limit 200 (temporal fetch, not stored)
        if (initialResults.isEmpty && offset > 0) {
          final retryResults = await hfReferralRemoteRepository.search(
              HFReferralSearchModel(
                localityCode: [event.boundaryCode],
              ),
              offSet: offset ?? 0,
              limit: event.batchSize ?? 200);

          if (retryResults.isNotEmpty) {
            // Reset the stored offset to 0 so the actual downsync starts from beginning
            await downSyncLocalRepository.update(DownsyncModel(
              offset: 0,
              limit: event.batchSize,
              lastSyncedTime: lastSyncedTime,
              totalCount: existingDownSyncData.first.totalCount ?? 0,
              locality: 'hfReferral_${event.boundaryCode}',
              boundaryName: event.boundaryName,
            ));
            emit(HFReferralDownSyncState.dataFound(
              retryResults.length,
              event.batchSize,
              0,
              lastSyncedTime,
            ));
            return;
          }
        }

        // If we got results, there's data to sync
        int serverTotalCount = initialResults.length;

        emit(HFReferralDownSyncState.dataFound(
          serverTotalCount,
          event.batchSize,
          offset,
          lastSyncedTime,
        ));
      } catch (e) {
        emit(const HFReferralDownSyncState.resetState());
        emit(const HFReferralDownSyncState.totalCountCheckFailed());
      }
    }
  }

  FutureOr<void> _handleDownSyncOfHFReferrals(
    HFReferralDownSyncStartEvent event,
    HFReferralDownSyncEmitter emit,
  ) async {
    emit(const HFReferralDownSyncState.loading(true));

    try {
      // Check existing downsync data for HFReferral
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: 'hfReferral_${event.boundaryCode}',
      ));

      int offset = existingDownSyncData.isEmpty
          ? 0
          : existingDownSyncData.first.offset ?? 0;
      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      // Create initial downsync record if not exists
      if (existingDownSyncData.isEmpty) {
        await downSyncLocalRepository.create(DownsyncModel(
          offset: offset,
          limit: event.batchSize,
          lastSyncedTime: lastSyncedTime,
          totalCount: 0,
          locality: 'hfReferral_${event.boundaryCode}',
          boundaryName: event.boundaryName,
        ));
      }

      // If stored offset > 0, first check offset 0 for new records
      // (server stores newest data first, so new records appear at the beginning)
      if (offset > 0) {
        final newDataCheck = await hfReferralRemoteRepository.search(
            HFReferralSearchModel(
              localityCode: [event.boundaryCode],
            ),
            offSet: 0,
            limit: 200);

        if (newDataCheck.isNotEmpty) {
          final checkClientRefIds =
              newDataCheck.map((e) => e.clientReferenceId).toList();
          final existingLocal = await hfReferralLocalRepository.search(
            HFReferralSearchModel(clientReferenceId: checkClientRefIds),
          );
          final existingIds =
              existingLocal.map((e) => e.clientReferenceId).toSet();
          final hasNewRecords =
              checkClientRefIds.any((id) => !existingIds.contains(id));

          // If new records found at offset 0, reset to fetch from beginning
          if (hasNewRecords) {
            offset = 0;
          }
        }
      }

      // Fetch HFReferral data from server in a loop
      int totalFetched = 0;
      int currentOffset = offset;
      List<HFReferralModel> allFetchedReferrals = [];

      while (true) {
        // Emit progress state
        emit(HFReferralDownSyncState.inProgress(
          totalFetched,
          totalFetched + event.batchSize,
        ));

        // Fetch batch from server starting from current offset
        final hfReferrals = await hfReferralRemoteRepository.search(
            HFReferralSearchModel(
              localityCode: [event.boundaryCode],
            ),
            offSet: currentOffset,
            limit: event.batchSize);

        // If no more records, we're done
        if (hfReferrals.isEmpty) {
          break;
        }

        // Map HFReferrals with localityCode
        final hfReferralsWithLocality = hfReferrals.map((referral) {
          return HFReferralModel(
            id: referral.id,
            clientReferenceId: referral.clientReferenceId,
            rowVersion: referral.rowVersion,
            tenantId: referral.tenantId,
            name: referral.name,
            projectId: referral.projectId,
            projectFacilityId: referral.projectFacilityId,
            symptom: referral.symptom,
            symptomSurveyId: referral.symptomSurveyId,
            beneficiaryId: referral.beneficiaryId,
            referralCode: referral.referralCode,
            nationalLevelId: referral.nationalLevelId,
            localityCode: event.boundaryCode,
            isDeleted: referral.isDeleted,
            additionalFields: referral.additionalFields,
            auditDetails: referral.auditDetails,
            clientAuditDetails: referral.clientAuditDetails,
          );
        }).toList();

        // Filter out records that already exist locally to avoid
        // overwriting user-modified data and storing duplicates
        final incomingClientRefIds =
            hfReferralsWithLocality.map((e) => e.clientReferenceId).toList();
        final existingRecords = await hfReferralLocalRepository.search(
          HFReferralSearchModel(clientReferenceId: incomingClientRefIds),
        );
        final existingClientRefIds =
            existingRecords.map((e) => e.clientReferenceId).toSet();
        final newReferrals = hfReferralsWithLocality
            .where((e) => !existingClientRefIds.contains(e.clientReferenceId))
            .toList();

        // Only bulk create records that don't already exist
        if (newReferrals.isNotEmpty) {
          await hfReferralLocalRepository.bulkCreate(newReferrals);
        }
        allFetchedReferrals.addAll(newReferrals);

        // Update offset and count
        currentOffset += hfReferrals.length;
        totalFetched += hfReferrals.length;

        // If we got fewer records than batchSize, we've reached the end
        if (hfReferrals.length < event.batchSize) {
          break;
        }
      }

      // Update downsync record with final offset (for next sync to continue from here)
      await downSyncLocalRepository.update(DownsyncModel(
        offset: currentOffset,
        limit: event.batchSize,
        lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
        totalCount: currentOffset,
        locality: 'hfReferral_${event.boundaryCode}',
        boundaryName: event.boundaryName,
      ));

      // Emit final progress state
      emit(HFReferralDownSyncState.inProgress(totalFetched, totalFetched));

      final result = DownsyncModel(
        offset: currentOffset,
        lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
        totalCount: totalFetched,
        locality: event.boundaryCode,
        boundaryName: event.boundaryName,
      );

      emit(HFReferralDownSyncState.success(result));
    } catch (e) {
      emit(const HFReferralDownSyncState.failed());
    }
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
  }) = HFReferralDownSyncStartEvent;

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
    DownsyncModel downSyncResult,
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

  const factory HFReferralDownSyncState.dataFound(
    int initialServerCount,
    int batchSize,
    int offset,
    int? lastSyncedTime,
  ) = _HFReferralDownSyncDataFoundState;

  const factory HFReferralDownSyncState.resetState() =
      _HFReferralDownSyncResetState;

  const factory HFReferralDownSyncState.totalCountCheckFailed() =
      _HFReferralDownSyncCountCheckFailedState;

  const factory HFReferralDownSyncState.failed() =
      _HFReferralDownSyncFailureState;

  const factory HFReferralDownSyncState.pendingSync() =
      _HFReferralDownSyncPendingSyncState;
}
