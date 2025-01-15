import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repository/geolocator_repository.dart';

part 'check_permissions.freezed.dart';

/// This is a cubit that checks if the user has granted the location permission
/// and emits the result to the UI.
///
///  * [CheckPermissionCubit] is a cubit that checks if the user has granted the location permission
///  * [CheckPermissionState] is the state of the cubit
///  * [check] is a method that checks if the user has granted the location permission
///  * [PermissionState] is a class that contains the result of the permission check
///  * [PermissionState.hasPermissions] is a boolean that indicates if the user has granted the location permission
///  * [PermissionState.error] is a string that contains the error message
class CheckPermissionCubit extends Cubit<PermissionState> {
  final GeolocatorRepository repository;

  CheckPermissionCubit({
    this.repository = const GeolocatorRepository(),
  }) : super(const PermissionState());

  void check() async {
    emit(state.copyWith(error: null, hasPermissions: false));
    try {
      final hasPermission = await repository.getPermission();
      state.copyWith(
        hasPermissions: hasPermission,
        error: null,
      );
    } on PermissionError catch (error) {
      emit(state.copyWith(
        hasPermissions: false,
        error: error.message ?? 'Something went wrong',
      ));
    } catch (error) {
      emit(state.copyWith(
        hasPermissions: false,
        error: error.toString(),
      ));
    }
  }
}

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState({
    @Default(false) bool hasPermissions,
    String? error,
  }) = _PermissionState;
}
