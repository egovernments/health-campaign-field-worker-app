// GENERATED using mason_cli
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/data_repository.dart';
import '../../models/data_model.mapper.g.dart';
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
    emit(const UserState.loading());
    final results =
        await userRemoteRepository.search(UserSearchModel(uuid: [event.uuid]));
    if (results.isNotEmpty) {
      emit(UserState.user(userModel: results.first));
    }
  }

  FutureOr<void> _handleUpdateUser(
    UserUpdateUserEvent event,
    UserEmitter emit,
  ) async {
    emit(const UserState.loading());
    final Response response = await userRemoteRepository.update(event.user);
    final responseMap = response.data;
    final Iterable entityResponse = await responseMap["user"];
    Iterable<Map<String, dynamic>> entityList =
        entityResponse.whereType<Map<String, dynamic>>();

    final results =
        entityList.map((e) => Mapper.fromMap<UserModel>(e)).toList();
    emit(UserState.user(userModel: results.first));
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
  const factory UserState.loading() = UserLoadingState;
  const factory UserState.user({UserModel? userModel}) = UserUserState;
}
