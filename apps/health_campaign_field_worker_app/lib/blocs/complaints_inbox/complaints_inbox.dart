// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/complaints/complaints.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';

part 'complaints_inbox.freezed.dart';

typedef ComplaintsInboxEmitter = Emitter<ComplaintInboxState>;

class ComplaintsInboxBloc
    extends Bloc<ComplaintInboxEvent, ComplaintInboxState> {
  final PgrServiceDataRepository pgrRepository;

  ComplaintsInboxBloc(
    super.initialState, {
    required this.pgrRepository,
  }) {
    on(_handleLoadComplaints);
  }

  FutureOr<void> _handleLoadComplaints(
    ComplaintInboxLoadComplaintsEvent event,
    ComplaintsInboxEmitter emit,
  ) async {
    if (event.updatedModels != null) {
      emit(state.copyWith(complaints: event.updatedModels!));

      return;
    }

    emit(state.copyWith(loading: true));
    final complaints = await pgrRepository.search(
      PgrServiceSearchModel(
        tenantId: envConfig.variables.tenantId,
      ),
    );

    emit(state.copyWith(loading: false, complaints: complaints));
  }
}

@freezed
class ComplaintInboxState with _$ComplaintInboxState {
  const factory ComplaintInboxState.complaints({
    @Default(false) bool loading,
    @Default([]) List<PgrServiceModel> complaints,
  }) = _ComplaintInboxState;
}

@freezed
class ComplaintInboxEvent with _$ComplaintInboxEvent {
  const factory ComplaintInboxEvent.loadComplaints([
    List<PgrServiceModel>? updatedModels,
  ]) = ComplaintInboxLoadComplaintsEvent;

  const factory ComplaintInboxEvent.saveComplaints({
    List<ComplaintsInboxItem>? complaintInboxItems,
  }) = ComplaintInboxSaveComplaintsEvent;

  const factory ComplaintInboxEvent.addItem({
    ComplaintsInboxItem? complaintInboxItem,
  }) = ComplaintInboxAddComplaintEvent;
}
