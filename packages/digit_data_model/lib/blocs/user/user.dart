// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    try {
      final results = await userRemoteRepository
          .search(UserSearchModel(uuid: [event.uuid]));
      if (results.isNotEmpty) {
        emit(UserState.user(userModel: results.first));
      }
    } catch (error) {
      emit(const UserErrorState());
      rethrow;
    }
  }

  FutureOr<void> _handleUpdateUser(
    UserUpdateUserEvent event,
    UserEmitter emit,
  ) async {
    emit(const UserState.loading());
    try {
      final Response response = await userRemoteRepository.update(event.user);
      final responseMap = response.data;
      final Iterable entityResponse = await responseMap["user"];
      Iterable<Map<String, dynamic>> entityList =
          entityResponse.whereType<Map<String, dynamic>>();

      final results =
          entityList.map((e) => UserModelMapper.fromMap(e)).toList();
      emit(UserState.user(userModel: results.first));
    } on DioException catch (error) {
      // [TODO]- Need to create a model mapper for error;
      final String errorCode = error.response?.data['Errors'][0]['code'];
      emit(UserErrorState(errorCode));
      emit(UserState.user(userModel: event.oldUser));

      rethrow;
    }
  }
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.searchUser({required String uuid}) =
      UserSearchUserEvent;
  const factory UserEvent.updateUser({
    required UserModel user,
    required UserModel oldUser,
  }) = UserUpdateUserEvent;
}

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = UserEmptyState;
  const factory UserState.loading() = UserLoadingState;
  const factory UserState.user({UserModel? userModel}) = UserUserState;
  const factory UserState.error([String? error]) = UserErrorState;
}
