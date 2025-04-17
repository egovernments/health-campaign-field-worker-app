// GENERATED using mason_cli
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/id_status.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

import '../../data/repositories/remote/unique_id_pool.dart';
import '../../utils/utils.dart';

part 'unique_id.freezed.dart';

typedef UniqueIdEmitter = Emitter<UniqueIdState>;

//This bloc is used for registration of Beneficiaries to the project
class UniqueIdBloc extends Bloc<UniqueIdEvent, UniqueIdState> {
  final LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
      uniqueIdPoolLocalRepository;
  final UniqueIdPoolRemoteRepository uniqueIdPoolRemoteRepository;

  UniqueIdBloc(
      {required this.uniqueIdPoolLocalRepository,
      required this.uniqueIdPoolRemoteRepository})
      : super(const LoadingState()) {
    on(_fetchIdCount);
    on(_fetchUniqueIdsFromServer);
    on(_fetchAUniqueId);
  }

  FutureOr<void> _fetchIdCount(
      UniqueIdCountEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());

    try {
      final count = await uniqueIdPoolLocalRepository.search(
        UniqueIdPoolSearchModel(
          status: IdStatus.unAssigned.toValue(),
          userUuid: RegistrationDeliverySingleton().loggedInUserUuid,
        ),
      );
      final totalCount = await uniqueIdPoolLocalRepository.search(
        UniqueIdPoolSearchModel(
          userUuid: RegistrationDeliverySingleton().loggedInUserUuid,
        ),
      );
      emit(UniqueIdState.idCount(count.length, totalCount.length));
    } catch (e) {
      emit(UniqueIdState.failed(e.toString()));
    }
  }

  FutureOr<void> _fetchUniqueIdsFromServer(
      FetchUniqueIdsEvent event, Emitter<UniqueIdState> emit) async {
    emit(UniqueIdState.fetching(
        0, RegistrationDeliverySingleton().beneficiaryIdBatchSize!));
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final userUuid = RegistrationDeliverySingleton().loggedInUserUuid;
      final deviceUuid = androidInfo.id;
      final tenantId = RegistrationDeliverySingleton().tenantId;

      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(const UniqueIdState.noInternet());
        return;
      }

      int offset = 0;
      int totalToFetch = 0;
      List<UniqueIdPoolModel> allFetchedIds = [];
      int batchSize = RegistrationDeliverySingleton().beneficiaryIdBatchSize!;

      while (true) {
        emit(UniqueIdState.fetching(
            offset, totalToFetch == 0 ? batchSize : totalToFetch));

        final searchModel = event.reFetch == true
            ? UniqueIdPoolSearchModel(
                deviceInfo: androidInfo.toString(),
                userUuid: userUuid,
                deviceUuid: deviceUuid,
                tenantId: tenantId,
                count: batchSize,
                fetchAllocatedIds: event.reFetch,
              )
            : UniqueIdPoolSearchModel(
                deviceInfo: androidInfo.toString(),
                userUuid: userUuid,
                deviceUuid: deviceUuid,
                tenantId: tenantId,
                count: batchSize,
              );

        final response = await uniqueIdPoolRemoteRepository.searchWithMetadata(
          limit: batchSize,
          offSet: offset,
          searchModel,
        );

        final List<UniqueIdPoolModel> batch = response.models;
        final int fetchLimit = response.fetchLimit;

        if (totalToFetch == 0) {
          totalToFetch = fetchLimit;
          if (batchSize >= fetchLimit) {
            batchSize = fetchLimit;
          }
        }
        if (batch.isEmpty) break;

        await uniqueIdPoolLocalRepository.bulkCreate(batch);
        allFetchedIds.addAll(batch);

        offset += batch.length;

        if (offset >= totalToFetch) {
          emit(UniqueIdState.fetching(
              offset,
              totalToFetch == 0
                  ? batch.isEmpty
                      ? batchSize
                      : batch.length
                  : totalToFetch));
          break;
        }
      }

      emit(UniqueIdState.ids(allFetchedIds));
    } catch (e) {
      if (e is UniqueIdLimitExceededException) {
        emit(UniqueIdState.limitExceeded(e.message));
      } else {
        emit(UniqueIdState.failed(e.toString()));
      }
    }
  }

  FutureOr<void> _fetchAUniqueId(
      FetchAUniqueIdEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());

    try {
      final count = await uniqueIdPoolLocalRepository.search(
        UniqueIdPoolSearchModel(
          status: IdStatus.unAssigned.toValue(),
          userUuid: RegistrationDeliverySingleton().loggedInUserUuid,
        ),
      );

      emit(UniqueIdState.aUniqueId(count.first));
    } catch (e) {
      emit(UniqueIdState.failed(e.toString()));
    }
  }
}

@freezed
class UniqueIdEvent with _$UniqueIdEvent {
  const factory UniqueIdEvent.fetchIdCount() = UniqueIdCountEvent;

  const factory UniqueIdEvent.fetchUniqueIdsFromServer({bool? reFetch}) =
      FetchUniqueIdsEvent;

  const factory UniqueIdEvent.fetchAUniqueId() = FetchAUniqueIdEvent;
}

@freezed
class UniqueIdState with _$UniqueIdState {
  const factory UniqueIdState.loading() = LoadingState;

  const factory UniqueIdState.fetching(int progress, int totalCount) =
      FetchingState;

  const factory UniqueIdState.idCount(int count, int totalCount) =
      FetchedIdCountState;

  const factory UniqueIdState.ids(List<UniqueIdPoolModel> ids) =
      FetchedUniqueIdsState;

  const factory UniqueIdState.failed(String? error) = FailedState;

  const factory UniqueIdState.aUniqueId(UniqueIdPoolModel aUniqueId) =
      FetchedUniqueIdState;

  const factory UniqueIdState.noInternet() = NoInternetState;

  const factory UniqueIdState.limitExceeded(String message) = LimitExceeded;
}
