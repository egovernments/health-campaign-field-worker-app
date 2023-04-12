// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/complaints/complaints.dart';

part 'complaints_inbox.freezed.dart';

typedef ComplaintsInboxEmitter = Emitter<ComplaintInboxState>;

class ComplaintsInboxBloc
    extends Bloc<ComplaintInboxEvent, ComplaintInboxState> {
  ComplaintsInboxBloc(super.initialState) {
    on(_handleSaveComplaints);
  }

  FutureOr<void> _handleSaveComplaints(
    ComplaintInboxSaveComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        return;
      },
      complaints: (value) {
        emit(value.copyWith(complaintInboxItems: event.complaintInboxItems));
      },
    );
  }
}

@freezed
class ComplaintInboxState with _$ComplaintInboxState {
  const factory ComplaintInboxState.complaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = _ComplaintInboxState;
}

@freezed
class ComplaintInboxEvent with _$ComplaintInboxEvent {
  const factory ComplaintInboxEvent.saveComplaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = ComplaintInboxSaveComplaintsEvent;

  const factory ComplaintInboxEvent.addItem({
    ComplaintsInboxItem? complaintInboxItem,
  }) = ComplaintInboxAddComplaintEvent;
}
