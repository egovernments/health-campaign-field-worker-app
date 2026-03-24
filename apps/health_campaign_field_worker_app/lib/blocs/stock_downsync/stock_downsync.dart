import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
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

  StockDownSyncBloc({
    required this.localSecureStore,
    required this.projectFacilityLocalRepository,
    required this.facilityLocalRepository,
    required this.stockRemoteRepository,
    required this.stockLocalRepository,
    required this.projectResourceLocalRepository,
    required this.bandwidthCheckRepository,
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

  FutureOr<void> _handleCheckTotalCount(
    StockDownSyncCheckTotalCountEvent event,
    StockDownSyncEmitter emit,
  ) async {
    emit(const StockDownSyncState.loading(true));
    try {
      final stockSearchModel = await _buildStockSearchModel(event.projectId);

      if (stockSearchModel == null) {
        emit(const StockDownSyncState.dataFound(0, 0));
        return;
      }

      // Use remote repository search to fetch all records and get count
      // TODO: Optimize later with limit=0 direct API call for count only
      final results = await stockRemoteRepository.search(
        stockSearchModel,
        lastChangedSince: event.lastChangedSince,
      );

      final totalCount = results.length;

      emit(StockDownSyncState.dataFound(
        totalCount,
        event.batchSize,
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

        int totalCount = event.initialServerCount;

        emit(StockDownSyncState.inProgress(0, totalCount));

        // Use remote repository to fetch all stock entries
        final stockEntries = await stockRemoteRepository.search(
          stockSearchModel,
          lastChangedSince: event.lastChangedSince,
        );

        if (stockEntries.isNotEmpty) {
          await stockLocalRepository.bulkCreate(stockEntries);
        }

        emit(StockDownSyncState.inProgress(stockEntries.length, totalCount));
        emit(StockDownSyncState.success(stockEntries.length, totalCount));
      } catch (e) {
        emit(const StockDownSyncState.failed());
      }
    }
  }
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
    int? lastChangedSince,
  }) = StockDownSyncCheckTotalCountEvent;

  const factory StockDownSyncEvent.downloadStock({
    required String projectId,
    required int batchSize,
    required int initialServerCount,
    int? lastChangedSince,
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
