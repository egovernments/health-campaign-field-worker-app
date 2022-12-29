import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_hide_action.freezed.dart';

typedef TableHideActionEmitter = Emitter<TableHideActionState>;

class TableHideActionBloc
    extends Bloc<TableHideActionEvent, TableHideActionState> {
  TableHideActionBloc(super.initialState) {
    on<UpdateActionEvent>(_onupdateAction);
  }

  FutureOr<void> _onupdateAction(
    UpdateActionEvent event,
    TableHideActionEmitter emit,
  ) async {
    emit(state.copyWith(isOpen: !state.isOpen));
  }
}

@freezed
class TableHideActionEvent with _$TableHideActionEvent {
  const factory TableHideActionEvent.onupdateAction() = UpdateActionEvent;
}

@freezed
class TableHideActionState with _$TableHideActionState {
  const TableHideActionState._();
  const factory TableHideActionState({
    @Default(false) bool isOpen,
  }) = _TableHideActionState;
}
