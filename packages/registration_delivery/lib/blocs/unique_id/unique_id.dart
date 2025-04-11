// GENERATED using mason_cli
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/id_status.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

import '../../utils/utils.dart';

part 'unique_id.freezed.dart';

typedef UniqueIdEmitter = Emitter<UniqueIdState>;

//This bloc is used for registration of Beneficiaries to the project
class UniqueIdBloc extends Bloc<UniqueIdEvent, UniqueIdState> {
  final LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
      uniqueIdPoolLocalRepository;
  final RemoteRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
      uniqueIdPoolRemoteRepository;

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
        UniqueIdPoolSearchModel(status: IdStatus.unAssigned.toValue()),
      );
      final totalCount = await uniqueIdPoolLocalRepository.search(
        UniqueIdPoolSearchModel(),
      );
      emit(UniqueIdState.idCount(count.length, totalCount.length));
    } catch (e) {
      emit(UniqueIdState.failed(e.toString()));
    }
  }

  FutureOr<void> _fetchUniqueIdsFromServer(
      FetchUniqueIdsEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.fetching(0, 10));
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      List<UniqueIdPoolModel> idsList = [];
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      emit(const UniqueIdState.fetching(1, 10));

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(const NoInternetState());
      } else {
        int totalCount = 5;
        emit(const UniqueIdState.fetching(4, 10));

        var ids = await uniqueIdPoolRemoteRepository.search(
            limit: 5,
            offSet: 0,
            UniqueIdPoolSearchModel(
                deviceInfo: androidInfo.toString(),
                userUuid: RegistrationDeliverySingleton().loggedInUserUuid,
                deviceUuid: androidInfo.id,
                count: totalCount));

        await uniqueIdPoolLocalRepository.bulkCreate(ids);

        emit(const UniqueIdState.fetching(8, 10));
        emit(UniqueIdState.ids([]));
      }
    } catch (e) {
      emit(UniqueIdState.failed(e.toString()));
    }
  }

  FutureOr<void> _fetchAUniqueId(
      FetchAUniqueIdEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());

    try {
      final count = await uniqueIdPoolLocalRepository.search(
        UniqueIdPoolSearchModel(status: IdStatus.unAssigned.toValue()),
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

  const factory UniqueIdEvent.fetchUniqueIdsFromServer() = FetchUniqueIdsEvent;

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
}
