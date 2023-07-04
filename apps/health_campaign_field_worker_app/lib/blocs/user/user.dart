// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/data_repository.dart';
import '../../models/entities/user.dart';
part 'user.freezed.dart';

typedef UserEmitter = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteRepository<UserModel, UserSearchModel> userRemoteRepository;
  UserBloc(
    super.initialState, {
    required this.userRemoteRepository,
  }) {
    on(_handleSearchUser);
    on(_handleUpdateUser);
  }

  FutureOr<void> _handleSearchUser(
    UserSearchUserEvent event,
    UserEmitter emit,
  ) async {
    final results =
        await userRemoteRepository.search(UserSearchModel(uuid: [event.uuid]));
    emit(UserUserState(userModel: results.first));
  }

  FutureOr<void> _handleUpdateUser(
    UserUpdateUserEvent event,
    UserEmitter emit,
  ) async {
    final results = await userRemoteRepository.update(event.user);
  }
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.searchUser({required String uuid}) =
      UserSearchUserEvent;
  const factory UserEvent.updateUser({required UserModel user}) =
      UserUpdateUserEvent;
}

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = UserEmptyState;
  const factory UserState.user({UserModel? userModel}) = UserUserState;
}
