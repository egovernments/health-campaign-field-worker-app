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

  UniqueIdBloc({required this.uniqueIdPoolLocalRepository})
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
      emit(const UniqueIdState.failed());
    }
  }

  FutureOr<void> _fetchUniqueIdsFromServer(
      FetchUniqueIdsEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.fetching(0, 0));
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      List<UniqueIdPoolModel> idsList = [];
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(const NoInternetState());
      } else {
        int totalCount = 10;
        for (int i = 0; i <= totalCount; i++) {
          // Emit the fetching state with the calculated progress
          emit(UniqueIdState.fetching(
              i, totalCount)); // Pass progressValue and 1.0 as total progress

          await Future.delayed(const Duration(seconds: 1));
          var id = await UniqueIdGeneration().generateUniqueId(
              localityCode: RegistrationDeliverySingleton().boundary!.code!,
              loggedInUserId: RegistrationDeliverySingleton().loggedInUserUuid!,
              returnCombinedIds:
                  false); // TODO: Integrate with backend to fetch id's

          idsList.add(UniqueIdPoolModel(
            id: id.toString(),
            status: IdStatus.unAssigned.toValue(),
            userUUID: RegistrationDeliverySingleton().loggedInUserUuid!,
            clientReferenceId:
                RegistrationDeliverySingleton().loggedInUserUuid!,
          ));
        }

        await uniqueIdPoolLocalRepository.bulkCreate(idsList);

        emit(UniqueIdState.ids(idsList));
      }
    } catch (e) {
      emit(const UniqueIdState.failed());
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
      emit(const UniqueIdState.failed());
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

  const factory UniqueIdState.failed() = FailedState;

  const factory UniqueIdState.aUniqueId(UniqueIdPoolModel aUniqueId) =
      FetchedUniqueIdState;

  const factory UniqueIdState.noInternet() = NoInternetState;
}
