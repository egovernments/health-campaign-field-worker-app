// GENERATED using mason_cli
import 'dart:async';

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
    on(_fetchUniqueIds);
    on(_fetchAUniqueId);
  }

  FutureOr<void> _fetchIdCount(
      UniqueIdCountEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());

    final count = await uniqueIdPoolLocalRepository.search(
      UniqueIdPoolSearchModel(status: IdStatus.unAssigned.toValue()),
    );

    emit(UniqueIdState.idCount(count.length, 100));
  }

  FutureOr<void> _fetchUniqueIds(
      FetchUniqueIdsEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());
    List<int> idsList = [];
    for (int i = 0; i < 1; i++) {
      var id = await UniqueIdGeneration().generateUniqueId(
          localityCode: RegistrationDeliverySingleton().boundary!.code!,
          loggedInUserId: RegistrationDeliverySingleton().loggedInUserUuid!,
          returnCombinedIds:
              false); // TODO: Integrate with backend to fetch id's

      idsList.add(id);
    }

    await uniqueIdPoolLocalRepository.create(UniqueIdPoolModel(
      id: idsList.first.toString(),
      status: IdStatus.unAssigned.toValue(),
      userUUID: RegistrationDeliverySingleton().loggedInUserUuid!,
      clientReferenceId: RegistrationDeliverySingleton().loggedInUserUuid!,
    ));

    emit(UniqueIdState.ids(idsList
        .map((id) => UniqueIdPoolModel(
              id: id.toString(),
              status: IdStatus.unAssigned.toValue(),
              userUUID: RegistrationDeliverySingleton().loggedInUserUuid!,
              clientReferenceId:
                  RegistrationDeliverySingleton().loggedInUserUuid!,
            ))
        .toList()));
  }

  FutureOr<void> _fetchAUniqueId(
      FetchAUniqueIdEvent event, Emitter<UniqueIdState> emit) async {
    emit(const UniqueIdState.loading());

    final count = await uniqueIdPoolLocalRepository.search(
      UniqueIdPoolSearchModel(status: IdStatus.unAssigned.toValue()),
    );

    emit(UniqueIdState.aUniqueId(count.first));
  }
}

@freezed
class UniqueIdEvent with _$UniqueIdEvent {
  const factory UniqueIdEvent.fetchIdCount() = UniqueIdCountEvent;

  const factory UniqueIdEvent.fetchUniqueIds() = FetchUniqueIdsEvent;

  const factory UniqueIdEvent.fetchAUniqueId() = FetchAUniqueIdEvent;
}

@freezed
class UniqueIdState with _$UniqueIdState {
  const factory UniqueIdState.loading() = LoadingState;

  const factory UniqueIdState.idCount(int count, int totalCount) =
      UniqueIdCountState;

  const factory UniqueIdState.ids(List<UniqueIdPoolModel> ids) =
      FetchedUniqueIdsState;

  const factory UniqueIdState.aUniqueId(UniqueIdPoolModel aUniqueId) =
      FetchedUniqueIdState;
}
