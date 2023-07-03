// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/user.dart';
import '../../utils/typedefs.dart';

part 'user.freezed.dart';

typedef UserEmitter = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserDataRepository userDataRepository;
  UserBloc(
    super.initialState, {
    required this.userDataRepository,
  }) {
    on(_handleSearchUser);
  }

  FutureOr<void> _handleSearchUser(
    UserSearchUserEvent event,
    UserEmitter emit,
  ) async {
    final results = await userDataRepository.search(UserSearchModel());
    // handle logic for searchUser here
  }
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.searchUser() = UserSearchUserEvent;
}

@freezed
class UserState with _$UserState {
  const factory UserState.user() = UserUserState;
}
