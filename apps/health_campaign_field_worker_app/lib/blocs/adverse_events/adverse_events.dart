import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/entities/adverse_event.dart';

part 'adverse_events.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<AdverseEventsState>;

class AdverseEventsBloc extends Bloc<AdverseEventsEvent, AdverseEventsState> {
  final DataRepository<AdverseEventModel, AdverseEventSearchModel>
      adverseEventRepository;

  AdverseEventsBloc(
    super.initialState, {
    required this.adverseEventRepository,
  }) {
    on(_handleSubmit);
    on(_handleSearch);
  }

  FutureOr<void> _handleSubmit(
    AdverseEventsSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await adverseEventRepository.update(event.adverseEvent);
      } else {
        await adverseEventRepository.create(event.adverseEvent);
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSearch(
    AdverseEventsSearchEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<AdverseEventModel> adverseEvents =
          await adverseEventRepository.search(
        event.adverseEventSearch,
      );
      if (adverseEvents.isNotEmpty) {
        emit(state.copyWith(adverseEvents: adverseEvents));
      } else {
        emit(state.copyWith(adverseEvents: null));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class AdverseEventsEvent with _$AdverseEventsEvent {
  const factory AdverseEventsEvent.handleSubmit(
    AdverseEventModel adverseEvent,
    bool isEditing,
  ) = AdverseEventsSubmitEvent;

  const factory AdverseEventsEvent.handleSearch(
    AdverseEventSearchModel adverseEventSearch,
  ) = AdverseEventsSearchEvent;
}

@freezed
class AdverseEventsState with _$AdverseEventsState {
  const factory AdverseEventsState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<AdverseEventModel>? adverseEvents,
  }) = _AdverseEventsState;
}
