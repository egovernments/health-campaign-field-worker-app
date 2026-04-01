import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data/repositories/package_repository/remote/stock.dart';
<<<<<<< HEAD
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
=======
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/data/repositories/remote/user_action.dart';
>>>>>>> upstream/nigeria-product-changes

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../models/downsync/downsync.dart';
import '../../models/entities/roles_type.dart';
import '../../models/entities/transaction_type.dart';
import '../../utils/background_service.dart';

part 'stock_downsync.freezed.dart';

typedef StockDownSyncEmitter = Emitter<StockDownSyncState>;

class StockDownSyncBloc
    extends Bloc<StockDownSyncEvent, StockDownSyncState> {
  final LocalSecureStore localSecureStore;

  final LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>
      projectFacilityLocalRepository;

  final LocalRepository<FacilityModel, FacilitySearchModel>
      facilityLocalRepository;

  final RemoteRepository<StockModel, StockSearchModel> stockRemoteRepository;

  final LocalRepository<StockModel, StockSearchModel> stockLocalRepository;

  final LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>
      projectResourceLocalRepository;

  final BandwidthCheckRepository bandwidthCheckRepository;

  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;

<<<<<<< HEAD
=======
  final UserActionRemoteRepository userActionRemoteRepository;

  final UserActionLocalRepository userActionLocalRepository;

>>>>>>> upstream/nigeria-product-changes
  StockDownSyncBloc({
    required this.localSecureStore,
    required this.projectFacilityLocalRepository,
    required this.facilityLocalRepository,
    required this.stockRemoteRepository,
    required this.stockLocalRepository,
    required this.projectResourceLocalRepository,
    required this.bandwidthCheckRepository,
    required this.downSyncLocalRepository,
<<<<<<< HEAD
=======
    required this.userActionRemoteRepository,
    required this.userActionLocalRepository,
>>>>>>> upstream/nigeria-product-changes
  }) : super(const StockDownSyncState._()) {
    on(_handleGetBatchSize);
    on(_handleCheckTotalCount);
    on(_handleDownSyncStock);
    on(_handleResetState);
  }

  /// Build the StockSearchModel based on user role
  Future<StockSearchModel?> _buildStockSearchModel(String projectId) async {
    final userObject = await localSecureStore.userRequestModel;
    final userRoles = userObject!.roles.map((e) => e.code);

    final projectFacilities = await projectFacilityLocalRepository.search(
      ProjectFacilitySearchModel(projectId: [projectId]),
    );

    final projectResources = await projectResourceLocalRepository.search(
      ProjectResourceSearchModel(projectId: [projectId]),
    );
    final productVariantIds = projectResources
        .map((pr) => pr.resource.productVariantId)
        .whereType<String>()
        .toSet()
        .toList();

    List<String> receiverIds = [];

    if (userRoles.contains(RolesType.healthFacilitySupervisor.toValue())) {
      receiverIds = projectFacilities.map((e) => e.facilityId).toList();
    } else if (userRoles.contains(RolesType.warehouseManager.toValue())) {
      receiverIds = projectFacilities.map((e) => e.facilityId).toList();
    } else if (userRoles.contains(RolesType.communityDistributor.toValue())) {
      receiverIds = [userObject.uuid];
    }

    if (receiverIds.isEmpty) return null;

    return StockSearchModel(
      receiverId: receiverIds,
      transactionType: [TransactionType.dispatched.toValue()],
      productVariantId:
          productVariantIds.isNotEmpty ? productVariantIds : null,
    );
  }

  FutureOr<void> _handleResetState(
    StockDownSyncResetStateEvent event,
    StockDownSyncEmitter emit,
  ) async {
    emit(const StockDownSyncState.resetState());
  }

  FutureOr<void> _handleGetBatchSize(
    StockDownSyncGetBatchSizeEvent event,
    StockDownSyncEmitter emit,
  ) async {
    try {
      emit(const StockDownSyncState.resetState());
      emit(const StockDownSyncState.loading(false));

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );
      int configuredBatchSize = getBatchSizeToBandwidth(
        speed,
        event.appConfiguration,
        isDownSync: true,
      );
      emit(StockDownSyncState.getBatchSize(
        configuredBatchSize,
        event.projectId,
      ));
    } catch (e) {
      emit(const StockDownSyncState.resetState());
      emit(const StockDownSyncState.totalCountCheckFailed());
    }
  }

  String _getLocalityKey(String projectId) => 'stock_$projectId';

  FutureOr<void> _handleCheckTotalCount(
    StockDownSyncCheckTotalCountEvent event,
    StockDownSyncEmitter emit,
  ) async {
    emit(const StockDownSyncState.loading(true));
    try {
      final stockSearchModel = await _buildStockSearchModel(event.projectId);

      if (stockSearchModel == null) {
        emit(const StockDownSyncState.dataFound(0, 0, 0, null));
        return;
      }

      // Check existing downsync data for stock
      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: _getLocalityKey(event.projectId),
      ));

      int? lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      // Always start from offset 0 for total count check since
      // lastChangedSince already scopes the query to new/modified records
      final totalCount =
          await (stockRemoteRepository as StockRemoteRepository).fetchTotalCount(
        stockSearchModel,
        offSet: 0,
<<<<<<< HEAD
        lastChangedSince: lastSyncedTime,
=======
        lastSyncedTime: lastSyncedTime,
>>>>>>> upstream/nigeria-product-changes
      );

      emit(StockDownSyncState.dataFound(
        totalCount,
        event.batchSize,
        0,
        lastSyncedTime,
      ));
    } catch (e) {
      emit(const StockDownSyncState.resetState());
      emit(const StockDownSyncState.totalCountCheckFailed());
    }
  }

  FutureOr<void> _handleDownSyncStock(
    StockDownSyncDownloadEvent event,
    StockDownSyncEmitter emit,
  ) async {
    emit(const StockDownSyncState.loading(true));
    double? diskSpace = 0;
    diskSpace = await DiskSpace.getFreeDiskSpace;

    if ((diskSpace ?? 0) * 1000 < (event.initialServerCount * 150 * 2)) {
      emit(const StockDownSyncState.insufficientStorage());
    } else {
      try {
        final stockSearchModel = await _buildStockSearchModel(event.projectId);

        if (stockSearchModel == null) {
          emit(const StockDownSyncState.failed());
          return;
        }

        final localityKey = _getLocalityKey(event.projectId);

        // Check existing downsync data for stock
        final existingDownSyncData =
            await downSyncLocalRepository.search(DownsyncSearchModel(
          locality: localityKey,
        ));

        int? lastSyncedTime = existingDownSyncData.isEmpty
            ? null
            : existingDownSyncData.first.lastSyncedTime;

<<<<<<< HEAD
        // Always start from offset 0 for each sync cycle since
        // lastChangedSince already scopes to new/modified records
        int offset = 0;

        // Create initial downsync record if not exists
        if (existingDownSyncData.isEmpty) {
          await downSyncLocalRepository.create(DownsyncModel(
            offset: offset,
=======
        // Create initial downsync record if not exists
        if (existingDownSyncData.isEmpty) {
          await downSyncLocalRepository.create(DownsyncModel(
            offset: 0,
>>>>>>> upstream/nigeria-product-changes
            limit: event.batchSize,
            lastSyncedTime: lastSyncedTime,
            totalCount: 0,
            locality: localityKey,
          ));
        }

        int totalCount = event.initialServerCount;
        int syncedCount = 0;

        emit(StockDownSyncState.inProgress(syncedCount, totalCount));

        // Fetch stock entries in batches to allow progress updates
        while (syncedCount < totalCount) {
          final stockEntries = await stockRemoteRepository.search(
            stockSearchModel,
<<<<<<< HEAD
            offSet: offset,
            limit: event.batchSize,
            lastChangedSince: lastSyncedTime,
=======
            offSet: 0,
            limit: event.batchSize,
            lastSyncedTime: lastSyncedTime,
>>>>>>> upstream/nigeria-product-changes
          );

          if (stockEntries.isEmpty) break;

          await stockLocalRepository.bulkCreate(stockEntries);

<<<<<<< HEAD
          offset += stockEntries.length;
          syncedCount += stockEntries.length;

          // Update downsync record after each batch
          await downSyncLocalRepository.update(DownsyncModel(
            offset: offset,
=======
          syncedCount += stockEntries.length;

          // Update downsync record, keep offset 0, update lastSyncedTime
          await downSyncLocalRepository.update(DownsyncModel(
            offset: 0,
>>>>>>> upstream/nigeria-product-changes
            limit: event.batchSize,
            lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
            totalCount: totalCount,
            locality: localityKey,
          ));

          emit(StockDownSyncState.inProgress(syncedCount, totalCount));
        }

<<<<<<< HEAD
=======
        // After stock download, downsync stock balance user actions
        await _downSyncStockBalances(event.projectId);

>>>>>>> upstream/nigeria-product-changes
        emit(StockDownSyncState.success(syncedCount, totalCount));
      } catch (e) {
        emit(const StockDownSyncState.failed());
      }
    }
  }
<<<<<<< HEAD
=======

  /// Fetches stock balance UserAction records from the server
  /// using balance keys (stock_balance_{facilityId}_{productVariantId})
  /// and creates or updates them locally.
  Future<void> _downSyncStockBalances(String projectId) async {
    try {
      final projectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [projectId]),
      );
      final projectResources = await projectResourceLocalRepository.search(
        ProjectResourceSearchModel(projectId: [projectId]),
      );

      final facilityIds =
          projectFacilities.map((e) => e.facilityId).toSet().toList();
      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();

      if (facilityIds.isEmpty || productVariantIds.isEmpty) return;

      // Build balance keys for all facility × product variant combinations
      final balanceKeys = <String>[];
      for (final facilityId in facilityIds) {
        for (final productVariantId in productVariantIds) {
          balanceKeys.add('stock_balance_${facilityId}_$productVariantId');
        }
      }

      // Fetch from server
      final remoteBalances = await userActionRemoteRepository.search(
        UserActionSearchModel(
          clientReferenceId: balanceKeys,
        ),
      );

      if (remoteBalances.isEmpty) return;

      // For each fetched balance, create or update locally
      for (final remoteBalance in remoteBalances) {
        final existing = await userActionLocalRepository.search(
          UserActionSearchModel(
            clientReferenceId: [remoteBalance.clientReferenceId],
          ),
        );

        if (existing.isNotEmpty) {
          await userActionLocalRepository.update(
            remoteBalance,
            createOpLog: false,
          );
        } else {
          await userActionLocalRepository.create(
            remoteBalance,
            createOpLog: false,
          );
        }
      }
    } catch (e) {
      debugPrint('Stock balance downsync error: $e');
    }
  }
>>>>>>> upstream/nigeria-product-changes
}

@freezed
class StockDownSyncEvent with _$StockDownSyncEvent {
  const factory StockDownSyncEvent.getBatchSize({
    required List<AppConfiguration> appConfiguration,
    required String projectId,
  }) = StockDownSyncGetBatchSizeEvent;

  const factory StockDownSyncEvent.checkTotalCount({
    required String projectId,
    required int batchSize,
  }) = StockDownSyncCheckTotalCountEvent;

  const factory StockDownSyncEvent.downloadStock({
    required String projectId,
    required int batchSize,
    required int initialServerCount,
  }) = StockDownSyncDownloadEvent;

  const factory StockDownSyncEvent.resetState() = StockDownSyncResetStateEvent;
}

@freezed
class StockDownSyncState with _$StockDownSyncState {
  const StockDownSyncState._();

  const factory StockDownSyncState.loading(bool isPop) =
      _StockDownSyncLoadingState;

  const factory StockDownSyncState.getBatchSize(
    int batchSize,
    String projectId,
  ) = _StockDownSyncGetBatchSizeState;

  const factory StockDownSyncState.dataFound(
    int initialServerCount,
    int batchSize,
    int offset,
    int? lastSyncedTime,
  ) = _StockDownSyncDataFoundState;

  const factory StockDownSyncState.inProgress(
    int syncedCount,
    int totalCount,
  ) = _StockDownSyncInProgressState;

  const factory StockDownSyncState.success(
    int syncedCount,
    int totalCount,
  ) = _StockDownSyncSuccessState;

  const factory StockDownSyncState.failed() = _StockDownSyncFailureState;

  const factory StockDownSyncState.insufficientStorage() =
      _StockDownSyncInsufficientStorageState;

  const factory StockDownSyncState.totalCountCheckFailed() =
      _StockDownSyncCountCheckFailedState;

  const factory StockDownSyncState.resetState() = _StockDownSyncResetState;
}
